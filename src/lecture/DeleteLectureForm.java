package lecture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;

public class DeleteLectureForm implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		
		DAO dao = new DAO();
		request.setAttribute("subjects", dao.getSubjects());
		request.setAttribute("main", "lecture/deleteLectureForm.jsp");
		dao.close();
		return new ActionData();
	}
}