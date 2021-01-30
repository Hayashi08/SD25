package action.employee;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.EmployeeBean;

import tool.Action;
import dao.EmployeeDAO;

public class UpdateFormAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
    	
        // パラメータの取得
        String keyword = request.getParameter("keyword");
        
        // DAOの生成
        EmployeeDAO employeeDAO = new EmployeeDAO();
        // DAOメソッドの実行
        ArrayList<EmployeeBean> employeeBeans = employeeDAO.select(keyword);
        // ちゃんと閉じる！
        employeeDAO.close();
        
        // Beanのリスト(検索結果)をセット
        request.setAttribute("employeeBeans", employeeBeans);
        
        return "/view/employee/update.jsp";
    }

}
