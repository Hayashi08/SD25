package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tool.DAO;
import bean.ItemBean;

public class ItemDAO extends DAO {
    
    // コンストラクタ
    public ItemDAO() throws Exception {
      
        super();
    }
    
    // 品目登録処理
    public boolean insert(String name, String genre, int max, int min) throws Exception {
        
        String sql = "insert into item values (0, ?, ?, ?, ?)";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, name);
        statement.setString(2, genre);
        statement.setInt(3, max);
        statement.setInt(4, min);
        statement.executeUpdate();
        statement.close();
        return true;
        
    }

    // 品目検索
   public ArrayList<ItemBean> search(String keyword) throws Exception {
       
       ArrayList<ItemBean> itemBeans = new ArrayList<ItemBean>();
       String sql = "select * from item where item_id like ? or item_name like ? or item_genre like ?";
       PreparedStatement statement = this.connection.prepareStatement(sql);
       statement.setString(1, "%" + keyword + "%");
       statement.setString(2, "%" + keyword + "%");
       statement.setString(3, "%" + keyword + "%");
       ResultSet rs = statement.executeQuery();
       while (rs.next()) {

           ItemBean itemBean = new ItemBean();
           itemBean.setId(rs.getString(1));
           itemBean.setName(rs.getString(2));
           itemBean.setGenre(rs.getString(3));
           itemBean.setMax(rs.getInt(4));
           itemBean.setMin(rs.getInt(5));
           itemBeans.add(itemBean);
       }
       
      statement.close();
      return itemBeans;
       
   }
    
    // 品目詳細
    public ItemBean detail(String id) throws Exception {

        ItemBean itemBean = new ItemBean();
        String sql = "select * from item where item_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, id);
        ResultSet rs = statement.executeQuery();
        if (rs.next()) {
            
            itemBean.setId(rs.getString(1));
            itemBean.setName(rs.getString(2));
            itemBean.setGenre(rs.getString(3));
            itemBean.setMax(rs.getInt(4));
            itemBean.setMin(rs.getInt(5));
            
        }
        
        statement.close();
        return itemBean;
    }

    // ジャンル検索
   public ArrayList<ItemBean> searchGenre(String genre) throws Exception {

       // // ビューの作成(初回のみ)
       // String view = "create view stock_control as select i.item_id,i.item_name,i.item_genre,i.item_max,i.item_min,sum(sd.stock_detail_qty) as stock_qty, sum(od.ordering_detail_qty) as ordering_qty,od.ordering_detail_state, o.ordering_date from item as i left join stock_detail as sd on sd.item_id = i.item_id left join ordering_detail as od on od.item_id = i.item_id and ordering_detail_state = '1' left join ordering as o on o.ordering_id = od.ordering_id and o.ordering_date = (select min(o.ordering_date) from ordering) group by i.item_id";
       // PreparedStatement stmt = this.connection.prepareStatement(view);
       // stmt.executeUpdate();

       ArrayList<ItemBean> itemBeans = new ArrayList<ItemBean>();
       String sql = "select * from stock_control where item_genre like ?";
       PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, "%" + genre + "%");
       ResultSet rs = statement.executeQuery();
           while (rs.next()) {

           ItemBean itemBean = new ItemBean();
           itemBean.setId(rs.getString(1));
           itemBean.setName(rs.getString(2));
           itemBean.setGenre(rs.getString(3));
           itemBean.setMax(rs.getInt(4));
           itemBean.setMin(rs.getInt(5));
           itemBean.setSumQty(rs.getInt(6));
           itemBean.setOrderSumQty(rs.getInt(7));
           itemBean.setOrderState(rs.getString(8));
           itemBean.setOrderDate(rs.getString(9));
           itemBeans.add(itemBean);
           }

      statement.close();
      return itemBeans;
       
   }

    // 品目更新処理
    public boolean update(String id, String name, String genre, int max, int min) throws Exception {

        String sql = "update item set item_name = ?, item_genre = ?, item_max = ?, item_min = ? where item_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, name);
        statement.setString(2, genre);
        statement.setInt(3, max);
        statement.setInt(4, min);
        statement.setString(5, id);
        statement.executeUpdate();
        statement.close();
        return true;
        
    }

    // 品目削除処理
    public void delete(String id) throws Exception {

        String sql = "delete from item where item_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, id);
        statement.executeUpdate();
        statement.close();
        
    }

}
