package lecture;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
import model.DAO;

public class AddLectureReg implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		
		String boardName = request.getParameter("boardName");
		ArrayList<String> chapterName = new ArrayList<>();
		System.out.println("boardName: "+boardName);
		
		chapterName.add("전체");
		for(int i = 1; i<=10; i++) {
			if(!request.getParameter("chapNum"+i).equals("")) {
				chapterName.add(request.getParameter("chapNum"+i));
			}
		}
		
		for(String ch : chapterName) {	
			System.out.println(ch);
		}
		
		DAO dao = new DAO();
		dao.addNewLecture(boardName, chapterName);
		dao.close();
		
		return new ActionData();
	}
}
