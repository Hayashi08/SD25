package action.employee;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.ShiftDAO;
import bean.ShiftBean;

public class TopAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        ShiftDAO shiftDAO = new ShiftDAO();
        ArrayList<ShiftBean> shiftBeans = shiftDAO.search("*");
        shiftDAO.close();
        
        request.setAttribute("shiftBeans", shiftBeans);

        return "/view/employee/top.jsp";
    }

}
