package action.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;

import sun.misc.Perf.GetPerfAction;
import tool.Action;

public class SignupAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        String floor_id = request.getParameter("floor_id");
        String user_id = request.getParameter("user_id");
        int qty = Integer.parseInt(request.getParameter("qty"));
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        String free = request.getParameter("free");
        
        BookDAO bookDAO = new BookDAO();
        bookDAO.insertToday(user_id, floor_id, qty, start, end, free);
        bookDAO.close();
        
        return "/view/situation/book_signup_complete.jsp";
    }

}
