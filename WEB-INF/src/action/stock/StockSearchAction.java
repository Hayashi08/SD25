package action.stock;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.StockBean;
import dao.StockDAO;
import tool.Action;

public class StockSearchAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        String keyword = request.getParameter("keyword");
        
        StockDAO stockDAO = new StockDAO();
        ArrayList<StockBean> stockBeans = stockDAO.search(keyword);
        stockDAO.close();
        
        request.setAttribute("stockBeans", stockBeans);
        
        return "/view/stock/stock_search.jsp";
    }

}
