package action.stock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.ItemDAO;
import bean.ItemBean;

public class ItemDetailAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        String id = request.getParameter("id");
        
        ItemDAO itemDAO = new ItemDAO();
        ItemBean itemBean = itemDAO.detail(id);
        itemDAO.close();
        
        request.setAttribute("itemBean", itemBean);
        
        return "/view/stock/item_detail.jsp";
    }

}
