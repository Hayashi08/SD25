package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tool.DAO;
import bean.StockBean;

public class StockDAO extends DAO {
    
    // コンストラクタ
    public StockDAO() throws Exception {
        // 親コンストラクタを呼び出し
        super();
    }
    
    // 在庫登録処理
    public boolean insert(String employee_id, String item_id) throws Exception {

        //発注数量検索
        StockBean stockBean = new StockBean();
        String sqlSelect = "select ordering_id,ordering_detail_qty from ordering_detail where item_id = ? and ordering_detail_state = true order by ordering_id limit 1";
        PreparedStatement psSelect = this.connection.prepareStatement(sqlSelect);
        psSelect.setString(1, item_id);
        ResultSet rs = psSelect.executeQuery();
        
        if (rs.next()) {
            
            stockBean.setOrderId(rs.getString(1));
            stockBean.setOrderQty(rs.getInt(2));
            
        }
        
        psSelect.close();

        //発注状況変更
        String sqlUpdate = "update ordering_detail set ordering_detail_state = '0' where ordering_id = ?";
        PreparedStatement psUpdate = this.connection.prepareStatement(sqlUpdate);
        psUpdate.setString(1, stockBean.getOrderId());
        psUpdate.executeUpdate();
        psUpdate.close();

        //在庫テーブルに登録
        String sql = "insert into stock values (0, ?, curdate())";
        PreparedStatement ps = this.connection.prepareStatement(sql);
        ps.setString(1, employee_id);
        ps.executeUpdate();
        ps.close();

        //在庫詳細テーブルに登録
        String sqlDetail = "insert into stock_detail values (0, LAST_INSERT_ID(), ?, ?)";
        PreparedStatement psDetail = this.connection.prepareStatement(sqlDetail);
        psDetail.setString(1, item_id);
        psDetail.setInt(2, stockBean.getOrderQty());
        psDetail.executeUpdate();
        psDetail.close();
        
        return true;
        
    }

    // 在庫検索
   public ArrayList<StockBean> search(String keyword) throws Exception {
       
       // // ビューの作成(初回のみ)
       // String view = "create view stock_operation as select s.stock_id,i.item_name,i.item_genre,i.item_max,i.item_min,sd.stock_detail_qty,e.employee_name,s.stock_date from item as i inner join stock_detail as sd on i.item_id = sd.item_id inner join stock as s on s.stock_id = sd.stock_id inner join employee as e on e.employee_id = s.employee_id order by s.stock_id desc";
       // PreparedStatement psview = this.connection.prepareStatement(view);
       // psview.executeUpdate();

       ArrayList<StockBean> stockBeans = new ArrayList<StockBean>();
       String sql = "select stock_id,item_name,SUM(stock_detail_qty),item_genre " +
       				" from stock_operation " +
       				" where stock_id like ? or item_name like ? or item_genre like ?" +
       				" group by item_name " +
       				" order by item_name asc";	
       PreparedStatement ps = this.connection.prepareStatement(sql);
       ps.setString(1, "%" + keyword + "%");
       ps.setString(2, "%" + keyword + "%");
       ps.setString(3, "%" + keyword + "%");
       ResultSet rs = ps.executeQuery();
       while (rs.next()) {

           StockBean stockBean = new StockBean();
           stockBean.setId(rs.getString(1));
           stockBean.setName(rs.getString(2));
           stockBean.setQty(rs.getInt(3));
           stockBean.setGenre(rs.getString(4));
           stockBeans.add(stockBean);

       }
       
      ps.close();
      return stockBeans;
       
   }
    
    // 在庫詳細
    public StockBean detail(String id) throws Exception {
        
        StockBean stockBean = new StockBean();
        String sql = "select * from stock_operation where stock_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, id);
        ResultSet rs = statement.executeQuery();
        if (rs.next()) {
            
            stockBean.setId(rs.getString(1));
            stockBean.setName(rs.getString(2));
            stockBean.setGenre(rs.getString(3));
            stockBean.setMax(rs.getInt(4));
            stockBean.setMin(rs.getInt(5));
            stockBean.setQty(rs.getInt(6));
            stockBean.setEmployeeName(rs.getString(7));
            stockBean.setDate(rs.getString(8));
            
        }
        
        statement.close();
        return stockBean;
    }
    
    public boolean insert_cons(String employee_id, String item_name, int qty) throws Exception {

        //在庫テーブルに登録
        String sql = "insert into stock values (0, ?, curdate())";
        PreparedStatement ps = this.connection.prepareStatement(sql);
        ps.setString(1, employee_id);
        ps.executeUpdate();
        ps.close();
        
        //item_name から item_id を取得
        sql = "select item_id from item where item_name = ?";
        PreparedStatement psItem = this.connection.prepareStatement(sql);
        psItem.setString(1, item_name);
        ResultSet rs = psItem.executeQuery();
        String item_id = "";
        if (rs.next()) {
            item_id = rs.getString(1);
        }
        psItem.close();
        

        //在庫詳細テーブルに登録
        String sqlDetail = "insert into stock_detail values (0, LAST_INSERT_ID(), ?, ?)";
        PreparedStatement psDetail = this.connection.prepareStatement(sqlDetail);
        psDetail.setString(1, item_id);
        psDetail.setInt(2, qty);
        psDetail.executeUpdate();
        psDetail.close();
        
        return true;
        
    }



    // // 在庫更新処理
    // public boolean update(String id, String name, String genre, int max, int min) throws Exception {

    //     String sql = "update stock set stock_name = ?, stock_genre = ?, stock_max = ?, stock_min = ? where stock_id = ?";
    //     PreparedStatement statement = this.connection.prepareStatement(sql);
    //     statement.setString(1, name);
    //     statement.setString(2, genre);
    //     statement.setInt(3, max);
    //     statement.setInt(4, min);
    //     statement.setString(5, id);
    //     statement.executeUpdate();
        
    //     // ちゃんと閉じる！
    //     statement.close();
    //     return true;
        
    // }

   //  // 在庫削除処理
   //  public void delete(String id) throws Exception {

   //      String sql = "delete from stock where stock_id = ?";
   //      PreparedStatement statement = this.connection.prepareStatement(sql);
   //      statement.setString(1, id);
   //      statement.executeUpdate();
        
   //      // ちゃんと閉じる！
   //      statement.close();
        
   //  }

}
