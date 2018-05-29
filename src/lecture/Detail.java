package lecture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;

public class Detail implements Action {
	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		
		int id = Integer.parseInt(request.getParameter("id"));
		DAO dao = new DAO();
		
		if(request.getParameter("pid") != null && !request.getParameter("pid").equals("")) {
			
			String pid = request.getParameter("pid");
			dao.readLecture(id, pid);
		} else {
			dao.addCnt_Lecture(id);
			
		}
		
		request.setAttribute("data", dao.detail_Lecture(id));
		request.setAttribute("chapName", dao.getChapterName(id));
		
		dao.close();
		request.setAttribute("main", "lecture/detail.jsp");
		
		return new ActionData();
	}
}
