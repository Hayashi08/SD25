package action.employee;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.EmployeeDAO;

public class SignupAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        String id = request.getParameter("id");
        String pass = request.getParameter("pass");
        String name = request.getParameter("name");
        String position = request.getParameter("position");
        String mail = request.getParameter("mail");
        String tel = request.getParameter("tel");
        
        EmployeeDAO employeeDAO = new EmployeeDAO();
        boolean flag = employeeDAO.insert(id, pass, name, position, mail, tel);
        employeeDAO.close();
        
        if (flag) {
            return "/view/employee/signup_complete.jsp";
        }
        else {
            return "/view/employee/signup_error.jsp";
        }
    }

}
