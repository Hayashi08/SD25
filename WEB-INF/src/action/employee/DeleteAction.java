package action.employee;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.EmployeeDAO;

public class DeleteAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        String id = request.getParameter("id");
        
        EmployeeDAO employeeDAO = new EmployeeDAO();
        employeeDAO.delete(id);
        employeeDAO.close();
        
        return "/view/employee/delete_complete.jsp";
        
    }

}
