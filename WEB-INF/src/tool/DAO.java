package tool;

import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.text.SimpleDateFormat;

public class DAO {
    
    //ローカル
    private final String URL = "jdbc:mysql://localhost/masaru_db";
    private final String USER = "root";
    private final String PASSWORD = "";
    private final String DRIVER = "com.mysql.jdbc.Driver";
    private Connection connection = null;
    
    // コネクションを取得
    protected Connection getConnection() throws Exception {
        // JDBCドライバのロード
        Class.forName(DRIVER).newInstance();
        // Connectionオブジェクトの作成
        connection = DriverManager.getConnection(URL,USER,PASSWORD);        
        return connection;
    }
    
    // 現在日を取得
    protected String getDateNow() {
        
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
        
        return simpleDateFormat.format(date);
        
    }
    
    // 現在時を取得
    protected String getTimeNow() {
        
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm:ss");
        
        return simpleDateFormat.format(date);
        
    }

    // 現在日時を取得
    protected String getDateTimeNow() {
        
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        
        return simpleDateFormat.format(date);
        
    }

}
