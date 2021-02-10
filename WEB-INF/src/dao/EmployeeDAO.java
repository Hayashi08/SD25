package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tool.DAO;
import bean.EmployeeBean;

public class EmployeeDAO extends DAO {
    
    // コンストラクタ
    public EmployeeDAO() throws Exception {
        super();
    }
    
    // 従業員登録処理
    public boolean insert(String id, String pass, String name, String position, String mail, String tel) throws Exception {
        
        if (checkEmployeeId(id)) {
            return false;
        }

        String sql = "insert into employee values ( ?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, id);
        statement.setString(2, pass);
        statement.setString(3, name);
        statement.setString(4, position);
        statement.setString(5, mail);
        statement.setString(6, tel);
        statement.executeUpdate();
        statement.close();
        return true;
        
    }
    
    // ユーザーIDが存在するかどうかの判定
    private boolean checkEmployeeId(String employee_id) throws Exception {
        
        boolean flag = false;
        
        String sql = "select * from employee where employee_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, employee_id);
        ResultSet rs = statement.executeQuery();
        
        if (rs.next()) {
            flag = true;
        }
        
        statement.close();
        return flag;
        
    }
    
    // 従業員検索処理
    public ArrayList<EmployeeBean> search(String keyword) throws Exception {
        
        ArrayList<EmployeeBean> employeeBeans = new ArrayList<EmployeeBean>();
        
        String sql = "select * from employee where employee_id like ? or employee_name like ? or employee_position like ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, "%" + keyword + "%");
        statement.setString(2, "%" + keyword + "%");
        statement.setString(3, "%" + keyword + "%");
        ResultSet rs = statement.executeQuery();
        
        while (rs.next()) {

            EmployeeBean employeeBean = new EmployeeBean();
            employeeBean.setId(rs.getString(1));
            employeeBean.setPass(rs.getString(2));
            employeeBean.setName(rs.getString(3));
            employeeBean.setPosition(rs.getString(4));
            employeeBean.setMail(rs.getString(5));
            employeeBean.setTel(rs.getString(6));
            employeeBeans.add(employeeBean);
        }
        
        statement.close();
        return employeeBeans;
        
    }
    
    // 従業員詳細
    public EmployeeBean detail(String id) throws Exception {
        
        EmployeeBean employeeBean = new EmployeeBean();
        String sql = "select * from employee where employee_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, id);
        ResultSet rs = statement.executeQuery();
        
        if (rs.next()) {
            
            employeeBean.setId(rs.getString(1));
            employeeBean.setPass(rs.getString(2));
            employeeBean.setName(rs.getString(3));
            employeeBean.setPosition(rs.getString(4));
            employeeBean.setMail(rs.getNString(5));
            employeeBean.setTel(rs.getString(6));
            
        }
        
        statement.close();
        return employeeBean;
    }

    // 従業員更新処理
    public boolean update(String id, String pass, String name, String position, String mail, String tel) throws Exception {

        String sql = "update employee set employee_pass = ?, employee_name = ?, employee_position = ?, employee_mail = ?, employee_tel = ? where employee_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, pass);
        statement.setString(2, name);
        statement.setString(3, position);
        statement.setString(4, mail);
        statement.setString(5, tel);
        statement.setString(6, id);
        statement.executeUpdate();
        
        statement.close();
        return true;
        
    }

    // 従業員削除処理
    public void delete(String id) throws Exception {

        String sql = "delete from employee where employee_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, id);
        statement.executeUpdate();
        
        statement.close();
        
    }

}
