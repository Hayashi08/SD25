package action.stock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.ItemDAO;

public class ItemUpdateAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String genre = request.getParameter("genre");
        int max = Integer.parseInt(request.getParameter("max"));
        int min = Integer.parseInt(request.getParameter("min"));
        
        ItemDAO itemDAO = new ItemDAO();
        boolean flag = itemDAO.update(id, name, genre, max, min);
        itemDAO.close();
        
        if (flag) {
            return "/view/stock/item_update_complete.jsp";
        }
        else {
            return "/view/stock/item_update_error.jsp";
        }
    }

}
