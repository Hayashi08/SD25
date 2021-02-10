package action.employee;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.EmployeeBean;

import dao.EmployeeDAO;

import tool.Action;

public class SearchAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        String keyword = request.getParameter("keyword");
        
        EmployeeDAO employeeDAO = new EmployeeDAO();
        ArrayList<EmployeeBean> employeeBeans = employeeDAO.search(keyword);
        employeeDAO.close();
        
        request.setAttribute("employeeBeans", employeeBeans);
        
        return "/view/employee/search.jsp";
    }

}
