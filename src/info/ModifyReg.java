package info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class ModifyReg implements Action{

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		ActionData data = new ActionData();
		
		DAO dao = new DAO();
		VO vo = new VO();
		
		String id = request.getParameter("id");
		
		vo.setId(Integer.parseInt(id));
		vo.setPname(request.getParameter("pname"));
		vo.setUpfile(request.getParameter("upfile"));
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		
		dao.modify(vo);
		
		data.setRedirect(true);
		data.setPath("Detail?id="+id);

		dao.close();
		
		return data;
	}
	
}
