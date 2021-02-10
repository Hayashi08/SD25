package action.stock;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tool.Action;
import dao.StockDAO;
import bean.ItemBean;
import dao.ItemDAO;

public class StockSignupAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        HttpSession session = request.getSession(true);
        String employee_id = (String) session.getAttribute("id");
        String item_id = request.getParameter("item_id");
        String genre = request.getParameter("genre");
        
        StockDAO stockDAO = new StockDAO();
        stockDAO.insert(employee_id, item_id);
        stockDAO.close();

        ItemDAO itemDAO = new ItemDAO();
        ArrayList<ItemBean> itemBeans = itemDAO.searchGenre(genre);
        itemDAO.close();

        request.setAttribute("itemBeans", itemBeans);
        request.setAttribute("genre", genre);
        
        return "/view/stock/genre_search.jsp";
    }

}
