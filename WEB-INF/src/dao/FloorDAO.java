package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tool.DAO;
import bean.FloorBean;

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
    

// フロア検索処理
	public ArrayList<FloorBean> search(String keyword) throws Exception {
	    
	    // Beanのリスト
	    ArrayList<FloorBean> floorBeans = new ArrayList<FloorBean>();
	    
	    // SQL文
	    String sql = "select * from floor where floor_id like ?";
	    // STATEMENTの生成
	    PreparedStatement statement = this.connection.prepareStatement(sql);
	    // パラメータの挿入(ワイルドカード使用)
	    statement.setString(1, "%" + keyword + "%");
	    // 検索結果を受け取る
	    ResultSet rs = statement.executeQuery();
	    
	    // 検索結果をBeanのリストに格納
	    while (rs.next()) {
	        // Beanの生成
	    	FloorBean floorBean = new FloorBean();
	        
	        // カラムの値をBeanに格納
	        floorBean.setId(rs.getString(1));
	        floorBean.setCap(rs.getInt(2));
	        floorBean.setMachine(rs.getString(3));
	        floorBean.setState(rs.getString(4));
	        floorBean.setDevice(rs.getInt(5));
	        
	        // Beanをリストに追加
	        floorBeans.add(floorBean);
	    }
	    
        
        // ちゃんと閉じる！
        statement.close();
        return floorBeans;
	    
	}
	
	
    // 部屋詳細
    public FloorBean detail(String id) throws Exception {
        
        // Beanの生成
        FloorBean floorBean = new FloorBean();
        
        // SQL文
        String sql = "select * from floor where floor_id = ?";
        // STATEMENTの生成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // パラメータの挿入
        statement.setString(1, id);
        // 詳細情報取得
        ResultSet rs = statement.executeQuery();
        
        // 詳細情報をBeanに格納
        if (rs.next()) {
            
	        floorBean.setId(rs.getString(1));
	        floorBean.setCap(rs.getInt(2));
	        floorBean.setMachine(rs.getString(3));
	        floorBean.setState(rs.getString(4));
	        floorBean.setDevice(rs.getInt(5));
            

        }
        
        // ちゃんと閉じる！
        statement.close();
        return floorBean;
    }
    
    
    // フロア更新処理
    public boolean update(String id,Integer cap,String machine,String state) throws Exception {

        String sql = "update floor set floor_cap = ?, floor_machine = ?, floor_state = ? where floor_id = ? ";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setInt(1, cap);
        statement.setString(2, machine);
        statement.setString(3, state);
        statement.setString(4, id);
        statement.executeUpdate();
        
        // ちゃんと閉じる！
        statement.close();
        return true;
        
    }
    
    
    
    // フロア削除処理
    public void delete(String id) throws Exception {

        String sql = "delete from floor where floor_id = ?";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        statement.setString(1, id);
        statement.executeUpdate();
        
        // ちゃんと閉じる！
        statement.close();
        
    }

    // フロアデバイス更新処理
    public boolean updateOrderUser(String floor_id) throws Exception {

        //フロアIDが存在しない場合
        if (!(checkFloorId(floor_id))) {
            return false;
        }

        FloorBean floorBean = new FloorBean();
        String select_sql = "select floor_device from floor where floor_id = ?";
        PreparedStatement select_sm = this.connection.prepareStatement(select_sql);
        select_sm.setString(1, floor_id);
        ResultSet rs = select_sm.executeQuery();
        
        if (rs.next()) {
            
            floorBean.setDevice(rs.getInt(1));
            
        }
        
        select_sm.close();

        //フロアのデバイス登録状態
        if (floorBean.getDevice() == 1) {
            return false;
        }

        String update_sql = "update floor set floor_device = 1 where floor_id = ? ";
        PreparedStatement update_sm = this.connection.prepareStatement(update_sql);
        update_sm.setString(1, floor_id);
        update_sm.executeUpdate();
        
        update_sm.close();
        return true;
        
    }

}
