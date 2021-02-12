package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.OrderBean;
import bean.TaskBean;

import tool.DAO;

public class OrderDAO extends DAO {
    
    // コンストラクタ
    // 親コンストラクタを呼び出し
    public OrderDAO() throws Exception {
        super();
    }

    // menuテーブルへインサート
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
    // taskテーブルへインサート
    public boolean insert_task(String floor_id, String situation_id, String task_time, String menu_id, String task_qty) throws Exception {

        String sql = "insert into task values ( 0, ?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, menu_id);
        statement.setString(2, situation_id);
        statement.setString(3, floor_id);
        statement.setString(4, task_qty);
        statement.setString(5, task_time);
        statement.setString(6, null);
        statement.executeUpdate();
        // ちゃんと閉じる！
        statement.close();
        return true;
        
    }
    

    // メニュー検索
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
    // メニュー検索
    public OrderBean search_byid(String id) throws Exception {
        
        // Beanのリスト
        OrderBean orderBean = new OrderBean();
        
        // SQL文
        String sql = "select * from menu where menu_id = ?";
        // STATEMENTの生成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // パラメータの挿入
        statement.setString(1,id);
        // 検索結果を受け取る
        ResultSet rSet = statement.executeQuery();
        
        if(rSet.next()){
            orderBean.setMenu_id(Integer.parseInt(rSet.getString(1)));
            orderBean.setMenu_name(rSet.getString(2));
            orderBean.setMenu_genre(rSet.getString(3));
            orderBean.setMenu_price(Integer.parseInt(rSet.getString(4)));
            orderBean.setMenu_create(rSet.getString(5));
            orderBean.setMenu_update(rSet.getString(6));
            orderBean.setMenu_des(rSet.getString(7));
            orderBean.setMenu_allergy(rSet.getString(8));
            
        	return orderBean;
        }
        else{
        	return null;
        }
        
    }
    

 // タスクundeployed全件検索
    public ArrayList<TaskBean> searchall_undeployed() throws Exception {
        
        // Beanのリスト
        ArrayList<TaskBean> taskBeans = new ArrayList<TaskBean>();
        
        // SQL文
        String sql = "select * from task where task_deploy is null and task_comp is null  order by task_time asc";
        // STATEMENTの生成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // 検索結果を受け取る

        ResultSet rSet = statement.executeQuery();
        
        // 検索結果をBeanのリストに格納
        while (rSet.next()) {
            // Beanの生成
            TaskBean taskBean = new TaskBean();
            
            // カラムの値をBeanに格納
            taskBean.setTask_id(rSet.getInt(1));
            taskBean.setMenu_id(rSet.getInt(2));
            taskBean.setSituation_id(rSet.getInt(3));
            taskBean.setFloor_id(rSet.getString(4));
            taskBean.setTask_qty(rSet.getInt(5));
            taskBean.setTask_time(rSet.getString(6));
            taskBean.setTask_comp(rSet.getString(7));
            taskBean.setTask_deploy(rSet.getString(8));
            // Beanをリストに追加
           taskBeans.add(taskBean);
        }
        
        return taskBeans;
        
    }
    // タスクundeployed　キーワード検索
    public ArrayList<TaskBean> search_undeployed(String keyword) throws Exception {
        
        // Beanのリスト
        ArrayList<TaskBean> taskBeans = new ArrayList<TaskBean>();
        
        // SQL文
        String sql = "select * from task where task_id like ? and task_deploy is null and task_comp is null  order by task_time asc";

        // STATEMENTの生成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // パラメータの挿入(ワイルドカード使用)
        statement.setString(1, "%" + keyword + "%");
        // 検索結果を受け取る
        ResultSet rSet = statement.executeQuery();
        
        // 検索結果をBeanのリストに格納
        while (rSet.next()) {
            // Beanの生成
            TaskBean taskBean = new TaskBean();
            
            // カラムの値をBeanに格納
            taskBean.setTask_id(rSet.getInt(1));
            taskBean.setMenu_id(rSet.getInt(2));
            taskBean.setSituation_id(rSet.getInt(3));
            taskBean.setFloor_id(rSet.getString(4));
            taskBean.setTask_qty(rSet.getInt(5));
            taskBean.setTask_time(rSet.getString(6));
            taskBean.setTask_comp(rSet.getString(7));
            taskBean.setTask_deploy(rSet.getString(8));
            // Beanをリストに追加
           taskBeans.add(taskBean);
        }
        
        return taskBeans;
        
    }

    // タスクdeployed全件検索
    public ArrayList<TaskBean> searchall_deployed() throws Exception {
        
        // Beanのリスト
        ArrayList<TaskBean> taskBeans = new ArrayList<TaskBean>();
        
        // SQL文
        String sql = "select * from task where task_deploy is not null and task_comp is null order by task_time asc";
        // STATEMENTの生成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // 検索結果を受け取る
        ResultSet rSet = statement.executeQuery();
        
        // 検索結果をBeanのリストに格納
        while (rSet.next()) {
            // Beanの生成
            TaskBean taskBean = new TaskBean();
            
            // カラムの値をBeanに格納
            taskBean.setTask_id(rSet.getInt(1));
            taskBean.setMenu_id(rSet.getInt(2));
            taskBean.setSituation_id(rSet.getInt(3));
            taskBean.setFloor_id(rSet.getString(4));
            taskBean.setTask_qty(rSet.getInt(5));
            taskBean.setTask_time(rSet.getString(6));
            taskBean.setTask_comp(rSet.getString(7));
            taskBean.setTask_deploy(rSet.getString(8));
            // Beanをリストに追加
           taskBeans.add(taskBean);
        }
        
        return taskBeans;
        
    }

    // タスクdeployed キーワード検索
    public ArrayList<TaskBean> search_deployed(String keyword) throws Exception {
        
        // Beanのリスト
        ArrayList<TaskBean> taskBeans = new ArrayList<TaskBean>();
        
        // SQL文
        String sql = "select * from task where task_id like ? and task_deploy is not null and task_comp is null order by task_time asc";
        
        // STATEMENTの生成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // パラメータの挿入(ワイルドカード使用)
        statement.setString(1, "%" + keyword + "%");
        // 検索結果を受け取る
        System.out.println(statement.toString());
        ResultSet rSet = statement.executeQuery();
        
        // 検索結果をBeanのリストに格納
        while (rSet.next()) {
            // Beanの生成
            TaskBean taskBean = new TaskBean();
            
            // カラムの値をBeanに格納
            taskBean.setTask_id(rSet.getInt(1));
            taskBean.setMenu_id(rSet.getInt(2));
            taskBean.setSituation_id(rSet.getInt(3));
            taskBean.setFloor_id(rSet.getString(4));
            taskBean.setTask_qty(rSet.getInt(5));
            taskBean.setTask_time(rSet.getString(6));
            taskBean.setTask_comp(rSet.getString(7));
            taskBean.setTask_deploy(rSet.getString(8));
            // Beanをリストに追加
           taskBeans.add(taskBean);
        }
        
        return taskBeans;
        
    }

    // 詳細
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
    // 更新処理
    public boolean update(String id, String name, String genre, String price, String des, String allergy) throws Exception {
    	if(allergy.equals("")){
    		allergy = "なし";
    	}if(des.equals("")){
    		des = "なし";
    	}
        String sql = "update menu set menu_name = ?, menu_genre = ?, " +
        			 			     "menu_price = ?, menu_update = curdate(), " +
        			 			     "menu_des = ?, menu_allergy = ? " +
        			 			     "where menu_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, name);
        statement.setString(2, genre);
        statement.setString(3, price);
        statement.setString(4, des);
        statement.setString(5, allergy);
        statement.setString(6, id);
        //System.out.println(statement.toString());
        statement.executeUpdate();
        
        
        // ちゃんと閉じる！
        statement.close();
        return true;
        
    }
    // task_comp処理
    public boolean task_comp(String task_stn  , String task_id) throws Exception {
        String sql = "update task set task_comp = curtime() where task_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, task_id);
        statement.executeUpdate();
        
        // ちゃんと閉じる！
        statement.close();
        return true;
        
    }
    // task_deploy処理
    public boolean task_deploy(String task_stn  , String task_id) throws Exception {
        String sql = "update task set task_deploy = curtime() where task_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, task_id);
        statement.executeUpdate();
        
        // ちゃんと閉じる！
        statement.close();
        return true;
        
    }
    
    // 売上詳細追加
    public boolean insert_sale(String task_id ,String situatin_id , String menu_id , String task_qty , String sex , String age) throws Exception {
        String sql = "insert into sale_detail values(0 , ? , ? , ? , ? , ?)";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, situatin_id);
        statement.setString(2, menu_id);
        statement.setString(3, task_qty);
        statement.setString(4, sex);
        statement.setString(5, age);
        statement.executeUpdate();
        
        // ちゃんと閉じる！
        statement.close();
        return true;
        
    }

    
    
}
