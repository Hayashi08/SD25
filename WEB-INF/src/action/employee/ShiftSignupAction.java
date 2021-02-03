package action.employee;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.ShiftDAO;
import bean.ShiftBean;

public class ShiftSignupAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        // パラメータの取得
        String employee_id = request.getParameter("employee_id");
        String date = request.getParameter("date");
        String start = request.getParameter("start_hh") + ":" + request.getParameter("start_mm");
        String end = request.getParameter("end_hh") + ":" + request.getParameter("end_mm");
        
        // DAOの生成
        ShiftDAO shiftDAO = new ShiftDAO();
        // DAOメソッドの実行
        shiftDAO.insert(employee_id, date, start, end);
        ArrayList<ShiftBean> shiftBeans = shiftDAO.search("102");
        // ちゃんと閉じる！
        shiftDAO.close();
        
        // Beanのリスト(検索結果)をセット
        request.setAttribute("shiftBeans", shiftBeans);
        
        return "/view/employee/shift_signup.jsp";

    }

}
