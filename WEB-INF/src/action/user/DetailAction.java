package action.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.UserDAO;
import bean.UserBean;

public class DetailAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        // パラメータの取得
        String id = request.getParameter("id");
        System.out.println(id);
        
        // DAOの生成
        UserDAO userDAO = new UserDAO();
        // DAOメソッドの実行
        UserBean userBean = userDAO.detail(id);
        // ちゃんと閉じる！
        userDAO.close();
        
        // Beanのリスト(検索結果)をセット
        request.setAttribute("userBean", userBean);
        
        return "/view/user/detail.jsp";
    }

}
