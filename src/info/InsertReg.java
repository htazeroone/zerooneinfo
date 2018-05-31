package info;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.Action;
import model.ActionData;
import model.DAO;
import model.VO;

public class InsertReg implements Action{

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		ActionData data = new ActionData();
		
		DAO dao = new DAO();
		VO vo = new VO();
		
		vo.setKind(request.getParameter("kind"));
		vo.setPname(request.getParameter("pname"));
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		
		vo.setUpfile(fileupload(request));
		

		data.setPath("Detail?id="+dao.qinsert(vo)+"&page="+request.getParameter("page"));
		data.setRedirect(true);

		dao.close();
		
		return data;
	}

	String fileupload(HttpServletRequest request) {
		
		try {
			
			Part part = request.getPart("upfile");

			if(part.getContentType()!=null) {
				
				String filename="";
				
				for(String pp : part.getHeader("Content-Disposition").split(";"))
					if(pp.trim().startsWith("filename")) {
						filename=pp.substring(pp.indexOf("=")+1).trim().replace("\"", "");
					}
				
				if(!filename.equals("")) {
					return filesave(part,filename,request);
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}

		return "";
	}
	
	String filesave(Part part, String filename,HttpServletRequest request) {
		
		int pos = filename.lastIndexOf(".");
		
		String fileDo = filename.substring(0, pos);
		String exp = filename.substring(pos);
		
		/*String path = request.getRealPath("up")+"\\"+request.getParameter("kind")+"\\";*/
		String path = "C:\\Users\\ShinSaeRom\\Desktop\\승진\\Semi Proj WorkSpace\\SemiQuiz\\WebContent\\up\\"+request.getParameter("kind")+"\\";
		
		int cnt=0;
		File ff = new File(path+filename);
		
		while(ff.exists()) {
			cnt++;
			filename = fileDo+"_"+cnt+exp;
			ff = new File(path+filename);
		}
		
		try {
			part.write(path+filename);
			part.delete();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return filename;
	}
	
	
}
