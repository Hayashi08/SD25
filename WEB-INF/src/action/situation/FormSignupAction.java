package action.situation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;

public class FormSignupAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        String user_id = request.getParameter("user_id");
        String floor_id = request.getParameter("floor_id");
        String floor_cap = request.getParameter("floor_cap");
        
        request.setAttribute("user_id", user_id);
        request.setAttribute("floor_id", floor_id);
        request.setAttribute("floor_cap", floor_cap);
        
        return "/view/situation/reception_signup.jsp";
    }

}
