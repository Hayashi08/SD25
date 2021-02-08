package action.stock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.OrderingDAO;

public class OrderingUpdateAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        String id = request.getParameter("id");
        int qty = Integer.parseInt(request.getParameter("qty"));
        
        OrderingDAO orderingDAO = new OrderingDAO();
        boolean flag = orderingDAO.update(id, qty);
        orderingDAO.close();
        
        if (flag) {
            return "/view/stock/ordering_update_complete.jsp";
        }
        else {
            return "/view/stock/ordering_update_error.jsp";
        }
    }

}
