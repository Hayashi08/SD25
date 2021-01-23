package action.situation;

import tool.Action;
import javax.servlet.http.*;

public class TopAction extends Action{
    
    public String execute(
            HttpServletRequest request, HttpServletResponse response
    ) throws Exception{
        
        return "/view/situation/top.jsp";
        
    }

}
