package action.stock;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ItemBean;
import dao.ItemDAO;
import tool.Action;

public class ItemSearchAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        String keyword = request.getParameter("keyword");
        
        ItemDAO itemDAO = new ItemDAO();
        ArrayList<ItemBean> itemBeans = itemDAO.search(keyword);
        itemDAO.close();
        
        request.setAttribute("itemBeans", itemBeans);
        
        return "/view/stock/item_search.jsp";
    }

}
