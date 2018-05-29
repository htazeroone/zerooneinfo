package info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;


public class Delete implements Action{

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		ActionData data = new ActionData();
		
		DAO dao = new DAO();
		
		
		dao.qdelete(Integer.parseInt(request.getParameter("id")));
		
		String kind = request.getParameter("kind");
		
		
		data.setPath("List?kind="+kind);
		
		data.setRedirect(true);
		
		dao.close();
		
		return data;
	}
}
