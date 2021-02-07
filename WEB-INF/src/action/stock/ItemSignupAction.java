package action.stock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.ItemDAO;

public class ItemSignupAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        // パラメータの取得
        String name = request.getParameter("name");
        String genre = request.getParameter("genre");
        int max = Integer.parseInt(request.getParameter("max"));
        int min = Integer.parseInt(request.getParameter("min"));
        
        ItemDAO itemDAO = new ItemDAO();
        boolean flag = itemDAO.insert(name, genre, max, min);
        // ちゃんと閉じる！
        itemDAO.close();
        
        if (flag) {
            return "/view/stock/item_signup_complete.jsp";
        }
        else {
            return "/view/stock/item_signup_error.jsp";
        }
    }

}
