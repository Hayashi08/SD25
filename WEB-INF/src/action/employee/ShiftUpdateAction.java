package action.employee;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tool.Action;
import dao.ShiftDAO;
import bean.ShiftBean;

public class ShiftUpdateAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        String id = request.getParameter("id");
        String start = request.getParameter("start_hh") + ":" + request.getParameter("start_mm");
        String end = request.getParameter("end_hh") + ":" + request.getParameter("end_mm");
        HttpSession session = request.getSession(true);
        String employee_id = (String) session.getAttribute("id");
        
        ShiftDAO shiftDAO = new ShiftDAO();
        shiftDAO.update(id, start, end);
        ArrayList<ShiftBean> shiftBeans = shiftDAO.search(employee_id);
        shiftDAO.close();
        
        request.setAttribute("shiftBeans", shiftBeans);
        
        return "/view/employee/shift_signup.jsp";

    }

}
