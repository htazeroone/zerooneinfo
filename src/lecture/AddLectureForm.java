package lecture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;

public class AddLectureForm implements Action{
	
	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main", "lecture/addLectureForm.jsp");
		return new ActionData();
	}
}
