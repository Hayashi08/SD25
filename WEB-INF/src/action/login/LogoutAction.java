package action.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tool.Action;

public class LogoutAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        // セッション終了
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute("id");
            session.removeAttribute("name");
            session.removeAttribute("position");
        }
        
        return "/view/login/logged_out.jsp";
    }

}
