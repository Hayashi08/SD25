package action.situation;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.TopBean;

import dao.TopDAO;

import tool.Action;

public class TopAction extends Action{
    
    @Override
    public String execute(
            HttpServletRequest request, HttpServletResponse response
    ) throws Exception{
        
        String floor = "1";
        
        if (request.getParameter("floor") != null) {
            floor = request.getParameter("floor");
        }
        
        TopDAO topDAO = new TopDAO();
        ArrayList<TopBean> topBeans = topDAO.getCurrent(floor);
        topDAO.close();
        
        request.setAttribute("topBeans", topBeans);
        
        request.setAttribute("floor", Integer.parseInt(floor));
        
        return "/view/situation/top.jsp";
        
    }

}
