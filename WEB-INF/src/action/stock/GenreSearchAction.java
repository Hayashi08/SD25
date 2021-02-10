package action.stock;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ItemBean;
import dao.ItemDAO;
import tool.Action;

public class GenreSearchAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        String genre = request.getParameter("genre");
        
        if (genre != null) {

	        ItemDAO itemDAO = new ItemDAO();
        	ArrayList<ItemBean> itemBeans = itemDAO.searchGenre(genre);
	        itemDAO.close();

	        request.setAttribute("itemBeans", itemBeans);
            request.setAttribute("genre", genre);
        }
        
        return "/view/stock/genre_search.jsp";
    }

}
