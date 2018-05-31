package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;
  

/**
 * Servlet implementation class Fcontroler
 */
@WebServlet("/quiz/*")

@MultipartConfig(
		location="C:\\tomcat\\temp",
		maxFileSize=1024*5000,
		maxRequestSize=1024*1024*100,
		fileSizeThreshold=1024*1024*10
)

public class Fcontroler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fcontroler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
	
		String cl = request.getRequestURI().substring((request.getContextPath()+"/quiz").length()+1);
		System.out.println(cl);
		String[] cls = cl.split("/");
		

		try {
			Action action = (Action)Class.forName(cls[0]+"."+cls[1]).newInstance();
			ActionData data = action.execute(request, response);
			
			if(data!=null) {
				
				if(data.isRedirect()) {
					response.sendRedirect(data.getPath());
				}
				else {
					request.getRequestDispatcher("/temp.jsp").
					forward(request, response);
				}
				
			}
		} catch (Exception e) {
			// TODO: handle exception
	
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
