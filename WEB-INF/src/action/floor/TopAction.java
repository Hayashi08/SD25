package action.floor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;

public class TopAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        return "/view/floor/top.jsp";
    }

}
