package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tool.DAO;
import bean.OrderUserBean;
import bean.SituationBean;

public class OrderUserDAO extends DAO {
    
    // コンストラクタ
    public OrderUserDAO() throws Exception {
        super();
    }
    
    // // 注文登録処理
    public boolean insert(String id, String floor_id, int qty) throws Exception {

        SituationBean situationBean = new SituationBean();
        String select_sql = "select situation_id from situation where floor_id = ? and situation_end is null";
        PreparedStatement select_ps = this.connection.prepareStatement(select_sql);
        select_ps.setString(1, floor_id);
        ResultSet rs = select_ps.executeQuery();
        
        if (rs.next()) {
            
            situationBean.setId(rs.getInt(1));
        }
        
        select_ps.close();

        
        String insert_sql = "insert into task values ( 0, ?, ?, ?, ?, curtime(), null, null)";
        PreparedStatement insert_ps = this.connection.prepareStatement(insert_sql);
        insert_ps.setString(1, id);
        insert_ps.setInt(2, situationBean.getId());
        insert_ps.setString(3, floor_id);
        insert_ps.setInt(4, qty);
        insert_ps.executeUpdate();
        
        insert_ps.close();
        return true;
        
    }

    //  メニュー検索処理
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

    // メニュー詳細
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

    //  履歴検索処理
    public ArrayList<OrderUserBean> archive(String floor_id) throws Exception {

        ArrayList<OrderUserBean> order_userBeans = new ArrayList<OrderUserBean>();
        String sql = " select m.menu_name,m.menu_price,t.task_qty,t.task_deploy from menu as m natural join task as t where t.floor_id = ?";
        PreparedStatement ps = this.connection.prepareStatement(sql);
        ps.setString(1, floor_id);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {

            OrderUserBean order_userBean = new OrderUserBean();
            order_userBean.setName(rs.getString(1));
            order_userBean.setPrice(rs.getInt(2));
            order_userBean.setQty(rs.getInt(3));
            order_userBean.setDeploy(rs.getString(4));
            order_userBeans.add(order_userBean);
        }
        
        ps.close();
        return order_userBeans;
        
    }

}
