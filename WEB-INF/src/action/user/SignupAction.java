package action.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.UserDAO;

public class SignupAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        // パラメータの取得
        String id = request.getParameter("id");
        String pass = request.getParameter("pass");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String birth = request.getParameter("birth");
        String mail = request.getParameter("mail");
        String tel = request.getParameter("tel");
        String job = request.getParameter("job");
        String credit = request.getParameter("credit");
        String rank = request.getParameter("rank");
        
        
        UserDAO userDAO = new UserDAO();        
        boolean flag = userDAO.insert(id, pass, name, sex, birth, mail, tel, job, credit, rank);
        userDAO.close();
        
        if (flag) {
            return "/view/user/signup_complete.jsp";
        }
        else {
            return "/view/user/signup_error.jsp";
        }
    }

}
