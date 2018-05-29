package quizbox;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;

public class ModifyProblemForm implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ActionData data = new ActionData();
		DAO dao = new DAO();
		Integer chid = Integer.parseInt(request.getParameter("num"));
		Integer id = Integer.parseInt(request.getParameter("id"));
		
		int page = 1;
		if(request.getParameter("page") != null && !request.getParameter("page").equals("")) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		String subject = request.getParameter("subject");
		request.setAttribute("page", page);
		request.setAttribute("problem", dao.modify_question(subject, chid, id));
		request.setAttribute("sub", dao.subject(subject));
		request.setAttribute("subname", subject);
		request.setAttribute("num", request.getParameter("num"));
		request.setAttribute("chname", request.getParameter("chname"));
		request.setAttribute("menu", "quizmenu.jsp");
		request.setAttribute("main1", "quizbox/ModifyProblemForm.jsp");
		
		
		dao.close();
		return data;	
	}

}
