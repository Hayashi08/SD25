package action.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LoginDAO;

import bean.EmployeeBean;

import tool.Action;

public class LoginAction extends Action{
	
    @Override
	public String execute(
			HttpServletRequest request, HttpServletResponse response
	) throws Exception{
        
        String id = request.getParameter("id");
        String pass = request.getParameter("pass");
        
        LoginDAO loginDAO = new LoginDAO();
        EmployeeBean employeeBean = loginDAO.authEmployee(id, pass);
        
        if (employeeBean.getId().equals("")) {
            return "/view/login/login_error.jsp";
        }
		else {
            return "/view/situation/top.jsp";
        }
	    
		
	}

}
