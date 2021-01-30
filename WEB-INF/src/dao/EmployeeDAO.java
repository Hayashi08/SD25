package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.EmployeeBean;

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
        ResultSet rs = statement.executeQuery();
        
        if (rs.next()) {
            flag = true;
        }
        
        // ちゃんと閉じる！
        statement.close();
        return flag;
        
    }
    
    // 従業員検索
    public ArrayList<EmployeeBean> select(String keyword) throws Exception {
        
        // Beanのリスト
        ArrayList<EmployeeBean> employeeBeans = new ArrayList<EmployeeBean>();
        
        // SQL文
        String sql = "select * from employee where employee_id like ? or employee_name like ? or employee_position like ?";
        // STATEMENTの生成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // パラメータの挿入(ワイルドカード使用)
        statement.setString(1, "%" + keyword + "%");
        statement.setString(2, "%" + keyword + "%");
        statement.setString(3, "%" + keyword + "%");
        // 検索結果を受け取る
        ResultSet rs = statement.executeQuery();
        
        // 検索結果をBeanのリストに格納
        while (rs.next()) {
            // Beanの生成
            EmployeeBean employeeBean = new EmployeeBean();
            
            // カラムの値をBeanに格納
            employeeBean.setId(rs.getString(1));
            employeeBean.setPass(rs.getString(2));
            employeeBean.setName(rs.getString(3));
            employeeBean.setPosition(rs.getString(4));
            employeeBean.setMail(rs.getString(5));
            employeeBean.setTel(rs.getString(6));
            
            // Beanをリストに追加
            employeeBeans.add(employeeBean);
        }
        
        return employeeBeans;
        
    }

}
