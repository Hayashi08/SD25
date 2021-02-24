package action.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;

public class FormSignupAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        String floor_id = request.getParameter("floor_id");
        String start = request.getParameter("end");
        
        request.setAttribute("floor_id", floor_id);
        request.setAttribute("start", start);
        
        return "/view/situation/book_signup.jsp";
    }

}
