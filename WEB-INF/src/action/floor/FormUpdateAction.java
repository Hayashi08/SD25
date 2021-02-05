package action.floor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.FloorBean;

import tool.Action;
import dao.FloorDAO;

public class FormUpdateAction extends Action {

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
        
        return "/view/floor/update.jsp";
    }

}
