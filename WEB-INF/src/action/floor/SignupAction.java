package action.floor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.FloorDAO;

public class SignupAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        // パラメータの取得
        String floor = request.getParameter("floor");
        String floor_number = request.getParameter("floor_number");
        int cap = Integer.parseInt(request.getParameter("cap"));
        String machine = request.getParameter("machine");
        String state = request.getParameter("state");
        String id = floor + floor_number;
        
        
        FloorDAO floorDAO = new FloorDAO();        
        boolean flag = floorDAO.insert(id, cap, machine, state);
        // ちゃんと閉じる！
        floorDAO.close();
        
        if (flag) {
            return "/view/floor/signup_complete.jsp";
        }
        else {
            return "/view/floor/signup_error.jsp";
        }
    }

}
