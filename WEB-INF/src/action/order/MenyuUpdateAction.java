package action.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.OrderBean;
import bean.UserBean;

import dao.OrderDAO;
import dao.UserDAO;

import tool.Action;
public class MenyuUpdateAction extends Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

        // パラメータの取得
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String genre = request.getParameter("genre");
        String price = request.getParameter("price");
        String des = request.getParameter("des");
        String allergy = request.getParameter("allergy");

        // DAOの生成
        OrderDAO orderDAO = new OrderDAO();
        // DAOメソッドの実行
        orderDAO.update(id,name,genre,price,des,allergy);
        // ちゃんと閉じる！
        orderDAO.close();
        
		return "/view/order/menyu_update_complete.jsp";
	}

}
