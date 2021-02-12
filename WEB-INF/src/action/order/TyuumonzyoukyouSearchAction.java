package action.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.TaskBean;
import dao.OrderDAO;

import tool.Action;

public class TyuumonzyoukyouSearchAction extends Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		

        // パラメータの取得
        String keyword = request.getParameter("keyword");

        // DAOの生成
        OrderDAO orderDAO = new OrderDAO();
        // DAOメソッドの実行
        ArrayList<TaskBean> taskBeans = orderDAO.search_undeployed(keyword);
        // ちゃんと閉じる！
        orderDAO.close();

        request.setAttribute("TaskBeans", taskBeans);
        

		return "/view/order/tyuumonnzyoukyou_top.jsp";
	}

}
