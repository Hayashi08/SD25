package action.employee;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.EmployeeBean;

import tool.Action;
import dao.EmployeeDAO;

public class FormUpdateAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
    	
        // パラメータの取得
        String id = request.getParameter("id");
        
        // DAOの生成
        EmployeeDAO employeeDAO = new EmployeeDAO();
        // DAOメソッドの実行
        EmployeeBean employeeBean = employeeDAO.detail(id);
        // ちゃんと閉じる！
        employeeDAO.close();
        
        // Beanのリスト(検索結果)をセット
        request.setAttribute("employeeBean", employeeBean);
        
        return "/view/employee/update.jsp";
    }

}
