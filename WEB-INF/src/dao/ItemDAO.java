package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tool.DAO;
import bean.ItemBean;

public class ItemDAO extends DAO {
    
    // コンストラクタ
    public ItemDAO() throws Exception {
        // 親コンストラクタを呼び出し
        super();
    }
    
    // 品目登録処理
    public boolean insert(String name, String genre, int max, int min) throws Exception {
        
        // SQL文
        String sql = "insert into item values (0, ?, ?, ?, ?)";
        // STATEMENTの作成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // パラメータの挿入
        statement.setString(1, name);
        statement.setString(2, genre);
        statement.setInt(3, max);
        statement.setInt(4, min);
        // SQL文を実行
        statement.executeUpdate();
        
        // ちゃんと閉じる！
        statement.close();
        // インサート成功
        return true;
        
    }

    // 品目検索
   public ArrayList<ItemBean> search(String keyword) throws Exception {
       
       // Beanのリスト
       ArrayList<ItemBean> itemBeans = new ArrayList<ItemBean>();
       
       // SQL文
       String sql = "select * from item where item_id like ? or item_name like ? or item_genre like ?";
       // STATEMENTの生成
       PreparedStatement statement = this.connection.prepareStatement(sql);
       // パラメータの挿入(ワイルドカード使用)
       statement.setString(1, "%" + keyword + "%");
       statement.setString(2, "%" + keyword + "%");
       statement.setString(3, "%" + keyword + "%");
       // 検索結果を受け取る
       ResultSet rs = statement.executeQuery();
       
       // 検索結果をBeanのリストに格納
       while (rs.next()) {
           // Beanの生成
           ItemBean itemBean = new ItemBean();
           
           // カラムの値をBeanに格納
           itemBean.setId(rs.getString(1));
           itemBean.setName(rs.getString(2));
           itemBean.setGenre(rs.getString(3));
           itemBean.setMax(rs.getInt(4));
           itemBean.setMin(rs.getInt(5));
           
           // Beanをリストに追加
           itemBeans.add(itemBean);
       }
       
      // ちゃんと閉じる！
      statement.close();
      return itemBeans;
       
   }
    
    // 品目詳細
    public ItemBean detail(String id) throws Exception {
        
        // Beanの生成
        ItemBean itemBean = new ItemBean();
        
        // SQL文
        String sql = "select * from item where item_id = ?";
        // STATEMENTの生成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // パラメータの挿入
        statement.setString(1, id);
        // 詳細情報取得
        ResultSet rs = statement.executeQuery();
        
        // 詳細情報をBeanに格納
        if (rs.next()) {
            
            itemBean.setId(rs.getString(1));
            itemBean.setName(rs.getString(2));
            itemBean.setGenre(rs.getString(3));
            itemBean.setMax(rs.getInt(4));
            itemBean.setMin(rs.getInt(5));
            
        }
        
        // ちゃんと閉じる！
        statement.close();
        return itemBean;
    }

    // ジャンル検索
   public ArrayList<ItemBean> searchGenre(String genre) throws Exception {

       // // ビューの作成(初回のみ)
       // String view = "create view stock_control as select item.item_id,item.item_name,item.item_genre,item.item_max,item.item_min,sum(stock_detail.stock_detail_qty) from item left join stock_detail on stock_detail.item_id = item.item_id group by item.item_id";
       // PreparedStatement stmt = this.connection.prepareStatement(sql);
       // stmt.executeUpdate();

       // Beanのリスト
       ArrayList<ItemBean> itemBeans = new ArrayList<ItemBean>();
       
       // SQL文
       String sql = "select * from stock_control where item_genre like ?";
       // STATEMENTの生成
       PreparedStatement statement = this.connection.prepareStatement(sql);
       // パラメータの挿入(ワイルドカード使用)
        statement.setString(1, genre);
       // 検索結果を受け取る
       ResultSet rs = statement.executeQuery();
       
           // 検索結果をBeanのリストに格納
           while (rs.next()) {
           // Beanの生成
           ItemBean itemBean = new ItemBean();
           
           // カラムの値をBeanに格納
           itemBean.setId(rs.getString(1));
           itemBean.setName(rs.getString(2));
           itemBean.setGenre(rs.getString(3));
           itemBean.setMax(rs.getInt(4));
           itemBean.setMin(rs.getInt(5));
           itemBean.setSumQty(rs.getInt(6));
           
           // Beanをリストに追加
           itemBeans.add(itemBean);
           }

      // ちゃんと閉じる！
      statement.close();
      return itemBeans;
       
   }

    // 従業員更新処理
    public boolean update(String id, String name, String genre, int max, int min) throws Exception {

        String sql = "update item set item_name = ?, item_genre = ?, item_max = ?, item_min = ? where item_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, name);
        statement.setString(2, genre);
        statement.setInt(3, max);
        statement.setInt(4, min);
        statement.setString(5, id);
        statement.executeUpdate();
        
        // ちゃんと閉じる！
        statement.close();
        return true;
        
    }

    // 従業員削除処理
    public void delete(String id) throws Exception {

        String sql = "delete from item where item_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, id);
        statement.executeUpdate();
        
        // ちゃんと閉じる！
        statement.close();
        
    }

}