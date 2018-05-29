package mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class ModifyPwReg implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		String oldpw = request.getParameter("oldpw");
		String newpw = request.getParameter("newpw1");
		String pid = request.getParameter("pid");

		String url = "../mypage/ModifyPwForm";
		String msg = "기존 비밀번호를 확인해주세요";

		System.out.println("ModifyPwReg 진입");
		System.out.println("pid:"+pid);

		DAO dao = new DAO();
		VO vo = new VO();
		vo.setPid(pid);
		vo.setPw(oldpw);

		//기존 비밀번호가 맞는지 확인하고,

		if(dao.pwChk(vo)) {
			//맞다면 새비밀번호로 업데이트
			vo.setPw(newpw);
			dao.pwUpdate(vo);
			msg = "비밀번호 수정 완료";
			url = "../main/Main";

		}
		//틀리다면 비밀번호 수정 페이지로..

		dao.close();

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("main", "mypage/alert.jsp");

		return new ActionData();
	}

}
