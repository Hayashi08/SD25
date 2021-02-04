package action.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.OrderBean;
import bean.UserBean;

import dao.OrderDAO;
import dao.UserDAO;

import tool.Action;
public class MenyuSearchAction extends Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

        // パラメータの取得
        String keyword = request.getParameter("keyword");

        // DAOの生成
        OrderDAO orderDAO = new OrderDAO();
        // DAOメソッドの実行
        ArrayList<OrderBean> orderBeans = orderDAO.search(keyword);
        // ちゃんと閉じる！
        orderDAO.close();
        
        // Beanのリスト(検索結果)をセット
        
        request.setAttribute("OrderBeans", orderBeans);
        
        for (int i=0; i < orderBeans.size(); i++) {
	        System.out.println(orderBeans.get(i).getMenu_id());
	        System.out.println("aaa");
    	}

		return "/view/order/menyu_search.jsp";
	}

}
