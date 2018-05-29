package mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class IncorrectNote implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		
		String subject = "";
		if(request.getParameter("subject") != null && !request.getParameter("subject").equals("")) {
			subject = request.getParameter("subject");
		}
		
		/*String pid = (String)request.getParameter("pid");*/
		String pid ="";
		if(null!=session.getAttribute("pid")) {
			pid = (String)session.getAttribute("pid");
		}

		System.out.println("IncorrectNote 진입 ! pid:"+pid+ ", subject:" + subject);

		DAO dao = new DAO();
		VO vo = new VO();
		ArrayList<VO> chList = null;
		int chid = 0;
		
		//oxNum : 사용자가 선택한 챕터의 총 오답문제 수 
		int oxNum = 0;
		
		//읽어올 문제 데이터들
		ArrayList<VO> oxInfo = null;

		//사용자가 입력한답 뭉탱이
		ArrayList<String> input = new ArrayList<String>();
		
		//문제 번호와 사용자 입력값만 가진 리스트 
		ArrayList<VO> idAndInput = new ArrayList<VO>();
		
		//정답 확인 결과 
		ArrayList<VO> res = null;
		//학습노트에서 삭제하고 싶은 문제 번호 뭉탱이 
		ArrayList<Integer> deleteId = new ArrayList<Integer>();
		
		//pid의 study_note에 OX가 0인 데이터가 있나 없나 구분 
		if(dao.isOx(pid, subject)) { //있다면
			
			//pid의 study_note에 ox가 0인 것을 포함한 chid와 그 chaptername 들을 subjectboard에서 가져와 메뉴를 뿌려준다
			chList = dao.getOxList(pid, subject);		
			
			//메뉴에서 챕터를 클릭하지 않았다면, 
			if(request.getParameter("chid") == null) {
				System.out.println("가장 최신 챕터id: "+chList.get(0).getChid());				
				//chid: 현재 챕터 번호를 가장 최신 챕터번호로 지정 
				chid = chList.get(0).getChid();
				
			} else { //메뉴에서 챕터를 클릭했다면(또는 현재 챕터 값이 지정되어 있다면), 챕터의 문제들을 읽어온다 
				//chid: 클릭한 챕터번호를 저장 
				chid = Integer.parseInt(request.getParameter("chid"));
				System.out.println("사용자가 클릭한 챕터번호:"+chid);
			}
			
			System.out.println("chid:"+chid);
			
			//oxNum : 사용자가 선택한 챕터의 총 오답 수 
			oxNum = dao.oxNum(chid, pid, subject);
			System.out.println("oxNum 사용자가 선택한 챕터의 총 문제 수 :"+oxNum);
			
			//oxInfo: 해당 챕터의 오답문제 데이터들
			oxInfo = dao.oxInfo(chid, pid, subject);

			//오답노트에서 삭제할 문제id 들을 보낸경우, 
			if(null!=request.getParameterValues("deleteId") && request.getParameter("delete") != null) {
				System.out.println("삭제를 시작해볼까 ...2");
				String [] deleteInput = request.getParameterValues("deleteId");
				
				//체크된 ID만 추려냄
				for(int i=0; i<deleteInput.length; i++) {
					System.out.println("삭제하고 싶은 문제 id:"+deleteInput[i]);
					deleteId.add(Integer.parseInt(deleteInput[i]));	
				}
				
				//DB에서 deleteId 들만 study_note에서 삭제 
				dao.changeOx(pid, chid, deleteId, subject);
		
				//해당 챕터의 총 문제 수를 다시 센다 
				oxNum = dao.oxNum(chid, pid, subject);
			}
			System.out.println("oxNum 챕터의 총 오답 수 : "+oxNum);
			System.out.println("oxInfo.size():"+oxInfo.size());
			
			if(oxNum == 0) {
				String url = "../mypage/IncorrectNote?subject="+subject;
				String msg = "해당 Chapter의 모든 오답문제를 삭제했습니다.";

				request.setAttribute("msg", msg);
				request.setAttribute("url", url);			
				request.setAttribute("main", "mypage/alert.jsp");
			} else {
				//oxInfo: 해당 챕터의 문제 데이터 중 오답처리된 것들을 가져온다 
				oxInfo = dao.oxInfo(chid, pid, subject);
				request.setAttribute("menu", "chkmenu.jsp");
				request.setAttribute("main1", "mypage/chkpage.jsp");	
			}

			//사용자가 정답을 찍어서 보낸경우, (파라미터 이름은 문제 번호, 값은 선택지번호)
			if(oxInfo.size()!=0 && null!=request.getParameter(Integer.toString(oxInfo.get(0).getId()))){		
				System.out.println("정답 확인을 시작해볼까...");
				
				for(int i=0; i<oxInfo.size(); i++) {
					input.add(request.getParameter(Integer.toString(oxInfo.get(i).getId())));
					System.out.println("input답:"+input.get(i));
				}
				
				//idList : 답을 확인 할 '문제번호 리스트'를 생성
				ArrayList<Integer> idList = new ArrayList<>();
				for(int i=0; i<oxInfo.size(); i++) {
					idList.add(oxInfo.get(i).getId());
					System.out.println("답 맞춰볼 문제번호 리스트:"+idList.get(i));
				}
				
				//incorrectRes : 문제 번호와 사용자 입력 답을 입력하여 정오답 결과 및 정답 리턴
				//res : id, ox, answer, input(지금말고 이전에 선택했던 답) 을 가지고있다 
				res = dao.incorrectRes(pid, chid, idList, input, subject);			
				System.out.println("res???" + res);
				
				//idAndInput : 문제 번호, 보기, 사용자 입력값만 가진 리스트 
				for(int i=0; i<oxInfo.size(); i++) {
					VO inputVo = new VO();
					inputVo.setQuestion(oxInfo.get(i).getQuestion());
					inputVo.setCorrection(oxInfo.get(i).getCorrection());
					inputVo.setTotal(oxInfo.get(i).getTotal());
					inputVo.setId(oxInfo.get(i).getId());
					inputVo.setInput(input.get(i));
					inputVo.setAnswer(oxInfo.get(i).getAnswer());
					inputVo.setS1(oxInfo.get(i).getS1());
					inputVo.setS2(oxInfo.get(i).getS2());
					inputVo.setS3(oxInfo.get(i).getS3());
					inputVo.setS4(oxInfo.get(i).getS4());
					inputVo.setS5(oxInfo.get(i).getS5());
					idAndInput.add(inputVo);
				}
				//사용자가 찍은 정답들이 그대로 보이게 다시 보내준다 
				request.setAttribute("idAndInput", idAndInput);
				
/*				//다음문제 풀기
				request.setAttribute("page", page);
				request.setAttribute("totalPage", totalPage); */
			}//사용자가 정답을 찍어서 보낸경우
	
			request.setAttribute("res", res);
			request.setAttribute("chList", chList);
			request.setAttribute("chid", chid);
			request.setAttribute("oxInfo", oxInfo);
			request.setAttribute("subject", subject);
			
		}else { //--오답노트에 데이터가 없다면
			System.out.println("study_note에 관련 데이터가 없어서 빈 화면 출력");
			String url = "../main/Main";
			String msg = "추가문제가 있을 때만 사용가능합니다.";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);			
			request.setAttribute("main", "mypage/alert.jsp");
		}

		dao.close();
		return new ActionData();
	}
}
