package action.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.OrderBean;
import bean.UserBean;

import dao.OrderDAO;
import dao.UserDAO;

import tool.Action;
public class MenyuDeleteAction extends Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

        // パラメータの取得
        String id = request.getParameter("id");

        // DAOの生成
        OrderDAO orderDAO = new OrderDAO();
        // DAOメソッドの実行
        orderDAO.delete(id);
        // ちゃんと閉じる！
        orderDAO.close();
        
		return "/view/order/menyu_delete_complete.jsp";
	}

}
