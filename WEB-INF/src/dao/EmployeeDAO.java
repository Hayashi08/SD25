package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import tool.DAO;

public class EmployeeDAO extends DAO {
    
    // コンストラクタ
    // 親コンストラクタを呼び出し
    public EmployeeDAO() throws Exception {
        super();
    }
    
    // employeeテーブルへインサート
    public boolean insert(String id, String pass, String name, String position, String mail, String tel) throws Exception {
        
        // 従業員IDが重複してないか確認
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
        
        // ちゃんと閉じる！
        statement.close();
        return true;
        
    }
    
    // ユーザーIDが存在するかどうかの判定
    private boolean checkEmployeeId(String employee_id) throws Exception {
        
        boolean flag = false;
        
        String sql = "select * from employee where employee_id like ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, employee_id);
        ResultSet rSet = statement.executeQuery();
        
        if (rSet.next()) {
            flag = true;
        }
        
        // ちゃんと閉じる！
        statement.close();
        return flag;
        
    }
    
}
