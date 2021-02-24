package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.TopBean;
import tool.DAO;

public class TopDAO extends DAO {

    public TopDAO() throws Exception {
        super();
    }
    
    public ArrayList<TopBean> getCurrent() throws Exception {
        ArrayList<TopBean> topBeans = new ArrayList<TopBean>();
        
        String sql = "select a.floor_id, b.situation_id, a.floor_state from floor a left join (select * from  situation where situation_end is NULL) b on a.floor_id = b.floor_id;";
        PreparedStatement statement = this.connection.prepareStatement(sql);
        ResultSet rSet = statement.executeQuery();
        
        while (rSet.next()) {
            TopBean topBean = new TopBean();
            topBean.setFloor_id(rSet.getString(1));
            topBean.setSituation_id(rSet.getString(2));
            topBean.setState(rSet.getString(3));
            topBeans.add(topBean);
        }
        
        statement.close();
        return topBeans;
    }

}
