package action.order_user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tool.Action;
import dao.FloorDAO;

public class FloorSignupAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        String floor_id = request.getParameter("floor_id");
        
        FloorDAO floorDAO = new FloorDAO();
        boolean flag = floorDAO.updateOrderUser(floor_id);
        floorDAO.close();

        //フロア登録完了
        if (flag) {

            HttpSession session = request.getSession(true);
            session.setAttribute("floor_id", floor_id);

            return "/view/order_user/top.jsp";

        //セッション発行済み
        } else if(request.getSession(true).getAttribute("floor_id") != null) {

            return "/view/order_user/top.jsp";

        //フロア登録失敗
        } else {
            return "/view/order_user/floor_signup_error.jsp";
        }
    }

}
