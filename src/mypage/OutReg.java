package mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class OutReg implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		String pid = request.getParameter("pid");
		String pw = request.getParameter("pw");

		String url = "../mypage/OutForm";
		String msg = "기존 비밀번호를 확인해주세요";

		DAO dao = new DAO();
		VO vo = new VO();
		vo.setPid(pid);
		vo.setPw(pw);

		//기존 비밀번호가 맞는지 확인하고,
		if(dao.pwChk(vo)) {
			dao.deleteMember(vo);
			msg = "탈퇴되었습니다";
			url = "../main/Main";
			request.setAttribute("out", "out");
		}
		dao.close();

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("main", "mypage/alert.jsp");

		return new ActionData();
	}

}
