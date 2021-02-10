package action.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDAO;
import dao.FloorDAO;

import sun.security.util.Length;
import tool.Action;

public class TyuumonnzyoukyouSignupAction extends Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

        // パラメータの取得
        String floor_id = request.getParameter("floor_id");
        String situation_id = request.getParameter("situatin_id");
        String task_time = request.getParameter("task_time");
        String menu_id = request.getParameter("menu_id");
        String task_qty = request.getParameter("task_qty");

        OrderDAO orderDAO = new OrderDAO();
        FloorDAO floorDAO = new FloorDAO();
        
        if(floorDAO.checkFloorId(floor_id)){
        	
        }
        
        boolean flag = orderDAO.insert_task(floor_id,situation_id,task_time,menu_id,task_qty);
        // ちゃんと閉じる！
        orderDAO.close();
        
        
		return "/view/order/tyuumonnzoukyousignup_complete.jsp";
	}

}
