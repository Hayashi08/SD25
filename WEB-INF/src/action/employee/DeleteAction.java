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
        String id = request.getParameter("id");
        
        // DAOの生成
        EmployeeDAO employeeDAO = new EmployeeDAO();
        employeeDAO.delete(id);
        // ちゃんと閉じる！
        employeeDAO.close();
        
        return "/view/employee/delete_complete.jsp";
        
    }

}
