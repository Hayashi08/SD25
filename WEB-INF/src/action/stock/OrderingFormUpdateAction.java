package action.stock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.OrderingBean;

import tool.Action;
import dao.OrderingDAO;

public class OrderingFormUpdateAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        String id = request.getParameter("id");
        
        OrderingDAO orderingDAO = new OrderingDAO();
        OrderingBean orderingBean = orderingDAO.detail(id);
        orderingDAO.close();
        
        request.setAttribute("orderingBean", orderingBean);
        
        return "/view/stock/ordering_update.jsp";
    }

}
