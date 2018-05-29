package main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;

public class Main implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main", "main.jsp");
		return new ActionData();
	}

}
