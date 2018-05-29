package mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;

public class ModifyPwForm implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {

		request.setAttribute("main", "mypage/modify_pw_form.jsp");
		return new ActionData();
	}

}
