package action.stock;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.OrderingBean;
import dao.OrderingDAO;
import tool.Action;

public class OrderingSearchAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        String keyword = request.getParameter("keyword");
        
        OrderingDAO orderingDAO = new OrderingDAO();
        ArrayList<OrderingBean> orderingBeans = orderingDAO.search(keyword);
        orderingDAO.close();
        
        request.setAttribute("orderingBeans", orderingBeans);
        
        return "/view/stock/ordering_search.jsp";
    }

}
