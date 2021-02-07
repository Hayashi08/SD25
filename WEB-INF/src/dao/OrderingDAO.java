package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tool.DAO;
// import bean.OrderingBean;

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

   //  // 発注検索
   // public ArrayList<OrderingBean> search(String keyword) throws Exception {
       
   //     // Beanのリスト
   //     ArrayList<OrderingBean> orderingBeans = new ArrayList<OrderingBean>();
       
   //     // SQL文
   //     String sql = "select * from ordering where ordering_id like ? or ordering_name like ? or ordering_genre like ?";
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
   //         OrderingBean orderingBean = new OrderingBean();
           
   //         // カラムの値をBeanに格納
   //         orderingBean.setId(rs.getString(1));
   //         orderingBean.setName(rs.getString(2));
   //         orderingBean.setGenre(rs.getString(3));
   //         orderingBean.setMax(rs.getInt(4));
   //         orderingBean.setMin(rs.getInt(5));
           
   //         // Beanをリストに追加
   //         orderingBeans.add(orderingBean);
   //     }
       
   //    // ちゃんと閉じる！
   //    statement.close();
   //    return orderingBeans;
       
   // }
    
   //  // 発注詳細
   //  public OrderingBean detail(String id) throws Exception {
        
   //      // Beanの生成
   //      OrderingBean orderingBean = new OrderingBean();
        
   //      // SQL文
   //      String sql = "select * from ordering where ordering_id = ?";
   //      // STATEMENTの生成
   //      PreparedStatement statement = this.connection.prepareStatement(sql);
   //      // パラメータの挿入
   //      statement.setString(1, id);
   //      // 詳細情報取得
   //      ResultSet rs = statement.executeQuery();
        
   //      // 詳細情報をBeanに格納
   //      if (rs.next()) {
            
   //          orderingBean.setId(rs.getString(1));
   //          orderingBean.setName(rs.getString(2));
   //          orderingBean.setGenre(rs.getString(3));
   //          orderingBean.setMax(rs.getInt(4));
   //          orderingBean.setMin(rs.getInt(5));
            
   //      }
        
   //      // ちゃんと閉じる！
   //      statement.close();
   //      return orderingBean;
   //  }



   //  // 発注更新処理
   //  public boolean update(String id, String name, String genre, int max, int min) throws Exception {

   //      String sql = "update ordering set ordering_name = ?, ordering_genre = ?, ordering_max = ?, ordering_min = ? where ordering_id = ?";
   //      PreparedStatement statement = this.connection.prepareStatement(sql);
   //      statement.setString(1, name);
   //      statement.setString(2, genre);
   //      statement.setInt(3, max);
   //      statement.setInt(4, min);
   //      statement.setString(5, id);
   //      statement.executeUpdate();
        
   //      // ちゃんと閉じる！
   //      statement.close();
   //      return true;
        
   //  }

   //  // 発注削除処理
   //  public void delete(String id) throws Exception {

   //      String sql = "delete from ordering where ordering_id = ?";
   //      PreparedStatement statement = this.connection.prepareStatement(sql);
   //      statement.setString(1, id);
   //      statement.executeUpdate();
        
   //      // ちゃんと閉じる！
   //      statement.close();
        
   //  }

}
