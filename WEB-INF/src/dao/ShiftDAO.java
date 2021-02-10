package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tool.DAO;
import bean.ShiftBean;

public class ShiftDAO extends DAO {
    
    // コンストラクタ
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
        
        statement.close();
        return true;
        
    }

    //  シフト検索処理
    public ArrayList<ShiftBean> search(String employee_id) throws Exception {

        PreparedStatement statement;
        ArrayList<ShiftBean> shiftBeans = new ArrayList<ShiftBean>();
        
        //シフト管理トップページ(全件検索)
        if (employee_id == "*") {

            String sql = "select shift.shift_id, shift.shift_date,shift_start,shift.shift_end,employee.employee_name from shift inner join employee on shift.employee_id = employee.employee_id";
            statement = this.connection.prepareStatement(sql);

        //シフト登録画面(1件検索)
        }else{

            String sql = "select shift.shift_id, shift.shift_date,shift_start,shift.shift_end,employee.employee_name from shift inner join employee on shift.employee_id = employee.employee_id where shift.employee_id = ?";
            statement = this.connection.prepareStatement(sql);
            statement.setString(1, employee_id);

        }
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {

            ShiftBean shiftBean = new ShiftBean();
            shiftBean.setId(rs.getString(1));
            shiftBean.setDate(rs.getString(2));
            shiftBean.setStart(rs.getString(3));
            shiftBean.setEnd(rs.getString(4));
            shiftBean.setName(rs.getString(5));
            shiftBeans.add(shiftBean);
        }
        
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
        
        statement.close();
        return true;
        
    }

    // シフト削除処理
    public void delete(String id) throws Exception {

        String sql = "delete from shift where shift_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, id);
        statement.executeUpdate();
        
        statement.close();
        
    }

}
