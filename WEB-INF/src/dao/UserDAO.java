package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.UserBean;

import tool.DAO;

public class UserDAO extends DAO {
    
    // コンストラクタ
    public UserDAO() throws Exception {
        // 親コンストラクタを呼び出し
        super();
    }
    
    // userテーブルへインサート
    public boolean insert(String id, String pass, String name, String sex, String birth, String mail, String tel, String job, String credit, String rank) throws Exception {
        
        // ユーザーIDが重複してないか確認
        if (checkUserId(id)) {
            // インサート失敗
            return false;
        }

        // SQL文
        String sql = "insert into user values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, curdate())";
        // STATEMENTの作成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // パラメータの挿入
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
        // SQL文を実行
        statement.executeUpdate();
        
        // ちゃんと閉じる！
        statement.close();
        // インサート成功
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
    
    // 会員検索
    public ArrayList<UserBean> select(String keyword) throws Exception {
        
        // Beanのリスト
        ArrayList<UserBean> userBeans = new ArrayList<UserBean>();
        
        // SQL文
        String sql = "select * from user where user_id like ?";
        // STATEMENTの生成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // パラメータの挿入(ワイルドカード使用)
        statement.setString(1, "%" + keyword + "%");
        // 検索結果を受け取る
        ResultSet rSet = statement.executeQuery();
        
        // 検索結果をBeanのリストに格納
        while (rSet.next()) {
            // Beanの生成
            UserBean userBean = new UserBean();
            
            // カラムの値をBeanに格納
            userBean.setId(rSet.getString("user_id"));
            userBean.setPass(rSet.getString("user_pass"));
            userBean.setName(rSet.getString("user_name"));
            userBean.setSex(rSet.getString("user_sex"));
            userBean.setBirth(rSet.getString("user_birth"));
            userBean.setMail(rSet.getString("user_mail"));
            userBean.setTel(rSet.getString("user_tel"));
            userBean.setJob(rSet.getString("user_job"));
            userBean.setCredit(rSet.getString("user_credit"));
            userBean.setRank(rSet.getString(10));
            userBean.setDate(rSet.getString(11));
            
            // Beanをリストに追加
            userBeans.add(userBean);
        }
        
        return userBeans;
        
    }
    
}
