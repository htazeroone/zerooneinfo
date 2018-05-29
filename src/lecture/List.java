package lecture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;

public class List implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		
		String subject = "java";
		
		if(request.getParameter("subject") != null && !request.getParameter("subject").equals("")) {
			subject = request.getParameter("subject");
		}
		int page=1, limit = 4, pageLimit = 3;
		
		DAO dao = new DAO();
		
		// 여기서 말거리 기능 생각해보기!
		int head = 0;
		
		if(request.getParameter("head") != null && !request.getParameter("head").equals("")) {
			head = Integer.parseInt(request.getParameter("head"));
		}
		// head가 결정됐고 head가 0이라면 --> 총 글의 수를 알아야 함.
		// head가 결정됐고 head가 0이 아니라면 --> 총 글의 수가 아니라 챕터별 글의 수를 알아야 함.
		
		// 해당의 경우에 따른 글의 총 개수가 몇개인지를 알아낸다. total
		int total = dao.totalCnt_Lecture(subject, head);
		int totalPage = total/limit;
		
		if( total % limit != 0) {
			totalPage++;
		}
		
		if(request.getParameter("id") != null && !request.getParameter("id").equals("")) {
			
			int rnum = dao.getRnum_Lecture(subject, Integer.parseInt(request.getParameter("id")), head);
			page = rnum / limit;
			
			if(rnum % limit != 0) {
				page++;
			}
		}
		
		if(request.getParameter("page") != null && !request.getParameter("page").equals("")) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		int start = (page-1) * limit + 1;
		int end = page * limit;
		
		int startPage = (page-1)/pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		request.setAttribute("subject", subject);
		request.setAttribute("head", head);
		request.setAttribute("page", page);
		request.setAttribute("start", start);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("data", dao.list_Lecture(subject, start, end, head));
		
		
		if(request.getSession().getAttribute("pid") != null && !request.getSession().getAttribute("pid").equals("")) {
			request.setAttribute("readList", dao.getReadList((String)request.getSession().getAttribute("pid")));
		}
		
		request.setAttribute("chapList", dao.getChapterList(subject));
		
		dao.close();
		
		request.setAttribute("main", "lecture/list.jsp");
		return new ActionData();
	}
}
