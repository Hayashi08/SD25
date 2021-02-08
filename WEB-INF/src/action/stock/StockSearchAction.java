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

        // パラメータの取得
        String keyword = request.getParameter("keyword");
        
        // DAOの生成
        StockDAO stockDAO = new StockDAO();
        // DAOメソッドの実行
        ArrayList<StockBean> stockBeans = stockDAO.search(keyword);
        // ちゃんと閉じる！
        stockDAO.close();
        
        // Beanのリスト(検索結果)をセット
        request.setAttribute("stockBeans", stockBeans);
        
        return "/view/stock/stock_search.jsp";
    }

}
