package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tool.DAO;
import bean.EmployeeBean;

public class EmployeeDAO extends DAO {
    
    // コンストラクタ
    // 親コンストラクタを呼び出し
    public EmployeeDAO() throws Exception {
        super();
    }
    
    // 従業員登録処理
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
        
        String sql = "select * from employee where employee_id = ?";
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
    
    // 従業員検索処理
    public ArrayList<EmployeeBean> search(String keyword) throws Exception {
        
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
        
        // ちゃんと閉じる！
        statement.close();
        return employeeBeans;
        
    }
    
    // 従業員詳細
    public EmployeeBean detail(String id) throws Exception {
        
        // Beanの生成
        EmployeeBean employeeBean = new EmployeeBean();
        
        // SQL文
        String sql = "select * from employee where employee_id = ?";
        // STATEMENTの生成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // パラメータの挿入
        statement.setString(1, id);
        // 詳細情報取得
        ResultSet rs = statement.executeQuery();
        
        // 詳細情報をBeanに格納
        if (rs.next()) {
            
            employeeBean.setId(rs.getString(1));
            employeeBean.setPass(rs.getString(2));
            employeeBean.setName(rs.getString(3));
            employeeBean.setPosition(rs.getString(4));
            employeeBean.setMail(rs.getNString(5));
            employeeBean.setTel(rs.getString(6));
            
        }
        
        // ちゃんと閉じる！
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
        
        // ちゃんと閉じる！
        statement.close();
        return true;
        
    }

    // 従業員削除処理
    public void delete(String id) throws Exception {

        String sql = "delete from employee where employee_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, id);
        statement.executeUpdate();
        
        // ちゃんと閉じる！
        statement.close();
        
    }

    // シフト登録処理
    public boolean insertShift(String employee_id, String date, String start, String end) throws Exception {
        
        String sql = "insert into shift values ( 0, ?, ?, ?, ?)";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, employee_id);
        statement.setString(2, date);
        statement.setString(3, start);
        statement.setString(4, end);
        statement.executeUpdate();
        
        // ちゃんと閉じる！
        statement.close();
        return true;
        
    }

    //  シフト検索処理
    public ArrayList<EmployeeBean> searchShift(String id) throws Exception {
        PreparedStatement statement;
        // Beanのリスト
        ArrayList<EmployeeBean> employeeBeans = new ArrayList<EmployeeBean>();
        
        if (id == "*") {
            // SQL文
            String sql = "select * from shift";
            // STATEMENTの生成
            statement = this.connection.prepareStatement(sql);
        }else{
            // SQL文
            String sql = "select * from shift where employee_id = ?";
            // STATEMENTの生成
            statement = this.connection.prepareStatement(sql);
            // パラメータの挿入(ワイルドカード使用)
            statement.setString(1, id);
        }
        // 検索結果を受け取る
        ResultSet rs = statement.executeQuery();
        
        // 検索結果をBeanのリストに格納
        while (rs.next()) {
            // Beanの生成
            EmployeeBean employeeBean = new EmployeeBean();
            
            // カラムの値をBeanに格納
            employeeBean.setId(rs.getString(2));
            employeeBean.setDate(rs.getString(3));
            employeeBean.setStart(rs.getString(4));
            employeeBean.setEnd(rs.getString(5));
            
            // Beanをリストに追加
            employeeBeans.add(employeeBean);
        }
        
        // ちゃんと閉じる！
        statement.close();
        return employeeBeans;
        
    }

}
