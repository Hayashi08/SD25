package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.EmployeeBean;
import bean.OrderBean;

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
    

    // 会員検索
    public ArrayList<OrderBean> search(String keyword) throws Exception {
        
        // Beanのリスト
        ArrayList<OrderBean> orderBeans = new ArrayList<OrderBean>();
        
        // SQL文
        String sql = "select * from menu where menu_name like ?";
        // STATEMENTの生成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // パラメータの挿入(ワイルドカード使用)
        statement.setString(1, "%" + keyword + "%");
        // 検索結果を受け取る
        ResultSet rSet = statement.executeQuery();
        
        // 検索結果をBeanのリストに格納
        while (rSet.next()) {
            // Beanの生成
            OrderBean orderBean = new OrderBean();
            
            // カラムの値をBeanに格納
            orderBean.setMenu_id(Integer.parseInt(rSet.getString(1)));
            orderBean.setMenu_name(rSet.getString(2));
            orderBean.setMenu_genre(rSet.getString(3));
            orderBean.setMenu_price(Integer.parseInt(rSet.getString(4)));
            orderBean.setMenu_create(rSet.getString(5));
            orderBean.setMenu_update(rSet.getString(6));
            orderBean.setMenu_des(rSet.getString(7));
            orderBean.setMenu_allergy(rSet.getString(8));
            
            // Beanをリストに追加
            orderBeans.add(orderBean);
        }
        
        return orderBeans;
        
    }

    // 従業員詳細
    public OrderBean detail(String id) throws Exception {
        
        // Beanの生成
        OrderBean orderBean = new OrderBean();
        
        // SQL文
        String sql = "select * from menu where menu_id = ?";
        // STATEMENTの生成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // パラメータの挿入
        statement.setString(1, id);
        // 詳細情報取得
        ResultSet rs = statement.executeQuery();
        
        // 詳細情報をBeanに格納
        if (rs.next()) {
            orderBean.setMenu_id(Integer.parseInt(rs.getString(1)));
            orderBean.setMenu_name(rs.getString(2));
            orderBean.setMenu_genre(rs.getString(3));
            orderBean.setMenu_price(Integer.parseInt(rs.getString(4)));
            orderBean.setMenu_create(rs.getString(5));
            orderBean.setMenu_update(rs.getString(6));
            orderBean.setMenu_des(rs.getString(7));
            orderBean.setMenu_allergy(rs.getString(8));
        }
        
        // ちゃんと閉じる！
        statement.close();
        return orderBean;
    }

    // 削除処理
    public void delete(String id) throws Exception {

        String sql = "delete from menu where menu_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, id);
        statement.executeUpdate();
        
        // ちゃんと閉じる！
        statement.close();
        
    }

    
    
}
