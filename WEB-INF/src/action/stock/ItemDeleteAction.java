package action.stock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.ItemDAO;

public class ItemDeleteAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        // パラメータの取得
        String id = request.getParameter("id");
        
        // DAOの生成
        ItemDAO itemDAO = new ItemDAO();
        itemDAO.delete(id);
        // ちゃんと閉じる！
        itemDAO.close();
        
        return "/view/stock/item_delete_complete.jsp";
        
    }

}
