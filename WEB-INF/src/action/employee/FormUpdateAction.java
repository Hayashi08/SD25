package action.employee;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.EmployeeBean;

import tool.Action;
import dao.EmployeeDAO;

public class FormUpdateAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
    	
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String genre = request.getParameter("genre");
        String price = request.getParameter("price");
        String des = request.getParameter("des");
        String allergy[]= request.getParameterValues("allergy");
        String allergy_csv = request.getParameterValues("allergy");
        
        EmployeeDAO employeeDAO = new EmployeeDAO();
        EmployeeBean employeeBean = employeeDAO.detail(id);
        employeeDAO.close();
        
        request.setAttribute("employeeBean", employeeBean);
        
        return "/view/employee/update.jsp";
    }

}
