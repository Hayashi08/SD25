package action.employee;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.EmployeeDAO;
import bean.EmployeeBean;

public class DetailAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        String id = request.getParameter("id");
        
        EmployeeDAO employeeDAO = new EmployeeDAO();
        EmployeeBean employeeBean = employeeDAO.detail(id);
        employeeDAO.close();
        
        request.setAttribute("employeeBean", employeeBean);
        
        return "/view/employee/detail.jsp";
    }

}
