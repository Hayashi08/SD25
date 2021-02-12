package action.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.TaskBean;
import dao.OrderDAO;

import tool.Action;

public class TaskCompleteAction extends Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

        // パラメータの取得
        String task_stn = request.getParameter("task_stn");
        String task_id = request.getParameter("task_id");
        String situation_id = request.getParameter("situation_id");
        String menu_id = request.getParameter("menu_id");
        String task_qty = request.getParameter("task_qty");
        String age = request.getParameter("age");
        String i = "sex" + request.getParameter("i");
        String sex = request.getParameter(i);
        
        // DAOの生成
        OrderDAO orderDAO = new OrderDAO();
        
        ArrayList<TaskBean> taskBeans;
        
        if(task_stn.equals("deploy")){
        	//更新
        	orderDAO.task_deploy(task_stn,task_id);
        	//全件検索
        	taskBeans = orderDAO.searchall_undeployed();
            // ちゃんと閉じる！
            orderDAO.close();
            
            request.setAttribute("TaskBeans", taskBeans);
            return "/view/order/tyuumonnzyoukyou_top.jsp";
        }else{
        	//更新
        	orderDAO.task_comp(task_stn,task_id);
        	//全件検索
        	taskBeans = orderDAO.searchall_deployed();
        	//売上詳細insert
        	orderDAO.insert_sale(task_id,situation_id,menu_id,task_qty,sex,age);
            // ちゃんと閉じる！
            orderDAO.close();
            
            request.setAttribute("TaskBeans", taskBeans);
            return "/view/order/miteikyou_top.jsp";
        }

	}

}
