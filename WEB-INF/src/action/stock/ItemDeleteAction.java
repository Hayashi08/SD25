package action.stock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.ItemDAO;

public class ItemDeleteAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        String id = request.getParameter("id");
        
        ItemDAO itemDAO = new ItemDAO();
        itemDAO.delete(id);
        itemDAO.close();
        
        return "/view/stock/item_delete_complete.jsp";
        
    }

}
