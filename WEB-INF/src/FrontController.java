import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import tool.Action;

public class FrontController extends HttpServlet {
	
	public void doPost(
		HttpServletRequest request, HttpServletResponse response
	) throws ServletException, IOException {
		
	    request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// セッションチェック
		if (request.getSession(true).getAttribute("id") == null) {
            response.sendRedirect("/SD25/");
        }
		
		try {
			
			String class_name = request.getParameter("class_name");
			class_name = "action." + class_name;
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
