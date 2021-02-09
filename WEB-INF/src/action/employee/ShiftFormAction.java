package action.employee;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tool.Action;
import dao.ShiftDAO;
import bean.ShiftBean;

public class ShiftFormAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        HttpSession session = request.getSession(true);
        String employee_id = (String) session.getAttribute("id");

        ShiftDAO shiftDAO = new ShiftDAO();
        ArrayList<ShiftBean> shiftBeans = shiftDAO.search(employee_id);
        shiftDAO.close();
        
        request.setAttribute("shiftBeans", shiftBeans);

        return "/view/employee/shift_signup.jsp";
    }

}
