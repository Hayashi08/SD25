package action.analyse;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.SaleBean;
import dao.AnalyseDAO;

import tool.Action;

public class TopAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        // パラメータの取得
    	
        String xaxis = request.getParameter("xaxis");
        if(xaxis == null){//最初の読み込み
        	xaxis = "month";
        }
        String yaxis = request.getParameter("yaxis");
        if(yaxis == null){//最初の読み込み
        	yaxis = "sales";
        }
        String date = request.getParameter("date");//また後でやる
        if(date == null){
        	date = "";
        }

        String age_lead = "";
        age_lead = request.getParameter("age_lead");
        String age_last = "";
        age_last = request.getParameter("age_last");
        int age_lead_int = 0;
        int age_last_int = 0;
        String age_check_str = request.getParameter("age_check");
        boolean age_check = false;
        if(age_lead == null){//最初の読み込み
        	age_check = true;
        }
        if(age_lead != null){//最初の読み込みでない場合
        	if(age_check_str != null){//booleanに変換
        		age_check = true;
	        	age_lead = "";
	        	age_last = "";
        	}
	        if(age_lead.equals("") || age_last.equals("")){//入力欄に空欄があり、チェックがされていない場合
	        	age_check = true;
	        	age_lead = "";
	        	age_last = "";
	        }
	        if(!age_lead.equals("") && !age_last.equals("")){//入力欄両方に入力されている場合
	        	age_lead_int = Integer.parseInt(age_lead);
	        	age_last_int = Integer.parseInt(age_last);
		        if(age_lead_int > age_last_int){//入力に矛盾がある場合
		        	age_check = true;
		        	age_lead = "";
		        	age_last = "";
		        }
	        }
        }
        if(age_lead == null){//最初の読み込み
        	age_lead = "";
        }
        if(age_last == null){//最初の読み込み
        	age_last = "";
        }
        String sex = request.getParameter("sex");
        if(sex == null){//最初の読み込み
        	sex = "both";
        }
        
        String time_lead = "";
        time_lead = request.getParameter("time_lead");
        String time_last = "";
        time_last = request.getParameter("time_last");
        
        int time_lead_int = 0;
        int time_last_int = 0;
        String timezone_check_str = request.getParameter("timezone_check");
        boolean timezone_check = true;
        if(timezone_check_str == null){//最初の読み込み
        	timezone_check = true;
        }
        if(time_lead != null){//最初の読み込みでない場合
        	if(timezone_check_str != null){
        		timezone_check = true;
	        	time_lead = "";
	        	time_last = "";
        	}
        	else{
        		timezone_check = false;
        	}
	        if(time_lead.equals("") || time_last.equals("")){//入力欄に空欄があり、チェックがされていない場合
	        	timezone_check = true;
	        	time_lead = "";
	        	time_last = "";
	        }
	        if(!time_lead.equals("") && !time_last.equals("")){//入力欄両方に入力されている場合
	            String[] time_lead_split = time_lead.split(":", 0);
	            String time_lead_work = "";
	            for(int i = 0 ; i < time_lead_split.length ; i++){
	            	time_lead_work += time_lead_split[i];
	            }
	            System.out.println(time_lead_work);
	            String[] time_last_split = time_last.split(":", 0);
	            String time_last_work = "";
	            for(int i = 0 ; i < time_last_split.length ; i++){
	            	time_last_work += time_last_split[i];
	            }
	        	time_lead_int = Integer.parseInt(time_lead_work);
	        	time_last_int = Integer.parseInt(time_last_work);
		        if(time_lead_int > time_last_int){//入力に矛盾がある場合
		        	timezone_check = true;
		        	time_lead = "";
		        	time_last = "";
		        }
	        }
        }
        if(time_lead == null){//最初の読み込み
        	time_lead = "";
        }
        if(time_last == null){//最初の読み込み
        	time_last = "";
        }
        String dotw = request.getParameter("dotw");
        String dotw_check_str = request.getParameter("dotw_check");
        boolean dotw_check = true;
        if(dotw == null){//最初の読み込み
        	dotw_check = true;
        }
        if(dotw != null){//最初の読み込みでない場合
        	if(dotw_check_str != null){
        		dotw_check = true;
        	}
        	else{
        		dotw_check = false;
        	}
        	if(dotw.equals("") || xaxis.equals("day")){//入力欄が空欄だった場合と、x軸がdayの場合
        		dotw_check = true;
        	}
        }
        if(dotw == null){
        	dotw = "";
        }
        System.out.println("");
        System.out.println("------ここからservelet------"); 
        System.out.println(""); 

        System.out.println("xaxis : " + xaxis);
        System.out.println("yaxis : " + yaxis);
        System.out.println("date : " + date);
        System.out.println("age_lead : " + age_lead);
        System.out.println("age_last : " + age_last);
        System.out.println("age_check : " + age_check);
        System.out.println("sex : " + sex);
        System.out.println("time_lead : " + time_lead);
        System.out.println("time_last : " + time_last);
        System.out.println("timezone_check : " + timezone_check);
        System.out.println("dotw : " + dotw);
        System.out.println("dotw_check : " + dotw_check);

        request.setAttribute("xaxis", xaxis);
        request.setAttribute("yaxis", yaxis);
        request.setAttribute("date", date);
        request.setAttribute("age_lead", age_lead);
        request.setAttribute("age_last", age_last);
        request.setAttribute("age_check", age_check);
        request.setAttribute("sex", sex);
        request.setAttribute("time_lead", time_lead);
        request.setAttribute("time_last", time_last);
        request.setAttribute("timezone_check", timezone_check);
        request.setAttribute("dotw", dotw);
        request.setAttribute("dotw_check", dotw_check);

        // DAOの生成
        AnalyseDAO analyseDAO = new AnalyseDAO();
        // DAOメソッドの実行
        ArrayList<String> datas = 
        				analyseDAO.analyse(xaxis , yaxis , 
        						   date , age_lead ,
        						   age_last , age_check ,
        						   sex , time_lead ,
        						   time_last , timezone_check ,
        						   dotw , dotw_check , null
        						   );
        // ちゃんと閉じる！
        analyseDAO.close();
        
        for(int i = 0 ; i < datas.size() ; i++){
        	System.out.print(i + " : ");
        	System.out.println(datas.get(i));
        }

        request.setAttribute("datas", datas);

        System.out.println("");
        System.out.println("------ここまでservelet------"); 
        System.out.println(""); 

        return "/view/analyse/top.jsp";
    }

}
