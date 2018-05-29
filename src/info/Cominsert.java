package info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class Cominsert implements Action{

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	
		ActionData data = new ActionData();
		
		DAO dao = new DAO();
		VO vo = dao.qdetail(Integer.parseInt(request.getParameter("id")));
		
		vo.setTitle("[답변]"+vo.getTitle());
		vo.setContent("[답변]"+vo.getContent());
		  
		
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("data", vo);
		request.setAttribute("main", "info/comment.jsp");
		
		dao.close();
		
		return data;
	}
}
