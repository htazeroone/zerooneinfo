package lecture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class DeleteReg implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		
		VO vo = new VO();
		vo.setId(Integer.parseInt(request.getParameter("id")));
		
		DAO dao = new DAO();
		
		String msg = "삭제 실패";
		String url = "Detail?id="+vo.getId()+"&subject="+request.getParameter("subject");
		
		if(dao.search_Lecture(vo)) {
			dao.delete_Lecture(vo.getId());
			msg = "삭제 성공";
			url = "List?subject="+request.getParameter("subject");
		}
		
		dao.close();
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("main", "lecture/alert.jsp");
		
		return new ActionData();
	}
}
