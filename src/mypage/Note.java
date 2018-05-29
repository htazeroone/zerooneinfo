package mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class Note implements Action {

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

		System.out.println("Note 진입 ! pid:"+pid);

		DAO dao = new DAO();
		VO vo = new VO();
		ArrayList<VO> chList = null;
		int chid = 0;
		//qNum : 사용자가 선택한 챕터의 총 문제 수 
		int qNum = 0;
		//읽어올 문제 데이터들
		ArrayList<VO> qInfo = null;

		//사용자가 입력한답 뭉탱이
		ArrayList<String> input = new ArrayList<String>();
		
		//문제 번호와 사용자 입력값만 가진 리스트 
		ArrayList<VO> idAndInput = new ArrayList<VO>();
		
		//정답 확인 결과 
		ArrayList<VO> res = null;
		//학습노트에서 삭제하고 싶은 문제 번호 뭉탱이 
		ArrayList<Integer> deleteId = new ArrayList<Integer>();
		//삭제할 문제 개수
		int deleteIdSize = 0;

		//사용자의 study_note에 데이터가 있나 없나  구분 
		if(dao.isDataInNote(pid, subject)) { //--학습노트에 데이터가 있다면
			//pid의 study_note에 있는 chid 들을 가져와 메뉴를 뿌려준다
			chList = dao.getChidList(pid, subject);		
			
			//메뉴에서 챕터를 클릭하지 않았다면, 
			if(null==request.getParameter("chid")) {
				System.out.println("가장 최신 챕터id: "+chList.get(0).getChid());				
				//chid: 현재 챕터 번호를 가장 최신 챕터번호로 지정 
				chid = chList.get(0).getChid();
				
			}else { //메뉴에서 챕터를 클릭했다면(또는 현재 챕터 값이 지정되어 있다면), 챕터의 문제들을 읽어온다 
				//chid: 클릭한 챕터번호를 저장 
				chid = Integer.parseInt(request.getParameter("chid"));
				System.out.println("사용자가 클릭한 챕터번호:"+chid);
			}
			System.out.println("chid:"+chid);
			//qNum : 사용자가 선택한 챕터의 총 문제 수 
			qNum = dao.qNum(chid, pid, subject);
			System.out.println("qNum 사용자가 선택한 챕터의 총 문제 수 :"+qNum);
			//qInfo: 챕터의 문제 데이터 
			qInfo = dao.qInfo(chid, pid, subject);
			
			
			if(null!=request.getParameterValues("deleteId")&&null!=request.getParameter("delete")) {
				System.out.println("삭제를 시작해볼까 ...2");
				String [] deleteInput = request.getParameterValues("deleteId");
				
				//체크된 ID만 추려냄
				for(int i=0; i<deleteInput.length; i++) {
					System.out.println("삭제하고 싶은 문제 id:"+deleteInput[i]);
					deleteId.add(Integer.parseInt(deleteInput[i]));	
				}
				deleteIdSize = deleteId.size();
				//DB에서 deleteId 들만 study_note에서 삭제 
				dao.deleteId(pid, chid, deleteId, deleteIdSize, subject);
		
				//해당 챕터의 총 문제 수를 다시 센다 
				qNum = dao.qNum(chid, pid, subject);
				

			}
			System.out.println("qNum 챕터의 총 문제 수 : "+qNum);
			System.out.println("qInfo.size():"+qInfo.size());
			
			if(qNum==0) {
				String url = "../mypage/Note?subject="+subject;
				String msg = "해당 Chapter의 모든 문제를 삭제했습니다.";

				request.setAttribute("msg", msg);
				request.setAttribute("url", url);			
				request.setAttribute("main", "mypage/alert.jsp");
			} else {
				qInfo = dao.qInfo(chid, pid, subject);
				request.setAttribute("menu", "studymenu.jsp");
				request.setAttribute("main1", "mypage/studypage.jsp");

			}
			

			//사용자가 정답을 찍어서 보낸경우, (파라미터 이름은 문제 번호, 값은 선택지번호)
			if(qInfo.size()!=0 && null!=request.getParameter(Integer.toString(qInfo.get(0).getId()))){		
				System.out.println("정답 확인을 시작해볼까...");
				
				
				for(int i=0; i<qInfo.size(); i++) {
					input.add(request.getParameter(Integer.toString(qInfo.get(i).getId())));
					System.out.println("input답:"+input.get(i));
				}
				
				//idList : 답을 확인 할 '문제번호 리스트'를 생성
				ArrayList<Integer> idList = new ArrayList();
				for(int i=0; i<qInfo.size(); i++) {
					idList.add(qInfo.get(i).getId());
					System.out.println("답 맞춰볼 문제번호 리스트:"+idList.get(i));
				}
				
				//quizRes : 문제 번호와 사용자 입력 답을 입력하여 정오답 결과 및 정답 리턴
				//res : id, ox, answer, input 을 가지고있다 
				res = dao.quizRes(pid, chid, idList, input, subject);			
				System.out.println(res);
				
				//idAndInput : 문제 번호, 보기, 사용자 입력값만 가진 리스트 
				for(int i=0; i<qInfo.size(); i++) {
					VO inputVo = new VO();
					inputVo.setQuestion(qInfo.get(i).getQuestion());
					inputVo.setCorrection(qInfo.get(i).getCorrection());
					inputVo.setTotal(qInfo.get(i).getTotal());
					inputVo.setId(qInfo.get(i).getId());
					inputVo.setInput(input.get(i));
					inputVo.setS1(qInfo.get(i).getS1());
					inputVo.setS2(qInfo.get(i).getS2());
					inputVo.setS3(qInfo.get(i).getS3());
					inputVo.setS4(qInfo.get(i).getS4());
					inputVo.setS5(qInfo.get(i).getS5());
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
			request.setAttribute("qInfo", qInfo);
			request.setAttribute("subject", subject);
			
		}else { //--학습노트에 데이터가 없다면
			System.out.println("study_note에 관련 데이터가 없어서 빈 화면 출력");
			String url = "../main/Main";
			String msg = "학습노트의 문제가 모두 삭제되었습니다.";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);			
			request.setAttribute("main", "mypage/alert.jsp");
		}

		dao.close();
		

		return new ActionData();
	}

}
