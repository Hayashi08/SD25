package action.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.UserDAO;

public class DeleteAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        // パラメータの取得
        String id = request.getParameter("id");
        
        // DAOの生成
        UserDAO userDAO = new UserDAO();
        userDAO.delete(id);
        // ちゃんと閉じる！
        userDAO.close();
        
        return "/view/user/delete_complete.jsp";
        
    }

}
