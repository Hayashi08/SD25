package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import tool.DAO;

import bean.EmployeeBean;

public class LoginDAO extends DAO {
    
    public LoginDAO() throws Exception {
        super();
    }
    
    // ユーザー認証
    public EmployeeBean authEmployee(String id, String pass) throws Exception {
        
        String sql = "select * from employee where employee_id = ? and employee_pass = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, id);
        statement.setString(2, pass);
        ResultSet rSet = statement.executeQuery();
        EmployeeBean employeeBean = new EmployeeBean();
        
        if (rSet.next()) {
            
            if (rSet.getString(1).equals(id) && rSet.getString(2).equals(pass)) {
                
                employeeBean.setId(id);
                employeeBean.setName(rSet.getString(3));
                employeeBean.setPosition(rSet.getString(4));
                
            }
            
        }
        
        return employeeBean;
        
    }

}
