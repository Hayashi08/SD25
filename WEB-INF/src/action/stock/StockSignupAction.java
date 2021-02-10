package action.stock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tool.Action;
import dao.StockDAO;

public class StockSignupAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        HttpSession session = request.getSession(true);
        String employee_id = (String) session.getAttribute("id");
        String item_id = request.getParameter("item_id");
        
        StockDAO stockDAO = new StockDAO();
        boolean flag = stockDAO.insert(employee_id, item_id);
        stockDAO.close();
        
        if (flag) {
            return "/view/stock/stock_signup_complete.jsp";
        }
        else {
            return "/view/stock/stock_signup_error.jsp";
        }
    }

}
