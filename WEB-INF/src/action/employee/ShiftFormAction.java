package action.employee;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.EmployeeDAO;
import bean.EmployeeBean;

public class ShiftFormAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        // DAOの生成
        EmployeeDAO employeeDAO = new EmployeeDAO();
        // DAOメソッドの実行
        ArrayList<EmployeeBean> employeeBeans = employeeDAO.searchShift("101");
        // ちゃんと閉じる！
        employeeDAO.close();
        
        // Beanのリスト(検索結果)をセット
        request.setAttribute("employeeBeans", employeeBeans);

        return "/view/employee/shift_signup.jsp";
    }

}
