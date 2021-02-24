package action.employee;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.ShiftDAO;
import bean.ShiftConfirmBean;

public class TopAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        ShiftDAO shiftDAO = new ShiftDAO();
        ArrayList<ShiftConfirmBean> shiftConfirmBeans = shiftDAO.searchConfirm();
        shiftDAO.close();
        
        request.setAttribute("shiftConfirmBeans", shiftConfirmBeans);

        return "/view/employee/top.jsp";
    }

}
