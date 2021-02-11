package action.situation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserBean;

import dao.SituationDAO;

import tool.Action;

public class AuthUserAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        String id = request.getParameter("id");
        
        SituationDAO situationDAO = new SituationDAO();
        UserBean userBean = situationDAO.authUser(id);
        situationDAO.close();
        
        request.setAttribute("userBean", userBean);
        
        if (userBean.getId().equals("")) {
            return "/view/situation/reception_auth_error.jsp";
        }
        else {
            return "/view/situation/reception_auth_complete.jsp";
        }
    }

}
