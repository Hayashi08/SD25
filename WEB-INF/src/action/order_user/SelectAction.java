package action.order_user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.OrderUserDAO;
import bean.OrderUserBean;

public class SelectAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        String id = request.getParameter("id");
        
        OrderUserDAO order_userDAO = new OrderUserDAO();
        OrderUserBean order_userBean = order_userDAO.detail(id);
        order_userDAO.close();
        
        request.setAttribute("order_userBean", order_userBean);
        
        return "/view/order_user/select.jsp";
    }

}
