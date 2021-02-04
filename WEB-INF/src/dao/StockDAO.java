package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.StockBean;

import tool.DAO;

public class StockDAO extends DAO {
    
    // コンストラクタ
    public StockDAO() throws Exception {
        // 親コンストラクタを呼び出し
        super();
    }
    
    // stockテーブルへインサート
    public boolean insert(String name, String genre, String qty, String max, String min) throws Exception {

        // SQL文
        String sql = "insert into stock values ( 0, 'nhs', curdate())";
        // STATEMENTの作成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.executeUpdate();
        // SQL文
        String sql_item = "insert into item values ( 0, ?, ?, ?, ? )";
        // STATEMENTの作成
        PreparedStatement statement_item = this.connection.prepareStatement(sql_item);
        
        statement.setString(1, name);
        statement.setString(2, genre);
        statement.setString(3, max);
        statement.setString(4, min);
        
        statement_item.executeUpdate();

        // パラメータの挿入
        statement.setString(1, name);
        statement.setString(2, genre);
        statement.setString(3, qty);
        statement.setString(4, max);
        statement.setString(5, min);

        // SQL文を実行
        statement.executeUpdate();
        
        // ちゃんと閉じる！
        statement.close();
        // インサート成功
        return true;
        
    }
    
    // ユーザーIDが存在するかどうかの判定
    private boolean checkStockId(String stock_id) throws Exception {
        
        boolean flag = false;
        
        String sql = "select * from stock where stock_id like ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, stock_id);
        ResultSet rSet = statement.executeQuery();
        
        if (rSet.next()) {
            flag = true;
        }
        
        statement.close();
        
        return flag;
        
    }
    
    // 会員検索
    public ArrayList<stockBean> select(String keyword) throws Exception {
        
        // Beanのリスト
        ArrayList<StockBean> stockBeans = new ArrayList<StockBean>();
        
        // SQL文
        String sql = "select * from stock where stock_id like ?";
        // STATEMENTの生成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // パラメータの挿入(ワイルドカード使用)
        statement.setString(1, "%" + keyword + "%");
        // 検索結果を受け取る
        ResultSet rSet = statement.executeQuery();
        
        // 検索結果をBeanのリストに格納
        while (rSet.next()) {
            // Beanの生成
            StockBean stockBean = new StockBean();
            
            // カラムの値をBeanに格納
            stockBean.setId(rSet.getString(1));
            stockBean.setPass(rSet.getString(2));
            stockBean.setName(rSet.getString(3));
            stockBean.setSex(rSet.getString(4));
            stockBean.setBirth(rSet.getString(5));
            stockBean.setMail(rSet.getString(6));
            stockBean.setTel(rSet.getString(7));
            stockBean.setJob(rSet.getString(8));
            stockBean.setCredit(rSet.getString(9));
            stockBean.setRank(rSet.getString(10));
            stockBean.setDate(rSet.getString(11));
            
            // Beanをリストに追加
            stockBeans.add(stockBean);
        }
        
        return stockBeans;
        
    }
    
}
