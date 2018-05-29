package info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;

public class Modify implements Action{

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	
		ActionData data = new ActionData();
		
		DAO dao = new DAO();
		
		request.setAttribute("page", request.getParameter("page"));
		
		request.setAttribute("data", dao.qdetail(Integer.parseInt(request.getParameter("id"))) );
		request.setAttribute("main", "info/modify.jsp");
		
		dao.close();
		return data;
	}
}
