package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import tool.DAO;

public class UserDAO extends DAO {
    
    // プロパティ
    private Connection connection = null;
    
    // コンストラクタでコネクションへ接続
    public UserDAO() throws Exception {
        
        this.connection = this.getConnection();
        
    }
    
    // userテーブルへインサート
    public boolean insert(String id, String pass, String name, String sex, String birth, String mail, String tel, String job, String credit, String rank) throws Exception {
        
        // ユーザーIDが重複してないか確認
        if (checkUserId(id)) {
            return false;
        }
        
        String sql = "insert into user values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, curdate())";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, id);
        statement.setString(2, pass);
        statement.setString(3, name);
        statement.setString(4, sex);
        statement.setString(5, birth);
        statement.setString(6, mail);
        statement.setString(7, tel);
        statement.setString(8, job);
        statement.setString(9, credit);
        statement.setString(10, rank);
        statement.executeUpdate();
        
        statement.close();
        return true;
        
    }
    
    // ユーザーIDが存在するかどうかの判定
    private boolean checkUserId(String user_id) throws Exception {
        
        boolean flag = false;
        
        String sql = "select * from user where user_id like ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, user_id);
        ResultSet rSet = statement.executeQuery();
        
        if (rSet.next()) {
            flag = true;
        }
        
        statement.close();
        return flag;
        
    }
    
    // コネクションの切断
    public void close() throws Exception {
        
        this.connection.close();
        
    }

}
