package action.order_user;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tool.Action;
import bean.OrderUserBean;
import dao.OrderUserDAO;

public class ArchiveAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        HttpSession session = request.getSession(true);
        String floor_id = (String) session.getAttribute("floor_id");

        OrderUserDAO order_userDAO = new OrderUserDAO();
        ArrayList<OrderUserBean> order_userBeans = order_userDAO.archive(floor_id);
        order_userDAO.close();
        
        request.setAttribute("order_userBeans", order_userBeans);
        
        return "/view/order_user/archive.jsp";
    }

}
