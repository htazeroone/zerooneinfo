package login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;

public class JoinForm implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {

		request.setAttribute("main", "mypage/join_form.jsp");
		return new ActionData();
	}

}
