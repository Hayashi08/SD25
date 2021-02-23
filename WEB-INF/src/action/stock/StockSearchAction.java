package action.stock;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.StockBean;
import dao.StockDAO;
import bean.ItemBean;
import dao.ItemDAO;
import tool.Action;

public class StockSearchAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        String keyword = request.getParameter("keyword");

        StockDAO stockDAO = new StockDAO();
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
