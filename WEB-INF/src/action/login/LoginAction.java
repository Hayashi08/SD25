package action.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;

public class LoginAction extends Action{
	
    @Override
	public String execute(
			HttpServletRequest request, HttpServletResponse response
	) throws Exception{
		
	    return "/view/situation/top.jsp";
		
	}

}
