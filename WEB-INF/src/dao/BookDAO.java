package dao;

import java.sql.PreparedStatement;

import tool.DAO;

public class BookDAO extends DAO {
    
    // コンストラクタ
    public BookDAO() throws Exception {
        // 親コンストラクタを呼び出し
        super();
    }
    
    public void insertToday(String user_id, String floor_id, int qty, String start, String end, String free) throws Exception {
        
        // SQL文
        String sql = "insert into book values ( 0, ?, ?, ?, curdate(), ?, ?, ?, now())";
        // STATEMENTの作成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // パラメータの挿入
        statement.setString(1, user_id);
        statement.setString(2, floor_id);
        statement.setInt(3, qty);
        statement.setString(4, start);
        statement.setString(5, end);
        statement.setString(6, free);
        // SQL文を実行
        statement.executeUpdate();
        
        statement.close();
        
    }

}
