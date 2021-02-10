package action.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.TaskBean;
import dao.OrderDAO;

import tool.Action;

public class Miteikyou_TopAction extends Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
        // DAOの生成
        OrderDAO orderDAO = new OrderDAO();
        // DAOメソッドの実行
        ArrayList<TaskBean> taskBeans = orderDAO.search_deployed();
        // ちゃんと閉じる！
        orderDAO.close();

        request.setAttribute("TaskBeans", taskBeans);
        
        for(int i=0; i < taskBeans.size(); i++){
        	System.out.println(taskBeans.get(i).getTask_id());
        }
		return "/view/order/miteikyou_top.jsp";
	}

}
