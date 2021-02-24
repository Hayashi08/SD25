package action.employee;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tool.Action;
import dao.ShiftDAO;
import bean.ShiftBean;
import bean.ShiftConfirmBean;

public class ShiftDeleteAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        String id = request.getParameter("id");
        HttpSession session = request.getSession(true);
        String employee_id = (String) session.getAttribute("id");
        String flag = request.getParameter("flag");
        
        ShiftDAO shiftDAO = new ShiftDAO();
        shiftDAO.delete(id);
        if (flag.equals("confirm")) {
            
            ArrayList<ShiftBean> shiftBeans = shiftDAO.search("*");
            ArrayList<ShiftConfirmBean> shiftConfirmBeans = shiftDAO.confirmDate();
            shiftDAO.close();
            
            request.setAttribute("shiftBeans", shiftBeans);
            request.setAttribute("shiftConfirmBeans", shiftConfirmBeans);

            return "/view/employee/shift_create.jsp";

        } else {

            ArrayList<ShiftBean> shiftBeans = shiftDAO.search(employee_id);
            request.setAttribute("shiftBeans", shiftBeans);
            shiftDAO.close();

            return "/view/employee/shift_signup.jsp";
        }
        
    }

}
