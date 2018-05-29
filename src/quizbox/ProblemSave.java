package quizbox;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class ProblemSave implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		ActionData data = new ActionData();
		DAO dao = new DAO();

		Integer chid = Integer.parseInt(request.getParameter("num"));
		String pid = (String) request.getSession().getAttribute("pid");
		String subject = request.getParameter("subject");

		int page = 1;
		int limit = 4, pageLimit = 1;

		if (request.getParameter("page") != null && !request.getParameter("page").equals("")) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int start = (page - 1) * limit + 1;
		int end = page * limit;

		int startPage = (page - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;

		int total = dao.totalCount(chid);

		int totalPage = total / limit;

		if (total % limit != 0)
			totalPage++;

		if (endPage > totalPage)
			endPage = totalPage;

		String[] ssids = request.getParameterValues("saveId");
		
		VO vo = new VO();
		vo.setChid(chid);
		vo.setPid(pid);

		for (String ss : ssids) {
			int sid = Integer.parseInt(ss);
			vo.setId(Integer.parseInt(request.getParameter("qqid"+sid)));
			vo.setSave(1);
			dao.problem_save(vo, subject);

		}


		request.setAttribute("page", page);
		request.setAttribute("start", start);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("problem", dao.question(subject, chid, start, end));
		request.setAttribute("result", dao.result(subject, pid, chid, start, end));
		request.setAttribute("sub", dao.subject(subject));
		request.setAttribute("subname", subject);
		request.setAttribute("num", request.getParameter("num"));
		request.setAttribute("chname", request.getParameter("chname"));
		request.setAttribute("menu", "quizmenu.jsp");
		request.setAttribute("main1", "quizbox/quizproblem.jsp");

		dao.close();

		return data;
	}

}
