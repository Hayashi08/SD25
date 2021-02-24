package action.employee;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.ShiftDAO;
import bean.ShiftBean;
import bean.ShiftConfirmBean;

public class ShiftConfirmAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        String date = request.getParameter("date");
        
        ShiftDAO shiftDAO = new ShiftDAO();
        shiftDAO.confirm(date);
        ArrayList<ShiftBean> shiftBeans = shiftDAO.search("*");
        ArrayList<ShiftConfirmBean> shiftConfirmBeans = shiftDAO.confirmDate();
        shiftDAO.close();
        
        request.setAttribute("shiftBeans", shiftBeans);
        request.setAttribute("shiftConfirmBeans", shiftConfirmBeans);
        
        return "/view/employee/shift_create.jsp";

    }

}
