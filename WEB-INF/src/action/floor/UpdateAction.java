package action.floor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.FloorDAO;

public class UpdateAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        // パラメータの取得
        String id = request.getParameter("floor");
        int cap = Integer.parseInt(request.getParameter("cap"));
        String machine = request.getParameter("machine");
        String state = request.getParameter("state");
        
        FloorDAO floorDAO = new FloorDAO();
        boolean flag = floorDAO.update(id, cap, machine, state);
        // ちゃんと閉じる！
        floorDAO.close();
        
        if (flag) {
            return "/view/floor/update_complete.jsp";
        }
        else {
            return "/view/floor/update_error.jsp";
        }
    }

}
