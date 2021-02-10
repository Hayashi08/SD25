package action.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserBean;

import tool.Action;
import dao.UserDAO;

public class FormUpdateAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
    	
        // パラメータの取得
        String id = request.getParameter("id");
        
        // DAOの生成
        UserDAO userDAO = new UserDAO();
        // DAOメソッドの実行
        UserBean userBean = userDAO.detail(id);
        // ちゃんと閉じる！
        userDAO.close();
        
        // Beanのリスト(検索結果)をセット
        request.setAttribute("userBean", userBean);
        
        return "/view/user/edit.jsp";
    }

}
