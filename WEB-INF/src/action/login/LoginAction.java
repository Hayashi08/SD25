package action.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDAO;

import action.situation.TopAction;
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
		    
		    // セッション開始
		    HttpSession session = request.getSession(true);
		    // ID
		    session.setAttribute("id", employeeBean.getId());
		    // 名前
		    session.setAttribute("name", employeeBean.getName());
		    // 役職
		    session.setAttribute("position", employeeBean.getPosition());
		    // タイム
		    session.setMaxInactiveInterval(1800);
		    
		    TopAction topAction = new TopAction();
		    String url = topAction.execute(request, response);
		    
            return url;
        }
	    
		
	}

}
