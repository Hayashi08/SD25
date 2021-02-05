package action.floor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.FloorDAO;

public class DeleteAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        // パラメータの取得
        String id = request.getParameter("id");
        
        // DAOの生成
        FloorDAO floorDAO = new FloorDAO();
        floorDAO.delete(id);
        // ちゃんと閉じる！
        floorDAO.close();
        
        return "/view/floor/delete_complete.jsp";
        
    }

}
