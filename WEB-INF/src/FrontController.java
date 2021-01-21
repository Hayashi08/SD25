import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import tool.Action;

public class FrontController extends HttpServlet {
	
	public void doPost(
		HttpServletRequest request, HttpServletResponse response
	) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		try {
			
			String class_name = request.getParameter("class_name");
			Action action = (Action)Class.forName(class_name).newInstance();
			String url = action.execute(request, response);
			request.getRequestDispatcher(url).forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace(out);
		}
		
	}
	
	public void doGet(
		HttpServletRequest request, HttpServletResponse response
	) throws ServletException, IOException {
		
		doPost(request, response);
		
	}
	
}
