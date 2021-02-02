package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import tool.DAO;

public class OrderDAO extends DAO {
    
    // コンストラクタ
    // 親コンストラクタを呼び出し
    public OrderDAO() throws Exception {
        super();
    }
    
    // userテーブルへインサート
    public boolean insert(String name, String genre, String price, String des, String allergy) throws Exception {

        String sql = "insert into menu values ( 0, ?, ?, ?, curdate(), curdate(), ?,?)";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, name);
        statement.setString(2, genre);
        statement.setString(3, price);
        statement.setString(4, des);
        statement.setString(5, allergy);
        statement.executeUpdate();
        // ちゃんと閉じる！
        statement.close();
        return true;
        
    }
    
    
}
