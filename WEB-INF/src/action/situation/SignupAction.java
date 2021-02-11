package action.situation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SituationDAO;

import tool.Action;

public class SignupAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        String user_id = request.getParameter("user_id");
        String floor_id = request.getParameter("floor_id");
        int qty = Integer.parseInt(request.getParameter("qty"));
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        String free = request.getParameter("free");
        
        SituationDAO situationDAO = new SituationDAO();
        boolean flag = situationDAO.insert(user_id, floor_id, qty, start, end, free);
        situationDAO.close();
        
        if (flag) {
            return "/view/situation/reception_signup_complete.jsp";
        }
        else {
            return "/view/situation/reception_signup_error.jsp";
        }
    }

}
