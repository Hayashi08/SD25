package action.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.OrderBean;
import dao.OrderDAO;

import tool.Action;

public class FormMenyuDetailAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        // パラメータの取得
        String id = request.getParameter("id");
        
        // DAOの生成
        OrderDAO orderDAO = new OrderDAO();
        
        // DAOメソッドの実行
        OrderBean orderBean = orderDAO.detail(id);
        
        // ちゃんと閉じる！
        orderDAO.close();
        
        // Beanのリスト(検索結果)をセット
        request.setAttribute("orderBean", orderBean);
        
        return "/view/order/menyu_detail.jsp";
    }

}
