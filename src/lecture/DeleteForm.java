package lecture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;

public class DeleteForm implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		
		String cf = "정말로 글을 삭제하시겠습니까?";
		String url = "DeleteReg?id="+request.getParameter("id")+"&subject="+request.getParameter("subject");
		
		request.setAttribute("cf", cf);
		request.setAttribute("url", url);
		request.setAttribute("main", "lecture/delete.jsp");
		
		return new ActionData();
	}
}
