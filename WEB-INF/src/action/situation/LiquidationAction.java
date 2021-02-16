package action.situation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SituationDAO;

import tool.Action;

public class LiquidationAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        String user_id = request.getParameter("user_id");
        String id = request.getParameter("id");
        int sale_total = Integer.parseInt(request.getParameter("sale_total"));
        String floor_id = request.getParameter("floor_id");
        
        SituationDAO situationDAO = new SituationDAO();
        situationDAO.finish(user_id, id, sale_total, floor_id);
        situationDAO.close();
        
        return "/view/situation/liquidation_complete.jsp";
    }

}
