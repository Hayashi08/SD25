package action.situation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.FloorBean;

import dao.FloorDAO;

import tool.Action;

public class DetailAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        String floor_id = request.getParameter("id"); 
        
        FloorDAO floorDAO = new FloorDAO();
        FloorBean floorBean = floorDAO.detail(floor_id);
        floorDAO.close();
        // 清掃状況チェック
        if (floorBean.getState().equals("未")) {
            request.setAttribute("floorBean", floorBean);
            return "/view/floor/detail.jsp";
        }
        
        
        
        return "/view/situation/top.jsp";
    }

}
