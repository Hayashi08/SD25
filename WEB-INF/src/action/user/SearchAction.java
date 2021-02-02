package action.user;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserBean;

import dao.UserDAO;

import tool.Action;

public class SearchAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        // パラメータの取得
        String keyword = request.getParameter("keyword");
        
        // DAOの生成
        UserDAO userDAO = new UserDAO();
        // DAOメソッドの実行
        ArrayList<UserBean> userBeans = userDAO.search(keyword);
        // ちゃんと閉じる！
        userDAO.close();
        
        // Beanのリスト(検索結果)をセット
        request.setAttribute("userBeans", userBeans);
        
        return "/view/user/search.jsp";
    }

}
