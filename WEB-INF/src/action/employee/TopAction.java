package action.employee;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.ShiftDAO;
import bean.ShiftBean;

public class TopAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        // DAOの生成
        ShiftDAO shiftDAO = new ShiftDAO();
        // DAOメソッドの実行
        ArrayList<ShiftBean> shiftBeans = shiftDAO.search("*");
        // ちゃんと閉じる！
        shiftDAO.close();
        
        // Beanのリスト(検索結果)をセット
        request.setAttribute("shiftBeans", shiftBeans);

        return "/view/employee/top.jsp";
    }

}
