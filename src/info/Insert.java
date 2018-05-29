package info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;

public class Insert implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ActionData data = new ActionData();
		
		request.setAttribute("kind", request.getParameter("kind"));
		
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("main", "info/insert.jsp");
		
		return data;
	}

}
