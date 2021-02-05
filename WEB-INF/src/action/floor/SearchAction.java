package action.floor;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.FloorBean;
import bean.UserBean;

import dao.FloorDAO;
import dao.UserDAO;

import tool.Action;

public class SearchAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        // パラメータの取得
        String keyword = request.getParameter("keyword");
        
        // DAOの生成
        FloorDAO floorDAO = new FloorDAO();
        // DAOメソッドの実行
        ArrayList<FloorBean> floorBeans = floorDAO.search(keyword);
        // ちゃんと閉じる！
        floorDAO.close();
        
        // Beanのリスト(検索結果)をセット
        request.setAttribute("floorBeans", floorBeans);
        
        return "/view/floor/search.jsp";
    }

}
