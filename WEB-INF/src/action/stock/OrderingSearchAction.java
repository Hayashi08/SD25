package action.stock;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.OrderingBean;
import dao.OrderingDAO;
import tool.Action;

public class OrderingSearchAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        // パラメータの取得
        String keyword = request.getParameter("keyword");
        
        // DAOの生成
        OrderingDAO orderingDAO = new OrderingDAO();
        // DAOメソッドの実行
        ArrayList<OrderingBean> orderingBeans = orderingDAO.search(keyword);
        // ちゃんと閉じる！
        orderingDAO.close();
        
        // Beanのリスト(検索結果)をセット
        request.setAttribute("orderingBeans", orderingBeans);
        
        return "/view/stock/ordering_search.jsp";
    }

}
