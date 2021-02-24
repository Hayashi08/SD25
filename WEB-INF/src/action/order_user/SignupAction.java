package action.order_user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tool.Action;
import dao.OrderUserDAO;

public class SignupAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        HttpSession session = request.getSession(true);
        String floor_id = (String) session.getAttribute("floor_id");
        
        String idCsv = request.getParameter("id");
        String qtyCsv = request.getParameter("qty");
        String[] id = idCsv.split(",", 0);
        String[] qty = qtyCsv.split(",", 0);
        
        OrderUserDAO order_userDAO = new OrderUserDAO();

        for (int i=0; i<id.length; i++) {
            
            order_userDAO.insert(id[i], floor_id, Integer.parseInt(qty[i]));
        }

        order_userDAO.close();
        
        return "/view/order_user/top.jsp";
    }

}
