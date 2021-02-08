package action.stock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.OrderingDAO;

public class OrderingDeleteAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        String id = request.getParameter("id");
        
        OrderingDAO orderingDAO = new OrderingDAO();
        orderingDAO.delete(id);
        orderingDAO.close();
        
        return "/view/stock/ordering_delete_complete.jsp";
        
    }

}
