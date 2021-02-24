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
        
        
        if (situationBean.getId() == 0) {
            situationDAO.close();
            return "/view/situation/liquidation.jsp";
        }
        
        situationDAO.setEnd(id);
        situationBean = situationDAO.getDetail(id);
        
        int time_price = situationDAO.getPrice(id);
        System.out.println("時間料金：" + time_price);
        
        int order_price = situationDAO.calcMenuPrice(id);
        System.out.println("注文料金:" + order_price);
        
        int price = time_price + order_price;
        System.out.println("合計料金:" + price);
        
        situationDAO.close();
        
        request.setAttribute("situationBean", situationBean);
        request.setAttribute("time_price", time_price);
        request.setAttribute("order_price", order_price);
        request.setAttribute("price", price);
        
        return "/view/situation/liquidation_confirm.jsp";
    }

}
