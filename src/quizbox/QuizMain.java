package quizbox;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;

public class QuizMain implements Action{
	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ActionData data = new ActionData();
		System.out.println(data);
		DAO dao = new DAO();
		System.out.println(dao);
//		Integer chid = Integer.parseInt(request.getParameter("num"));
		String subject = request.getParameter("subject");
		request.setAttribute("sub", dao.subject(subject));
		request.setAttribute("subname", subject);
		request.setAttribute("num", request.getParameter("num"));
		request.setAttribute("chname", request.getParameter("chname"));
		request.setAttribute("menu", "quizmenu.jsp");
		request.setAttribute("main1", "quizbox/quizproblem.jsp");
		
		dao.close();
		return data;
	}
}
