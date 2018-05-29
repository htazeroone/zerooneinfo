package lecture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;

public class InsertForm implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main", "lecture/insertForm.jsp");
		
		DAO dao = new DAO();
		request.setAttribute("chapList", dao.getChapterList(request.getParameter("subject")));
		dao.close();
		
		return new ActionData();
	}
}
