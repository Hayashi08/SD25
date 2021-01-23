package action.situation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;

public class TopAction extends Action{
    
    @Override
    public String execute(
            HttpServletRequest request, HttpServletResponse response
    ) throws Exception{
        
        return "/view/situation/top.jsp";
        
    }

}
