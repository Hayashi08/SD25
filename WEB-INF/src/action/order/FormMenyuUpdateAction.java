package action.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.OrderBean;
import dao.OrderDAO;

import tool.Action;

public class FormMenyuUpdateAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
    	

        // パラメータの取得
        String id = request.getParameter("id");

        // DAOの生成
        OrderDAO orderDAO = new OrderDAO();
        // DAOメソッドの実行
        OrderBean orderBean = orderDAO.search_byid(id);
        // ちゃんと閉じる！
        orderDAO.close();
        
        // Beanのリスト(検索結果)をセット
        
        request.setAttribute("OrderBean", orderBean);
        
        if(orderBean!=null){
        	return "/view/order/menyu_update.jsp";
        }
        else{
        	return "/view/order/menyu_top.jsp";
        }
    }

}
