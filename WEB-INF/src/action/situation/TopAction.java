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
        
        TopDAO topDAO = new TopDAO();
        ArrayList<TopBean> topBeans = topDAO.getCurrent();
        topDAO.close();
        
        request.setAttribute("topBeans", topBeans);
        
        return "/view/situation/top.jsp";
        
    }

}
