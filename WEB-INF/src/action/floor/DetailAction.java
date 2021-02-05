package action.floor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.FloorDAO;
import bean.FloorBean;

public class DetailAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        // パラメータの取得
        String id = request.getParameter("id");
        
        // DAOの生成
        FloorDAO floorDAO = new FloorDAO();
        // DAOメソッドの実行
       FloorBean floorBean = floorDAO.detail(id);
        // ちゃんと閉じる！
        floorDAO.close();
        
        // Beanのリスト(検索結果)をセット
        request.setAttribute("floorBean", floorBean);
        
        return "/view/floor/detail.jsp";
    }

}
