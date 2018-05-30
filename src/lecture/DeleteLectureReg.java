package lecture;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;

public class DeleteLectureReg implements Action{

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		
		String delSubject = request.getParameter("subject");
		System.out.println(delSubject);
		DAO dao = new DAO();
		dao.deleteSubject(delSubject);
		ArrayList<String> subjects = dao.getSubjects();		
		
		
		dao.close();

		request.setAttribute("msg", delSubject+"과목이 삭제됐습니다.");
		request.setAttribute("url", "../main/Main");
		request.setAttribute("main", "lecture/alert.jsp");
		return new ActionData();
	}
}
