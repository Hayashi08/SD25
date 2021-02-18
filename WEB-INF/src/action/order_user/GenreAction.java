package action.order_user;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import bean.OrderUserBean;
import dao.OrderUserDAO;

public class GenreAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        String genre = request.getParameter("genre");
        
        OrderUserDAO order_userDAO = new OrderUserDAO();
        ArrayList<OrderUserBean> order_userBeans = order_userDAO.search(genre);
        order_userDAO.close();
        
        request.setAttribute("order_userBeans", order_userBeans);
        
        return "/view/order_user/genre.jsp";
    }

}
