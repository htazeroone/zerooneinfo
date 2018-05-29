package quizbox;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class AddProblemReg implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ActionData data = new ActionData();
		
		DAO dao = new DAO();
		Integer chid = Integer.parseInt(request.getParameter("num"));
		
		int page = 1;
		
		
		if(request.getParameter("page")!=null && !request.getParameter("page").equals("")) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		
		
		
		VO vo = new VO();
		vo.setChid(Integer.parseInt(request.getParameter("chid")));
		vo.setQuestion(request.getParameter("question"));
		vo.setS1(request.getParameter("s1"));
		vo.setS2(request.getParameter("s2"));
		vo.setS3(request.getParameter("s3"));
		vo.setS4(request.getParameter("s4"));
		vo.setS5(request.getParameter("s5"));
		vo.setAnswer(request.getParameter("answer"));
	
		String subject = request.getParameter("subject");
		request.setAttribute("page", page);
		
		
		
		request.setAttribute("sub", dao.subject(subject));
		request.setAttribute("subname", subject);
		request.setAttribute("num", request.getParameter("num"));
		request.setAttribute("chname", request.getParameter("chname"));
		request.setAttribute("menu", "quizmenu.jsp");
	
		
		dao.problem_insert(vo,subject);
		data.setRedirect(true);
		data.setPath("QuizMain");
		
		dao.close();
		
		return data;
	}

}
