package info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class Comreg implements Action{

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	
		ActionData data = new ActionData();
		
		DAO dao = new DAO();
		VO vo = new VO();
		
		vo.setId(Integer.parseInt(request.getParameter("id")));
		vo.setTitle(request.getParameter("title"));
		vo.setPname(request.getParameter("pname"));
		vo.setContent(request.getParameter("content"));
		
		int id = dao.cominsert(vo);
		
		data.setRedirect(true);
		data.setPath("Detail?id="+id+"&page="+request.getParameter("page"));
		
	
		dao.close();
		
		return data;
	}
	
}
