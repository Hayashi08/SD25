package action.stock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.StockDAO;
import bean.StockBean;

public class StockDetailAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        String id = request.getParameter("id");

        StockDAO stockDAO = new StockDAO();
        StockBean stockBean = stockDAO.detail(id);
        stockDAO.close();

        request.setAttribute("stockBean", stockBean);
        
        return "/view/stock/stock_detail.jsp";
    }

}
