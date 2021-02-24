package action.situation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SituationDAO;

import tool.Action;

public class SetStateCleanAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        String floor_id = request.getParameter("floor_id");
        
        SituationDAO situationDAO = new SituationDAO();
        situationDAO.setStateClean(floor_id);
        situationDAO.close();
        
        action.situation.TopAction topAction = new action.situation.TopAction();
        String url = topAction.execute(request, response);
        
        return url;
    }

}
