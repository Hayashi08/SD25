package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tool.DAO;

import bean.UserBean;
import bean.FloorBean;

public class SituationDAO extends DAO {
    
    // コンストラクタ
    public SituationDAO() throws Exception {
        // 親コンストラクタを呼び出し
        super();
    }

    // 会員認証
    public UserBean authUser(String id) throws Exception {
        
        UserBean userBean = new UserBean();
        
        // SQL文
        String sql = "select * from user where user_id like ?";
        // STATEMENTの生成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // パラメータの挿入(ワイルドカード使用)
        statement.setString(1, id);
        // 検索結果を受け取る
        ResultSet rSet = statement.executeQuery();
        
        if (rSet.next()) {
            userBean.setId(rSet.getString(1));
            userBean.setPass(rSet.getString(2));
            userBean.setName(rSet.getString(3));
            userBean.setSex(rSet.getString(4));
            userBean.setBirth(rSet.getString(5));
            userBean.setMail(rSet.getString(6));
            userBean.setTel(rSet.getString(7));
            userBean.setJob(rSet.getString(8));
            userBean.setCredit(rSet.getString(9));
            userBean.setRank(rSet.getString(10));
            userBean.setDate(rSet.getString(11));

        }
        
        statement.close();
        
        return userBean;
        
    }
    
    public ArrayList<FloorBean> serchAvailableFloor() throws Exception {
        ArrayList<FloorBean> floorBeans = new ArrayList<FloorBean>();
        
        // SQL文
        String sql = "select * from floor where floor_id not in ( select floor_id from situation where situation_end is null )";
        // STATEMENTの生成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // 検索結果を受け取る
        ResultSet rSet = statement.executeQuery();
        
        while (rSet.next()) {
            FloorBean floorBean = new FloorBean();
            
            floorBean.setId(rSet.getString(1));
            floorBean.setCap(rSet.getInt(2));
            floorBean.setMachine(rSet.getString(3));
            floorBean.setState(rSet.getString(4));
            floorBean.setDevice(rSet.getString(5));
            
            floorBeans.add(floorBean);
        }
        
        statement.close();
        
        return floorBeans;
    }
    
    public boolean insert(String user_id, String floor_id, int qty, String start, String end, String free) throws Exception {
        // SQL文
        String sql = "insert into situation values ( 0, ?, ?, ?, curdate(), ?, ?, NULL, ?)";
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
        
        return true;
    }
    
}
