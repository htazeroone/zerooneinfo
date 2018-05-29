package login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class LoginReg implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("LoginReg 진입");
		String pid = request.getParameter("pid");
		String pw = request.getParameter("pw");
		String pname = null;

		String msg = "아이디와 비밀번호를 확인해주세요 ";
		String url = "../login/LoginForm";
		DAO dao = new DAO();
		VO vo = new VO();
		vo.setPid(pid);
		vo.setPw(pw);
		VO res = dao.loginReg(vo);

		//loginReg결과, pname에  "" 또는 값이 넘어온다
		if(res!=null) {
			 msg = "로그인성공";
			 url = "../main/Main";
			 pname = res.getPname();
		}

		dao.close();

		request.setAttribute("pid", pid);
		request.setAttribute("pname", pname);
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("main", "mypage/alert.jsp");

		return new ActionData();
	}

}
