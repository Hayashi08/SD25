package action.employee;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.ShiftDAO;
import bean.ShiftBean;

public class ShiftDeleteAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        // パラメータの取得
        String id = request.getParameter("id");
        
        // DAOの生成
        ShiftDAO shiftDAO = new ShiftDAO();
        // DAOメソッドの実行
        shiftDAO.delete(id);
        ArrayList<ShiftBean> shiftBeans = shiftDAO.search("102");
        // ちゃんと閉じる！
        shiftDAO.close();

        // Beanのリスト(検索結果)をセット
        request.setAttribute("shiftBeans", shiftBeans);

        return "/view/employee/shift_signup.jsp";
        
    }

}
