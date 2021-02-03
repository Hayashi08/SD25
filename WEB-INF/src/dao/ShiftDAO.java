package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tool.DAO;
import bean.ShiftBean;

public class ShiftDAO extends DAO {
    
    // コンストラクタ
    // 親コンストラクタを呼び出し
    public ShiftDAO() throws Exception {
        super();
    }
    
    // シフト登録処理
    public boolean insert(String employee_id, String date, String start, String end) throws Exception {
        
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
    public ArrayList<ShiftBean> search(String id) throws Exception {
        PreparedStatement statement;
        // Beanのリスト
        ArrayList<ShiftBean> shiftBeans = new ArrayList<ShiftBean>();
        
        if (id == "*") {
            // SQL文
            String sql = "select shift.shift_id, shift.shift_date,shift_start,shift.shift_end,employee.employee_name from shift inner join employee on shift.employee_id = employee.employee_id";
            // STATEMENTの生成
            statement = this.connection.prepareStatement(sql);
        }else{
            // SQL文
            String sql = "select shift.shift_id, shift.shift_date,shift_start,shift.shift_end,employee.employee_name from shift inner join employee on shift.employee_id = employee.employee_id where shift.employee_id = ?";
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
            ShiftBean shiftBean = new ShiftBean();
            
            // カラムの値をBeanに格納
            shiftBean.setId(rs.getString(1));
            shiftBean.setDate(rs.getString(2));
            shiftBean.setStart(rs.getString(3));
            shiftBean.setEnd(rs.getString(4));
            shiftBean.setName(rs.getString(5));
            
            // Beanをリストに追加
            shiftBeans.add(shiftBean);
        }
        
        // ちゃんと閉じる！
        statement.close();
        return shiftBeans;
        
    }

    // シフト更新処理
    public boolean update(String id, String start, String end) throws Exception {

        String sql = "update shift set shift_start = ?, shift_end = ? where shift_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, start);
        statement.setString(2, end);
        statement.setString(3, id);
        statement.executeUpdate();
        
        // ちゃんと閉じる！
        statement.close();
        return true;
        
    }

    // シフト削除処理
    public void delete(String id) throws Exception {

        String sql = "delete from shift where shift_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, id);
        statement.executeUpdate();
        
        // ちゃんと閉じる！
        statement.close();
        
    }

}
