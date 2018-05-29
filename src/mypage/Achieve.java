package mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class Achieve implements Action {

	@Override  
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		/*String pid = (String)request.getParameter("pid");*/
		String subject = "";
		if(request.getParameter("subject") != null && !request.getParameter("subject").equals("")) {
			subject = request.getParameter("subject");
		}
		  
		
		String pid = "";
		if(request.getParameter("pid") != null && !request.getParameter("pid").equals("")) {
			pid = request.getParameter("pid");
		} else {
			pid = (String)session.getAttribute("pid");
		}
		
		
		
		//String pid = (String)session.getAttribute("pid");
		System.out.println("Achieve2 진입 성공! pid:"+pid);
		DAO dao = new DAO();
		VO vo = new VO();

		//모든 챕터 안의 문제 수
		ArrayList<Integer> eachQNum = dao.eachQNum(subject);
		request.setAttribute("eachQNum", eachQNum);

		//studyQNum : 지금pid의 chid마다의 푼 문제 개수
		//ArrayList<Integer> studyQNum = dao.studyQNum(pid);
		ArrayList<VO> studyQNum = dao.studyQNum(pid, subject);

		//eachONum : 지금pid의 chid마다의 ox==1인 (맞은)문제 개수
		ArrayList<VO> eachONum = null;

		//eachXNum : 지금pid의 chid마다의 ox==0인 (틀린)문제 개수
		ArrayList<VO> eachXNum = null;

		//사용자가 문제를 풀어본 데이터가 있는 경우 수행
		if(studyQNum.size()!=0) {
			//전체 챕터 수
			int totalChNum = dao.totalChNum(subject);
			request.setAttribute("totalChNum", totalChNum);

			//전체 챕터 이름 ArrayList
			ArrayList<String> chName = dao.totalChName(subject);
			System.out.println("전체 챕터 이름 출력");
			for(String s : chName) {
				//System.out.println(s);
			}
			request.setAttribute("chName", chName);

			eachONum = dao.eachONum(pid, subject);
			eachXNum = dao.eachXNum(pid, subject);

			//resultONum : ch마다의 맞은 개수
			ArrayList<Integer> resultONum = new ArrayList<>();

			//resultXNum : ch마다의 틀린 개수
			ArrayList<Integer> resultXNum = new ArrayList<>();

			request.setAttribute("eachONum", eachONum);
			System.out.println("eachONum.size():"+eachONum.size());
			System.out.println("eachXNum.size():"+eachXNum.size());
			System.out.println("studyQNum.size():"+studyQNum.size());

			//totalChNum : 전체 챕터 수
			int nono=0;
			for(int total=1; total<=totalChNum; total++)
			{
				for(int chSeq=0; chSeq<studyQNum.size(); chSeq++) {
					//System.out.println("chSeq 시작 :"+chSeq);
					int temp = studyQNum.get(chSeq).getChid();
					//System.out.println("찾을 챕터"+eachOXNum.get(chSeq).getChid());
					//System.out.println("total:"+total+"temp:"+temp);

					//사용자가 푼 챕터 발견시,

					if(temp==total) {
						System.out.println("찾았다! total:"+total+" temp:"+temp+", chSeq"+chSeq);

						for(int i=0; i<eachONum.size(); i++) {
							if(temp==eachONum.get(i).getChid()) {
								System.out.println("studyQNum.get(chSeq).getOx():"+studyQNum.get(chSeq).getOx());
								System.out.println("eachONum.get(i).getOx():"+eachONum.get(i).getOx());
								resultONum.add(eachONum.get(i).getOx());
								if(studyQNum.get(chSeq).getOx()==eachONum.get(i).getOx()) {
									resultXNum.add(0);
								}
							}
						}
						for(int i=0; i<eachXNum.size(); i++) {
							if(temp==eachXNum.get(i).getChid()) {
								System.out.println("studyQNum.get(chSeq).getOx():"+studyQNum.get(chSeq).getOx());
								System.out.println("eachXNum.get(i).getOx():"+eachXNum.get(i).getOx());
								resultXNum.add(eachXNum.get(i).getOx());
								if(studyQNum.get(chSeq).getOx()==eachXNum.get(i).getOx()) {
									resultONum.add(0);
								}
							}
						}
						//break;
					}else {
						System.out.println("아니얌");
						System.out.println("nono: "+nono);
						nono++;
						if(studyQNum.size()==nono) {
							System.out.println("nono:"+nono);
							resultONum.add(0);
							resultXNum.add(0);
						}

					}
				}
				nono=0;
			}
			for(int ii : resultONum) {
				System.out.println("ch마다의 맞은 개수  resultONum:"+ii);
			}

			for(int ii : resultXNum) {
				System.out.println("ch마다의 틀린 개수  resultXNum:"+ii);
			}

			ArrayList<Integer> resultTotalNum = new ArrayList<>();
			for(int i=0; i<totalChNum; i++) {
				resultTotalNum.add(resultONum.get(i)+resultXNum.get(i));
			}


			request.setAttribute("resultONum", resultONum);
			request.setAttribute("resultXNum", resultXNum);
			request.setAttribute("resultTotalNum", resultTotalNum);
			request.setAttribute("main", "mypage/achieve.jsp");
			request.setAttribute("subject", subject);
			
			
		}else {
			//사용자가 문제를 한번도 안풀어본 경우 수행
			request.setAttribute("main", "mypage/achieve_empty.jsp");
		}


		dao.close();

		return new ActionData();
	}

}
