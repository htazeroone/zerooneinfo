package lecture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class ModifyReg implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		VO vo = new VO();
		
		vo.setId(Integer.parseInt(request.getParameter("id")));
		
		String msg = "수정 실패";
		String url = "ModifyForm?id="+vo.getId()+"&subject="+request.getParameter("subject");
		
		DAO dao = new DAO();
		if(dao.search_Lecture(vo)) {
			vo.setHead(Integer.parseInt(request.getParameter("head")));
			vo.setPname(request.getParameter("pname"));
			vo.setTitle(request.getParameter("title"));
			vo.setContent(request.getParameter("content"));

			dao.modify_Lecture(vo, request.getParameter("subject"));
			msg = "수정 성공";
			url = "Detail?id="+vo.getId()+"&subject="+request.getParameter("subject");
		}
		
		dao.close();
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("main", "lecture/alert.jsp");
		
		return new ActionData();
	}

}