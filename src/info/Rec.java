package info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;

public class Rec implements Action{

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		ActionData data = new ActionData();
		
		DAO dao = new DAO();
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		dao.qnrec(id);
		
		
		
		data.setRedirect(true);
		data.setPath("Detail?id="+id+"&page="+request.getParameter("page")+"&cnt=no");

		
		dao.close();
		
		return data;
	}
}
