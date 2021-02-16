package action.situation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.SituationBean;

import dao.SituationDAO;

import tool.Action;

public class ConfirmLiquidationAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        SituationDAO situationDAO = new SituationDAO();
        SituationBean situationBean = situationDAO.getDetail(id);
        
        
        if (situationBean.getId().equals("")) {
            situationDAO.close();
            return "/view/situation/liquidation.jsp";
        }
        
        situationDAO.setEnd(id);
        int price = situationDAO.getPrice(id);
        
        situationDAO.close();
        
        request.setAttribute("situationBean", situationBean);
        request.setAttribute("price", price);
        
        return "/view/situation/liquidation_confirm.jsp";
    }

}
