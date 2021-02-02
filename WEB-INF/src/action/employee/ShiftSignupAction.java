package action.employee;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import dao.EmployeeDAO;

public class ShiftSignupAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        // パラメータの取得
        String employee_id = request.getParameter("employee_id");
        String date = request.getParameter("date");
        String start = request.getParameter("start_hh") + ":" + request.getParameter("start_mm");
        String end = request.getParameter("end_hh") + ":" + request.getParameter("end_mm");
        
        EmployeeDAO employeeDAO = new EmployeeDAO();
        boolean flag = employeeDAO.insertShift(employee_id, date, start, end);
        // ちゃんと閉じる！
        employeeDAO.close();
        
        if (flag) {
            return "/view/employee/shift_signup_complete.jsp";
        }
        else {
            return "/view/employee/shift_signup_error.jsp";
        }
    }

}
