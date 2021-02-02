package action.employee;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.EmployeeDAO;

public class DeleteAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        // パラメータの取得
        String keyword = request.getParameter("keyword");
        
        // DAOの生成
        EmployeeDAO employeeDAO = new EmployeeDAO();
        boolean flag = employeeDAO.delete(keyword);
        // ちゃんと閉じる！
        employeeDAO.close();
        
        if (flag) {
            return "/view/employee/delete_complete.jsp";
        }
        else {
            return "/view/employee/delete_error.jsp";
        }
    }

}
