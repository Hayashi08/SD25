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
        String sqlUpdate = "update ordering_detail set ordering_detail_state = false where ordering_id = ?";
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

   //  // 在庫検索
   // public ArrayList<StockBean> search(String keyword) throws Exception {
       
   //     // Beanのリスト
   //     ArrayList<StockBean> stockBeans = new ArrayList<StockBean>();
       
   //     // SQL文
   //     String sql = "select * from stock where stock_id like ? or stock_name like ? or stock_genre like ?";
   //     // STATEMENTの生成
   //     PreparedStatement statement = this.connection.prepareStatement(sql);
   //     // パラメータの挿入(ワイルドカード使用)
   //     statement.setString(1, "%" + keyword + "%");
   //     statement.setString(2, "%" + keyword + "%");
   //     statement.setString(3, "%" + keyword + "%");
   //     // 検索結果を受け取る
   //     ResultSet rs = statement.executeQuery();
       
   //     // 検索結果をBeanのリストに格納
   //     while (rs.next()) {
   //         // Beanの生成
   //         StockBean stockBean = new StockBean();
           
   //         // カラムの値をBeanに格納
   //         stockBean.setId(rs.getString(1));
   //         stockBean.setName(rs.getString(2));
   //         stockBean.setGenre(rs.getString(3));
   //         stockBean.setMax(rs.getInt(4));
   //         stockBean.setMin(rs.getInt(5));
           
   //         // Beanをリストに追加
   //         stockBeans.add(stockBean);
   //     }
       
   //    // ちゃんと閉じる！
   //    statement.close();
   //    return stockBeans;
       
   // }
    
    // // 在庫詳細
    // public StockBean detail(String id) throws Exception {
        
    //     // Beanの生成
    //     StockBean stockBean = new StockBean();
        
    //     // SQL文
    //     String sql = "select * from stock where stock_id = ?";
    //     // STATEMENTの生成
    //     PreparedStatement statement = this.connection.prepareStatement(sql);
    //     // パラメータの挿入
    //     statement.setString(1, id);
    //     // 詳細情報取得
    //     ResultSet rs = statement.executeQuery();
        
    //     // 詳細情報をBeanに格納
    //     if (rs.next()) {
            
    //         stockBean.setId(rs.getString(1));
    //         stockBean.setName(rs.getString(2));
    //         stockBean.setGenre(rs.getString(3));
    //         stockBean.setMax(rs.getInt(4));
    //         stockBean.setMin(rs.getInt(5));
            
    //     }
        
    //     // ちゃんと閉じる！
    //     statement.close();
    //     return stockBean;
    // }



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
