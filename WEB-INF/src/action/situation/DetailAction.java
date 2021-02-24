package action.situation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.FloorBean;
import bean.SituationBean;

import dao.FloorDAO;
import dao.SituationDAO;

import tool.Action;

public class DetailAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        if (request.getParameter("floor") != null) {
            TopAction topAction = new TopAction();
            String url = topAction.execute(request, response);
            return url;
        }
        
        String floor_id = request.getParameter("id"); 
        
        FloorDAO floorDAO = new FloorDAO();
        FloorBean floorBean = floorDAO.detail(floor_id);
        floorDAO.close();
        
        SituationDAO situationDAO = new SituationDAO();
        SituationBean situationBean = situationDAO.getCurrentDetail(floor_id);
        situationDAO.close();
        
        if (situationBean.getId() != 0) {
            request.setAttribute("situationBean", situationBean);
            return "/view/situation/detail.jsp";
        }

        request.setAttribute("floorBean", floorBean);
        return "/view/situation/floor_detail.jsp";
        
    }

}
