package action.login;

import tool.Action;
import javax.servlet.http.*;

public class LoginAction extends Action{
	
	public String execute(
			HttpServletRequest request, HttpServletResponse response
	) throws Exception{
		
	    return "/view/top.jsp";
		
	}

}
