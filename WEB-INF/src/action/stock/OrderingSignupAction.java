package action.stock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.OrderingDAO;

public class OrderingSignupAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        // パラメータの取得
        String employee_id = "101";
        String item_id = request.getParameter("item_id");
        int qty = Integer.parseInt(request.getParameter("qty"));
        
        OrderingDAO orderingDAO = new OrderingDAO();
        boolean flag = orderingDAO.insert(employee_id, item_id, qty);
        // ちゃんと閉じる！
        orderingDAO.close();
        
        if (flag) {
            return "/view/stock/ordering_signup_complete.jsp";
        }
        else {
            return "/view/stock/ordering_signup_error.jsp";
        }
    }

}
