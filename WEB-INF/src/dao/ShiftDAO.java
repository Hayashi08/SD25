package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tool.DAO;
import bean.ShiftBean;
import bean.ShiftConfirmBean;

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

    // シフト確定処理
    public boolean confirm(String date) throws Exception {
        
        //対象の日付のシフト検索
        String sql_select = "select * from shift where shift_date = ?";
        PreparedStatement sm_select = this.connection.prepareStatement(sql_select);
        sm_select.setString(1, date);
        ResultSet rs = sm_select.executeQuery();
        ArrayList<ShiftBean> shiftBeans = new ArrayList<ShiftBean>();
        while (rs.next()) {

            ShiftBean shiftBean = new ShiftBean();
            shiftBean.setId(rs.getString(1));
            shiftBean.setEmployee_id(rs.getString(2));
            shiftBean.setDate(rs.getString(3));
            shiftBean.setStart(rs.getString(4));
            shiftBean.setEnd(rs.getString(5));
            shiftBeans.add(shiftBean);

        }
        
        sm_select.close();

        //シフト(確定版)に登録
        String sql_insert = "insert into shift_confirm values ( 0, ?, ?, ?, ?)";
        PreparedStatement sm_insert;
        for (int i=0; i < shiftBeans.size(); i++) {

            sm_insert = this.connection.prepareStatement(sql_insert);
            sm_insert.setString(1, shiftBeans.get(i).getEmployee_id());
            sm_insert.setString(2, shiftBeans.get(i).getDate());
            sm_insert.setString(3, shiftBeans.get(i).getStart());
            sm_insert.setString(4, shiftBeans.get(i).getEnd());
            sm_insert.executeUpdate();
            sm_insert.close();

        }
        
        return true;
        
    }

    //  シフト(確定版)検索処理
    public ArrayList<ShiftConfirmBean> searchConfirm() throws Exception {

        //シフト管理トップページ(全件検索)
        String sql = "select sc.shift_confirm_id, sc.shift_confirm_date,shift_confirm_start,sc.shift_confirm_end,employee.employee_name from shift_confirm as sc inner join employee on sc.employee_id = employee.employee_id";
        PreparedStatement sm = this.connection.prepareStatement(sql);
        ResultSet rs = sm.executeQuery();
        ArrayList<ShiftConfirmBean> shiftConfirmBeans = new ArrayList<ShiftConfirmBean>();
        while (rs.next()) {

            ShiftConfirmBean shiftConfirmBean = new ShiftConfirmBean();
            shiftConfirmBean.setId(rs.getString(1));
            shiftConfirmBean.setDate(rs.getString(2));
            shiftConfirmBean.setStart(rs.getString(3));
            shiftConfirmBean.setEnd(rs.getString(4));
            shiftConfirmBean.setName(rs.getString(5));
            shiftConfirmBeans.add(shiftConfirmBean);
        }
        
        sm.close();
        return shiftConfirmBeans;
        
    }

    //  シフト(確定版)日付検索処理
    public ArrayList<ShiftConfirmBean> confirmDate() throws Exception {

        //シフト(日付検索)
        String sql = "select shift_confirm_date from shift_confirm group by shift_confirm_date";
        PreparedStatement sm = this.connection.prepareStatement(sql);
        ResultSet rs = sm.executeQuery();
        ArrayList<ShiftConfirmBean> shiftConfirmBeans = new ArrayList<ShiftConfirmBean>();
        while (rs.next()) {

            ShiftConfirmBean shiftConfirmBean = new ShiftConfirmBean();
            shiftConfirmBean.setDate(rs.getString(1));
            shiftConfirmBeans.add(shiftConfirmBean);

        }
        
        sm.close();
        return shiftConfirmBeans;
        
    }

}

