package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tool.DAO;
import bean.OrderingBean;

public class OrderingDAO extends DAO {
    
    // コンストラクタ
    public OrderingDAO() throws Exception {
        // 親コンストラクタを呼び出し
        super();
    }
    
    // 発注登録処理
    public boolean insert(String employee_id, String item_id, int qty) throws Exception {
        
        //発注テーブルに登録
        String sql = "insert into ordering values (0, ?, curdate())";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, employee_id);
        statement.executeUpdate();
        statement.close();

        //発注詳細テーブルに登録
        String sql_detail = "insert into ordering_detail values (0, LAST_INSERT_ID(), ?, ?, true)";
        PreparedStatement stmt = this.connection.prepareStatement(sql_detail);
        stmt.setString(1, item_id);
        stmt.setInt(2, qty);
        stmt.executeUpdate();
        stmt.close();
        
        return true;
        
    }

    // 発注検索
   public ArrayList<OrderingBean> search(String keyword) throws Exception {
       
       // // ビューの作成(初回のみ)
       // String view = "create view ordering_operation as select o.ordering_id,i.item_name,i.item_genre,i.item_max,i.item_min,od.ordering_detail_qty,od.ordering_detail_state,o.employee_id,o.ordering_date from item as i inner join ordering_detail as od on i.item_id = od.item_id inner join ordering as o on o.ordering_id = od.ordering_id order by o.ordering_id desc";
       // PreparedStatement psview = this.connection.prepareStatement(view);
       // psview.executeUpdate();

       ArrayList<OrderingBean> orderingBeans = new ArrayList<OrderingBean>();
       String sql = "select ordering_id,item_name,ordering_detail_qty,ordering_detail_state,ordering_date from ordering_operation where ordering_id like ? or item_name like ? or item_genre like ?";
       PreparedStatement ps = this.connection.prepareStatement(sql);
       ps.setString(1, "%" + keyword + "%");
       ps.setString(2, "%" + keyword + "%");
       ps.setString(3, "%" + keyword + "%");
       ResultSet rs = ps.executeQuery();
       while (rs.next()) {

           OrderingBean orderingBean = new OrderingBean();
           orderingBean.setId(rs.getString(1));
           orderingBean.setName(rs.getString(2));
           orderingBean.setQty(rs.getInt(3));
           orderingBean.setState(rs.getBoolean(4));
           orderingBean.setDate(rs.getString(5));
           orderingBeans.add(orderingBean);

       }
       
      ps.close();
      return orderingBeans;
       
   }
    
    // 発注詳細
    public OrderingBean detail(String id) throws Exception {
        
        OrderingBean orderingBean = new OrderingBean();
        String sql = "select * from ordering_operation where ordering_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, id);
        ResultSet rs = statement.executeQuery();
        if (rs.next()) {
            
            orderingBean.setId(rs.getString(1));
            orderingBean.setName(rs.getString(2));
            orderingBean.setGenre(rs.getString(3));
            orderingBean.setMax(rs.getInt(4));
            orderingBean.setMin(rs.getInt(5));
            orderingBean.setQty(rs.getInt(6));
            orderingBean.setState(rs.getBoolean(7));
            orderingBean.setEmployeeId(rs.getString(8));
            orderingBean.setDate(rs.getString(9));
            
        }
        
        statement.close();
        return orderingBean;
    }



    // 発注更新処理
    public boolean update(String id, int qty) throws Exception {

        String sql = "update ordering_detail set ordering_detail_qty = ? where ordering_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setInt(1, qty);
        statement.setString(2, id);
        statement.executeUpdate();
        statement.close();
        return true;
        
    }

    // 発注削除処理
    public void delete(String id) throws Exception {

        //発注詳細削除
        String sql_detail = "delete from ordering_detail where ordering_id = ?";
        PreparedStatement psdetail = this.connection.prepareStatement(sql_detail);
        psdetail.setString(1, id);
        psdetail.executeUpdate();
        psdetail.close();

        //発注削除
        String sql = "delete from ordering where ordering_id = ?";
        PreparedStatement ps = this.connection.prepareStatement(sql);
        ps.setString(1, id);
        ps.executeUpdate();
        ps.close();
        
    }

}
