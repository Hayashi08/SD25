package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import tool.DAO;

public class FloorDAO extends DAO {
    
    // コンストラクタ
    // 親コンストラクタを呼び出し
    public FloorDAO() throws Exception {
        super();
    }
    
    // userテーブルへインサート
    public boolean insert(String id,Integer cap,String machine,String state) throws Exception {
        
        // ユーザーIDが重複してないか確認
        if (checkFloorId(id)) {
            return false;
        }

        String sql = "insert into floor values ( ?, ?, ?, ?, 0)";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, id);
        statement.setInt(2, cap);
        statement.setString(3, machine);
        statement.setString(4, state);
        statement.executeUpdate();
        
        // ちゃんと閉じる！
        statement.close();
        return true;
        
    }
    
    // ユーザーIDが存在するかどうかの判定
    private boolean checkFloorId(String floor_id) throws Exception {
        
        boolean flag = false;
        
        String sql = "select * from floor where floor_id like ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, floor_id);
        ResultSet rSet = statement.executeQuery();
        
        if (rSet.next()) {
            flag = true;
        }
        
        // ちゃんと閉じる！
        statement.close();
        return flag;
        
    }
    
}
