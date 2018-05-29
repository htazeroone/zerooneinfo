package info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class Replyinsert implements Action{

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		ActionData data = new ActionData();
		
		DAO dao = new DAO();
		VO vo = new VO();
		
		System.out.println("댓글 : "+request.getParameter("content"));
		vo.setContent(request.getParameter("content"));
		vo.setPname(request.getParameter("pname"));
		vo.setId(Integer.parseInt(request.getParameter("id")));
		
		int page = Integer.parseInt(request.getParameter("page"));
		
		dao.replyinsert(vo);
		data.setRedirect(true);
		data.setPath("Detail?id="+vo.getId()+"&page="+page+"&cnt=no");
		
		dao.close();
		
		return data;
	}
}
