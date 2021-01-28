package tool;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO {
    
    // DB設定
    private final String URL = "jdbc:mysql://localhost/masaru_db";
    private final String USER = "root";
    private final String PASSWORD = "";
    private final String DRIVER = "com.mysql.jdbc.Driver";
    protected Connection connection = null;
    
    // コンストラクタ
    //コネクションの接続
    protected DAO() throws Exception {
        // JDBCドライバのロード
        Class.forName(DRIVER).newInstance();
        // Connectionオブジェクトの作成
        this.connection = DriverManager.getConnection(URL,USER,PASSWORD);
    }
    
    // コネクションの切断
    public void close() throws Exception {       
        this.connection.close();       
    }

}
