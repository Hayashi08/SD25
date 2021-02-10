package action.stock;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tool.Action;
import bean.ItemBean;
import dao.ItemDAO;
import dao.OrderingDAO;
public class OrderingSignupAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        HttpSession session = request.getSession(true);
        String employee_id = (String) session.getAttribute("id");
        String item_id = request.getParameter("item_id");
        int qty = Integer.parseInt(request.getParameter("qty"));
        String genre = request.getParameter("genre");
        
        OrderingDAO orderingDAO = new OrderingDAO();
        orderingDAO.insert(employee_id, item_id, qty);
        orderingDAO.close();

        ItemDAO itemDAO = new ItemDAO();
        ArrayList<ItemBean> itemBeans = itemDAO.searchGenre(genre);
        itemDAO.close();

        request.setAttribute("itemBeans", itemBeans);
        request.setAttribute("genre", genre);
        
        return "/view/stock/genre_search.jsp";
    }

}
