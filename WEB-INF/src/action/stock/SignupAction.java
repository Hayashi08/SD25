package action.stock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.StockDAO;
import dao.UserDAO;

public class SignupAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        // パラメータの取得
        String name = request.getParameter("neme");
        String genre = request.getParameter("genre");
        String qty = request.getParameter("qty");
        String max = request.getParameter("max");
        String min = request.getParameter("min");
        
        
        StockDAO stockDAO = new StockDAO();        
        boolean flag = stockDAO.insert(name, genre, qty, max, min);
        // ちゃんと閉じる！
        stockDAO.close();
        
        if (flag) {
            return "/view/stock/signup_complete.jsp";
        }
        else {
            return "/view/stock/signup_error.jsp";
        }
    }

}
