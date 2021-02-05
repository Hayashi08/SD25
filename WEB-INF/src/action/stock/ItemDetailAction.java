package action.stock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.ItemDAO;
import bean.ItemBean;

public class ItemDetailAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        // パラメータの取得
        String id = request.getParameter("id");
        
        // DAOの生成
        ItemDAO itemDAO = new ItemDAO();
        // DAOメソッドの実行
        ItemBean itemBean = itemDAO.detail(id);
        // ちゃんと閉じる！
        itemDAO.close();
        
        // Beanのリスト(検索結果)をセット
        request.setAttribute("itemBean", itemBean);
        
        return "/view/stock/item_detail.jsp";
    }

}
