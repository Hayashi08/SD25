package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.apache.jasper.tagplugins.jstl.core.If;

import com.sun.xml.internal.ws.api.ha.StickyFeature;

import tool.DAO;

public class AnalyseDAO extends DAO {
    
    // コンストラクタ
    // 親コンストラクタを呼び出し
    public AnalyseDAO() throws Exception {
        super();
    }

    // menuテーブルへインサート
    public ArrayList<String> analyse(
    		String xaxis , 		String yaxis , 		String date ,
    		String age_lead , 	String age_last , 	Boolean age_check ,
    		String sex , 		String time_lead , 	String time_last , 
    		Boolean timezone_check ,String dotw , 	Boolean dotw_check
			)throws Exception {

        System.out.println(""); 
    	System.out.println("-------ここからDAO-------");
        System.out.println(""); 
        String sql = 	"SELECT ";

        ArrayList<String> datas = new ArrayList<String>();
        String birth_lead = "";
        String birth_last = "";
        int age_lead_int = -1;
        int age_last_int = -1;
        int birth_lead_int = -1;
        int birth_last_int = -1;
        String sex_condition = "";
        int wildcard_cnt = 1;
        String yaxis_column = "";
        String dotw_num = "";
        
        if(yaxis.equals("sales")){
        	sql +=		"SUM(sale_total)";;
        }
        if(yaxis.equals("visitors")){
        	sql +=		"COUNT(situation_qty)";
        }
        sql +=			" FROM sale,user,situation " +
        				"where " +
        				//saleテーブルとuserテーブルを結合
        				"sale.user_id = user.user_id and " +
        				//saleテーブルとsituationテーブルを結合
        				"sale.situation_id = situation.situation_id and ";
        if(!age_check){	//年齢層の絞り込み
        	sql +=		"user_birth between ? and ? and ";
        }
        if(!sex.equals("both")){//性別の絞り込み
        	sql +=		"user_sex = ? and ";
        }
        if(!timezone_check){//時間帯の絞り込み
        	sql +=		"situation_start between ? and ? and ";
        }
      //曜日の絞り込み
        if(!dotw_check){
        	if(dotw.equals("sun")){
        		dotw_num = "1";
        	}
        	if(dotw.equals("mon")){
        		dotw_num = "2";
        	}
        	if(dotw.equals("tue")){
        		dotw_num = "3";
        	}
        	if(dotw.equals("wed")){
        		dotw_num = "4";
        	}
        	if(dotw.equals("thu")){
        		dotw_num = "5";
        	}
        	if(dotw.equals("fri")){
        		dotw_num = "6";
        	}
        	if(dotw.equals("sat")){
        		dotw_num = "7";
        	}
        }
        if(!dotw_check){//曜日の絞り込み
        	sql +=		"WEEKDAY(sale_date) IN (" +
        				dotw_num +
        				") and ";
        }
        				//日付の絞り込み
        if(!xaxis.equals("week")){
        	sql +=		"sale_date like ?";
        }
        else{
        	sql +=		"sale_date between ? and ?";
        }
        //現在の年月日を取得
        Date today = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(today);
        int yy = cal.get(Calendar.YEAR);
        int mm = cal.get(Calendar.MONTH)+1;
        int dd = cal.get(Calendar.DATE);
        
        //年齢の絞り込み
        if(!age_check){
        	age_lead_int = Integer.parseInt(age_lead);
        	age_last_int = Integer.parseInt(age_last);

        	birth_lead_int = yy - age_lead_int;
        	birth_last_int = yy - age_last_int-1;

        	birth_lead = birth_lead_int + "-" + mm + "-" + dd + " 23:59:59";
        	birth_last = birth_last_int + "-" + mm + "-" + dd + " 00:00:00";
        }
        
        //性別の絞り込み
        if(sex.equals("male")){
        	sex = "男";
        }
        if(sex.equals("female")){
        	sex = "女";
        }
        
        
        
        int i = 0;
        if(xaxis.equals("year") || xaxis.equals("week")){
        	i = 10;
        }
        else if(xaxis.equals("month")){
        	i = 12;
        }
        else if(xaxis.equals("day")){
        	i = 7;
        }

        PreparedStatement statement = this.connection.prepareStatement(sql);

        if(xaxis.equals("year")){
        	cal.add(Calendar.YEAR,-1);
        }
        if(xaxis.equals("month")){
        	cal.add(Calendar.MONTH,-1);
        }
        if(xaxis.equals("week")){
        	cal.add(Calendar.DATE,-1);
        }
        if(xaxis.equals("year")){
        	cal.add(Calendar.DATE,-1);
        }
        for(int j = 0 ; j < i ; j++){
            System.out.println(""); 
        	System.out.println("-------ここからfor文-" + j + "周目------");
            System.out.println(""); 
            wildcard_cnt = 1;
            String sale_date_m = "";
            String sale_date_d = "";
            double result_int = -1;
        	// STATEMENTの生成
            statement = this.connection.prepareStatement(sql);
            
            //年齢の絞り込み
            if(!age_check){
            	statement.setString(wildcard_cnt, birth_last);
            	wildcard_cnt++;
            	statement.setString(wildcard_cnt, birth_lead);
            	wildcard_cnt++;
            }
            //性別の絞り込み
            if(!sex.equals("both")){
            	statement.setString(wildcard_cnt, sex);
            	wildcard_cnt++;
            }
            //時間帯の絞り込み
            if(!timezone_check){
            	statement.setString(wildcard_cnt, time_lead + ":00");
            	wildcard_cnt++;
            	statement.setString(wildcard_cnt, time_last + ":00");
            	wildcard_cnt++;
            }
            
            //日付の絞り込み
            yy = cal.get(Calendar.YEAR);
            mm = cal.get(Calendar.MONTH)+1;
            dd = cal.get(Calendar.DATE);
            if(mm < 10){
            	sale_date_m = "0";
            }
            sale_date_m += ""+mm;
            if(dd < 10){
            	sale_date_d = "0";
            }
            sale_date_d += ""+dd;
            if(xaxis.equals("year")){
            	statement.setString(wildcard_cnt, yy + "%");
            	wildcard_cnt++;
            }
            if(xaxis.equals("month")){
            	statement.setString(wildcard_cnt, yy + "-" + sale_date_m + "%");
            	wildcard_cnt++;
            }
            if(xaxis.equals("week")){
            	sale_date_d = "";
            	sale_date_m = "";
            	cal.add(Calendar.DATE,-7);
                yy = cal.get(Calendar.YEAR);
                mm = cal.get(Calendar.MONTH)+1;
                dd = cal.get(Calendar.DATE);
                if(mm < 10){
                	sale_date_m = "0";
                }
                sale_date_m += ""+mm;
                if(dd < 10){
                	sale_date_d = "0";
                }
                sale_date_d += ""+dd;
                
            	statement.setString(wildcard_cnt, yy + "-" + sale_date_m + "-" + sale_date_d + "%");
            	wildcard_cnt++;
            	sale_date_d = "";
            	sale_date_m = "";
            	cal.add(Calendar.DATE,7);
                yy = cal.get(Calendar.YEAR);
                mm = cal.get(Calendar.MONTH)+1;
                dd = cal.get(Calendar.DATE);
                if(mm < 10){
                	sale_date_m = "0";
                }
                sale_date_m += ""+mm;
                if(dd < 10){
                	sale_date_d = "0";
                }
                sale_date_d += ""+dd;
                
            	statement.setString(wildcard_cnt, yy + "-" + sale_date_m + "-" + sale_date_d + "%");
            	wildcard_cnt++;
            }
            if(xaxis.equals("day")){
            	statement.setString(wildcard_cnt, yy + "-" + sale_date_m + "-" + sale_date_d + "%");
            	wildcard_cnt++;
            }

            if(xaxis.equals("year")){
            	cal.add(Calendar.YEAR,-1);
            }
            if(xaxis.equals("month")){
            	cal.add(Calendar.MONTH,-1);
            }
            if(xaxis.equals("week")){
            	cal.add(Calendar.DATE,-7);
            }
            if(xaxis.equals("year")){
            	cal.add(Calendar.DATE,-1);
            }

            System.out.println(statement.toString()); 
        	// 検索結果を受け取る
            ResultSet rSet = statement.executeQuery();
            rSet.next();
            // リストに結果を追加
            if(rSet.getString(1) == null){
            	datas.add("0");
            }
            else{
            	datas.add(rSet.getString(1));
            }
        }
        
        //リストを入れ替える
        ArrayList<String> datas_work = new ArrayList<String>();
        for(int j = datas.size()-1 ; j >= 0 ; j--){
        	datas_work.add(datas.get(j));
        }
        datas = datas_work;
        
        // ちゃんと閉じる！
        statement.close();
        
        System.out.println(""); 
    	System.out.println("-------ここまでDAO-------");
        System.out.println(""); 
        return datas;
        
    }
}
    
