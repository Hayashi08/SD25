package action.stock;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tool.Action;
import dao.StockDAO;
import bean.ItemBean;
import bean.StockBean;
import dao.ItemDAO;

public class StockSignupConsumptionAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        HttpSession session = request.getSession(true);
        String employee_id = (String) session.getAttribute("id");
        String item_name = request.getParameter("item_name");
        String genre = request.getParameter("genre");
        String keyword = request.getParameter("keyword");
        //System.out.println(request.getParameter("qty"));
        int qty = Integer.parseInt(request.getParameter("qty"));
        StockDAO stockDAO = new StockDAO();
        stockDAO.insert_cons(employee_id, item_name, qty);
        
        ArrayList<StockBean> stockBeans = stockDAO.search(keyword);
        stockDAO.close();
        
        ItemDAO itemDAO = new ItemDAO();
        ArrayList<ItemBean> itemBeans = itemDAO.search(keyword);
        itemDAO.close();

        
        request.setAttribute("stockBeans", stockBeans);
        request.setAttribute("itemBeans", itemBeans);
        request.setAttribute("keyword", keyword);
        
        return "/view/stock/stock_search.jsp";

    }

}
