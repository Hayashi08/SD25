package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;

import tool.DAO;

import bean.SituationBean;
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
    
    // 部屋選択
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
            floorBean.setDevice(rSet.getInt(5));
            
            floorBeans.add(floorBean);
        }
        
        statement.close();
        
        return floorBeans;
    }
    
    // インサート
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
    
    // Set situaton_end 
    public void setEnd(int id) throws Exception {
        
        // SQL文
        String sql = "update situation set situation_end = curtime() where situation_id = ?";
        // STATEMENTの作成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        
        statement.setInt(1, id);
        
        statement.executeUpdate();
        
        statement.close();
        
    }
    
    // 利用詳細GET
    public SituationBean getDetail(int id) throws Exception {
        SituationBean situationBean = new SituationBean();
        
        // SQL文
        String sql = "select * from situation where situation_id = ?";
        // STATEMENTの生成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // パラメータ
        statement.setInt(1, id);
        // 検索結果を受け取る
        ResultSet rSet = statement.executeQuery();
        
        if (rSet.next()) {
            situationBean.setId(rSet.getInt(1));
            situationBean.setUserId(rSet.getString(2));
            situationBean.setFloorId(rSet.getString(3));
            situationBean.setQty(rSet.getInt(4));
            situationBean.setDate(rSet.getString(5));
            situationBean.setStart(rSet.getString(6));
            situationBean.setEndSchedule(rSet.getString(7));
            situationBean.setEnd(rSet.getString(8));
            situationBean.setFree(rSet.getString(9));
        }
        
        statement.close();
        
        return situationBean;
    }
    
    // 現在の利用詳細GET
    public SituationBean getCurrentDetail(String id) throws Exception {
        SituationBean situationBean = new SituationBean();
        
        // SQL文
        String sql = "select * from situation where situation_end is null and floor_id = ?";
        // STATEMENTの生成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // パラメータ
        statement.setString(1, id);
        // 検索結果を受け取る
        ResultSet rSet = statement.executeQuery();
        
        if (rSet.next()) {
            situationBean.setId(rSet.getInt(1));
            situationBean.setUserId(rSet.getString(2));
            situationBean.setFloorId(rSet.getString(3));
            situationBean.setQty(rSet.getInt(4));
            situationBean.setDate(rSet.getString(5));
            situationBean.setStart(rSet.getString(6));
            situationBean.setEndSchedule(rSet.getString(7));
            situationBean.setEnd(rSet.getString(8));
            situationBean.setFree(rSet.getString(9));
        }
        
        statement.close();
        
        return situationBean;
    }
    
    public void finish(String user_id, String id, int sale_total, String floor_id) throws Exception {
        // SQL文
        String sql = "insert into sale values ( 0, ?, ?, ?, curdate())";
        // STATEMENTの作成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // パラメータの挿入
        statement.setString(1, user_id);
        statement.setString(2, id);
        statement.setInt(3, sale_total);
        // SQL文を実行
        statement.executeUpdate();
        
        // floorリセット
        sql = "update floor set floor_state = '未' where floor_id = ?";
        statement = this.connection.prepareStatement(sql);
        statement.setString(1, floor_id);
        statement.executeUpdate();
        
        statement.close();
    }
    
    public int getPrice(int id) throws Exception {
        int price = 0;
        
        SituationBean situationBean = this.getDetail(id);
        String date = situationBean.getDate();
        String start = situationBean.getStart();
        String end_sche = situationBean.getEndSchedule();
        String end = situationBean.getEnd();
        String free = situationBean.getFree();
        int qty = situationBean.getQty();
        
        int start_int = Integer.parseInt(start.substring(0, 2)) * 100 + Integer.parseInt(start.substring(3, 5));
        int end_sche_int = Integer.parseInt(end_sche.substring(0, 2)) * 100 + Integer.parseInt(end_sche.substring(3, 5));
        int end_int = Integer.parseInt(end.substring(0, 2)) * 100 + Integer.parseInt(end.substring(3, 5));

        
        // 時間計算
        if (free.equals("無")) {
            if (end_sche_int >= end_int) {
                price = calcHourPrice(date, start_int, end_sche_int);
            }
            else {
                price = calcHourPrice(date, start_int, end_int);
            }
        }
        else {
            price = calcHourPriceFree(date, start_int, end_sche_int, end_int);
        }
        
        price = price * qty;
        
        // 注文計算
        price += calcMenuPrice(id);
        
        System.out.println(price);
        
        return price;
    }
    
    private int calcHourPrice(String date, int start_int, int end_int) {
        int price = 0;
        
        int noon_weekday = 1000;
        int noon_holiday = 1200;
        int night_weekday = 1200;
        int night_holiday = 1500;
        
        String yobi_str = yobi(date);
        
        System.out.println("開始" + start_int);
        System.out.println("終了" + end_int);
        
        // holiday
        if (yobi_str.equals("金") || yobi_str.equals("土") || yobi_str.equals("日")) {
            
            System.out.println("祝日");
            
            // 昼スタート
            if (start_int < 1500) {
                
                // 昼エンド
                if (end_int <= 1500) {
                    price += ((end_int - start_int)/100) * noon_holiday;
                    if ((end_int - start_int)%100 != 0) {
                        price += noon_holiday;
                    }
                }
                // 夜エンド
                else {
                    // 昼分
                    price += ((1500 - start_int)/100) * noon_holiday;
                    // 夜分
                    price += night_holiday;
                    if (end_int - (1500 + (start_int%100)) > 0) {
                        price += ((end_int - (1500 + (start_int%100))) / 100 ) * night_holiday;
                        if ((end_int - (1500 + (start_int%100))) % 100 != 0) {
                            price += night_holiday;
                        }
                    }

                }
                
            }
            // 夜スタート・エンド
            else {
                
                price += ((end_int - start_int) /100) * night_holiday; 
                if ((end_int - start_int)%100 != 0) {
                    price += night_holiday;
                }

            }
            
        }
        // weekday
        else {
            
            System.out.println("平日");
            
            // 昼スタート
            if (start_int < 1700) {
                
                System.out.println("昼スタート");
                
                // 昼エンド
                if (end_int <= 1700) {
                    
                    System.out.println("昼エンド");
                    
                    price += ((end_int - start_int)/100) * noon_weekday;
                    if ((end_int - start_int)%100 != 0) {
                        price += noon_weekday;
                    }
                }
                // 夜エンド
                else {
                    // 昼分
                    price += ((1700 - start_int)/100) * noon_weekday;
                    // 夜分
                    price += night_weekday;
                    if (end_int - (1700 + (start_int%100)) > 0) {
                        price += ((end_int - (1700 + (start_int%100))) / 100 ) * night_weekday;
                        if ((end_int - (1700 + (start_int%100))) % 100 != 0) {
                            price += night_weekday;
                        }
                    }

                }
                
            }
            // 夜スタート・エンド
            else {
                
                price += ((end_int - start_int) /100) * night_weekday; 
                if ((end_int - start_int)%100 != 0) {
                    price += night_weekday;
                }

            }            
            
        }
        
        return price;
    }
    
    private int calcHourPriceFree(String date, int start_int, int end_sche_int, int end_int) {
        int price = 0;
        
        String yobi_str = yobi(date);
        
        if (start_int >= 1000 && end_sche_int <= 1700) {
            
            if (yobi_str.equals("土") || yobi_str.equals("日")) {
                
                price += 3000;
                
            }
            else {
                
                price += 2500;
                
            }
            
        }
        else {
            
            if (yobi_str.equals("金") || yobi_str.equals("土") || yobi_str.equals("日")) {
                
                price += 4000;
                
            }
            else {
                
                price += 3000;
                
            }
            
        }
        
        // 延長
        if (end_int > end_sche_int) {
            
            price += calcHourPrice(date, end_sche_int, end_int);
            
        }
        
        return price;
    }
    
    private String yobi(String date) {
        
        String[] date_split = date.split("-", 0);
        
        int year = Integer.parseInt(date_split[0]);
        int month = Integer.parseInt(date_split[1]);
        int day = Integer.parseInt(date_split[2]);
        
        Calendar cal = Calendar.getInstance();
        cal.set(year, month, day);
        
        String[] yobi_str = {"日", "月", "火", "水", "木", "金", "土"};
        
        return yobi_str[cal.get(Calendar.DAY_OF_WEEK)-1];
    }
    
    private int calcMenuPrice(int id) throws Exception {
        int price = 0;
        
        // SQL文
        String sql = "select sum(menu_price * menu_qty) from sale_detail a, menu b where a.menu_id = b.menu_id and a.situation_id = ?";
        // STATEMENTの生成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        
        statement.setInt(1, id);
        
        // 検索結果を受け取る
        ResultSet rSet = statement.executeQuery();
        
        if (rSet.next()) {
            price = rSet.getInt(1);
        }
        
        return price;
    }
    
    public void setStateClean(String floor_id) throws Exception {
        
        // SQL文
        String sql = "update floor set floor_state = '済' where floor_id = ?";
        // STATEMENTの作成
        PreparedStatement statement = this.connection.prepareStatement(sql);
        // パラメータの挿入
        statement.setString(1, floor_id);

        // SQL文を実行
        statement.executeUpdate();
        
        statement.close();
        
    }
    
}
