package lecture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;

public class ModifyForm implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		
		int id = Integer.parseInt(request.getParameter("id"));
		DAO dao = new DAO();
		request.setAttribute("data", dao.detail_Lecture(id));
		request.setAttribute("chapList", dao.getChapterList(request.getParameter("subject")));
		request.setAttribute("chapName", dao.getChapterName(id));
		dao.close();
		request.setAttribute("main", "lecture/modifyForm.jsp");
		
		return new ActionData();
	}
}
