package action.stock;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ItemBean;
import dao.ItemDAO;
import tool.Action;

public class GenreSearchAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        // パラメータの取得
        String genre = request.getParameter("genre");
        
        if (genre != null) {
	        // DAOの生成
	        ItemDAO itemDAO = new ItemDAO();
	        // DAOメソッドの実行
        	ArrayList<ItemBean> itemBeans = itemDAO.searchGenre(genre);
	        // ちゃんと閉じる！
	        itemDAO.close();

	        // Beanのリスト(検索結果)をセット
	        request.setAttribute("itemBeans", itemBeans);
        }
        
        return "/view/stock/genre_search.jsp";
    }

}
