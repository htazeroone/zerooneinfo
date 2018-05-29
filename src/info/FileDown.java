package info;

import java.io.FileInputStream;
import java.net.URLEncoder;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Action;
import model.ActionData;

public class FileDown implements Action{
	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub		
		String filename = request.getParameter("file");
		String kind = request.getParameter("kind");
		String path = request.getRealPath("up")+"\\"+kind;
		System.out.println(request.getRealPath("up")+"\\"+kind);
		//path = "C:\\Users\\JHTA\\git\\zeroone\\WebContent\\up\\"+kind;

		try {

			String en = URLEncoder.encode(filename,"utf-8");
			
			response.setHeader("Content-Disposition", "attachment;filename="+en);
			
			ServletOutputStream sos = response.getOutputStream();
			
			FileInputStream fis = new FileInputStream(path+"\\"+filename);
			
			byte [] buf = new byte[1024];
			
			while(fis.available()>0) {
				
				int len = fis.read(buf);
				sos.write(buf,0,len);
			}
			
			fis.close();
			sos.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
}
