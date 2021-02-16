package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tool.DAO;
import bean.OrderUserBean;

public class OrderUserDAO extends DAO {
    
    // コンストラクタ
    public OrderUserDAO() throws Exception {
        super();
    }
    
    // // 注文管理(ユーザー)登録処理
    // public boolean insert(String employee_id, String date, String start, String end) throws Exception {
        
    //     String sql = "insert into shift values ( 0, ?, ?, ?, ?)";
    //     PreparedStatement statement = this.connection.prepareStatement(sql);
    //     statement.setString(1, employee_id);
    //     statement.setString(2, date);
    //     statement.setString(3, start);
    //     statement.setString(4, end);
    //     statement.executeUpdate();
        
    //     statement.close();
    //     return true;
        
    // }

    //  注文管理(ユーザー)検索処理
    public ArrayList<OrderUserBean> search(String genre) throws Exception {

        PreparedStatement statement;
        ArrayList<OrderUserBean> order_userBeans = new ArrayList<OrderUserBean>();
        
        String sql = "select menu_id,menu_name from menu where menu_genre = ?";
        statement = this.connection.prepareStatement(sql);
        statement.setString(1, genre);

        ResultSet rs = statement.executeQuery();
        while (rs.next()) {

            OrderUserBean order_userBean = new OrderUserBean();
            order_userBean.setId(rs.getString(1));
            order_userBean.setName(rs.getString(2));
            order_userBeans.add(order_userBean);
        }
        
        statement.close();
        return order_userBeans;
        
    }

    // 注文管理(ユーザー)詳細
    public OrderUserBean detail(String id) throws Exception {
        
        OrderUserBean order_userBean = new OrderUserBean();
        String sql = "select * from menu where menu_id = ?";
        PreparedStatement ps = this.connection.prepareStatement(sql);
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
            
            order_userBean.setId(rs.getString(1));
            order_userBean.setName(rs.getString(2));
            order_userBean.setGenre(rs.getString(3));
            order_userBean.setPrice(rs.getInt(4));
            order_userBean.setCreate(rs.getString(5));
            order_userBean.setUpdate(rs.getString(6));
            order_userBean.setDes(rs.getString(7));
            order_userBean.setAllergy(rs.getString(8));
        }
        
        ps.close();
        return order_userBean;
    }


    // // 注文管理(ユーザー)更新処理
    // public boolean update(String id, String start, String end) throws Exception {

    //     String sql = "update shift set shift_start = ?, shift_end = ? where shift_id = ?";
    //     PreparedStatement statement = this.connection.prepareStatement(sql);
    //     statement.setString(1, start);
    //     statement.setString(2, end);
    //     statement.setString(3, id);
    //     statement.executeUpdate();
        
    //     statement.close();
    //     return true;
        
    // }

    // // 注文管理(ユーザー)削除処理
    // public void delete(String id) throws Exception {

    //     String sql = "delete from shift where shift_id = ?";
    //     PreparedStatement statement = this.connection.prepareStatement(sql);
    //     statement.setString(1, id);
    //     statement.executeUpdate();
        
    //     statement.close();
        
    // }

}
