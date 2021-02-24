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
        
        String sql = "select * from user where user_id = ?";
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
    public ArrayList<UserBean> search(String keyword) throws Exception {
        
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
            
            // Beanをリストに追加
            userBeans.add(userBean);
        }
        
        return userBeans;
        
    }
    
    
    // 会員詳細
    public UserBean detail(String id) throws Exception {
        
        // Beanの生成
        UserBean userBean = new UserBean();
        
        // SQL文
        String sql = "select * from user where user_id = ?";
        // STATEMENTの生成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // パラメータの挿入
        statement.setString(1, id);
        // 詳細情報取得
        ResultSet rSet = statement.executeQuery();
        
        // 詳細情報をBeanに格納
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
        
        // ちゃんと閉じる！
        statement.close();
        return userBean;
    }
    
    
    // 会員更新処理
    public boolean update(String id, String pass, String name, String sex, String birth, String mail, String tel, String job, String credit, String rank, String date) throws Exception {

        String sql = "update user set user_pass = ?, user_name = ?, user_sex = ?, user_birth = ?, user_mail = ?, user_tel = ?, user_job = ?, user_credit = ?, user_rank = ?, user_date = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, pass);
        statement.setString(2, name);
        statement.setString(3, sex);
        statement.setString(4, birth);
        statement.setString(5, mail);
        statement.setString(6, tel);
        statement.setString(7, job);
        statement.setString(8, credit);
        statement.setString(9, rank);
        statement.setString(10, date);
        statement.executeUpdate();
        
        // ちゃんと閉じる！
        statement.close();
        return true;
        
    }
    
    
    // 会員削除処理
    public void delete(String id) throws Exception {

        String sql = "delete from user where user_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, id);
        statement.executeUpdate();
        
        // ちゃんと閉じる！
        statement.close();
        
    }
    
}
