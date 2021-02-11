package action.situation;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SituationDAO;

import bean.FloorBean;

import tool.Action;

public class SelectFloorAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        String user_id = request.getParameter("id");
        
        ArrayList<FloorBean> floorBeans = new ArrayList<FloorBean>();
        SituationDAO situationDAO = new SituationDAO();
        floorBeans = situationDAO.serchAvailableFloor();
        situationDAO.close();
        
        request.setAttribute("floorBeans", floorBeans);
        request.setAttribute("user_id", user_id);
        
        return "/view/situation/reception_floor.jsp";
    }

}
