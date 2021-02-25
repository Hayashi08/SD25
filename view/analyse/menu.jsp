<%@ page contentType="text/html;charset=UTF-8" %>
<% System.out.println(""); %>
<% System.out.println("----------ここからjsp-------------"); %>
<% System.out.println(""); %>
<!-- import -->
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.OrderBean" %>

<% //x軸を取得
    String xaxis = (String)request.getAttribute("xaxis");
    if(xaxis == null){
        xaxis = "month";
    }
%>

<% //y軸を取得
    String yaxis = (String)request.getAttribute("yaxis");
    if(yaxis == null){
        yaxis = "sales";
    }
%>

<%//現在の日時を取得
        Date today = new Date();

        Calendar cal = Calendar.getInstance();

        cal.setTime(today);
        String date = (String)request.getAttribute("date");
        if(!date.equals("")){
            String[] date_ar = date.split("-" , 0);
            cal.set(Calendar.YEAR,Integer.parseInt(date_ar[0]));
            cal.set(Calendar.MONTH,Integer.parseInt(date_ar[1]));
            cal.set(Calendar.DATE,Integer.parseInt(date_ar[2]));
        }
        else{
            date = "" + cal.get(Calendar.YEAR) + "-";
            if(cal.get(Calendar.MONTH)+1 < 10){
                date += "0";
            }
            date += "" + (cal.get(Calendar.MONTH)+1) + "-";
            if(cal.get(Calendar.DATE) < 10){
                date += "0";
            }
            date += "" + cal.get(Calendar.DATE);
        }
        if(date.equals("")){
          if(xaxis.equals("year")){
              cal.add(Calendar.YEAR,1);
          }
          if(xaxis.equals("month")){
              cal.add(Calendar.MONTH,1);
          }
        }
        int yy = cal.get(Calendar.YEAR);
        int mm = cal.get(Calendar.MONTH)+1;
        int dd = cal.get(Calendar.DATE);
        int dayofweek = cal.get(Calendar.DAY_OF_WEEK);//1~7
        int hour = cal.get(Calendar.HOUR);//午前午後がわからないので注意
        int minute = cal.get(Calendar.MINUTE);
        int second = cal.get(Calendar.SECOND);
%>

<% //変数宣言

        int i = 0;
        int y1 = 0;
        int y2 = 0;
        int m1 = 0;
        int m2 = 0;
        int d = 0;
        int w = 0;
        int max = 0;
        int data = 0;
        int stepsize=0;
        double dif = -1;
        String difstr = "";
        String str = "";
        String w_str = "";
        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(today);

        // ArrayList<String> datas = new ArrayList<String>();
        // datas.add("1000");
        // datas.add("100");
        // datas.add("200");
        // datas.add("1500000");
        // datas.add("0");
        // datas.add("20");

        ArrayList<String> datas = (ArrayList<String>)request.getAttribute("datas");
        ArrayList<String> menulist_reco = (ArrayList<String>)request.getAttribute("menulist_reco");
        ArrayList<String> menulist_food = (ArrayList<String>)request.getAttribute("menulist_food");
        ArrayList<String> menulist_drink = (ArrayList<String>)request.getAttribute("menulist_drink");
        ArrayList<String> menulist_side = (ArrayList<String>)request.getAttribute("menulist_side");
        ArrayList<String> menulist_dessert = (ArrayList<String>)request.getAttribute("menulist_dessert");
        String[] checked_menu = (String[])request.getAttribute("checked_menu");

        //最大値、最小値を取得
        int min = Integer.parseInt(datas.get(0));
        for(i = 0 ; i < datas.size() ; i++){
            data = Integer.parseInt(datas.get(i));
            if(max < data){
                max = data;
            }
            if(min > data){
                min = data;
            }
        }
        dif = max - min;
        System.out.println("max : " + max);
        System.out.println("min : " + min);
        System.out.println("dif : " + dif);


        double max_double = max;
        double min_double = min;
        max_double = Math.ceil(max_double/10) *10;
        min_double = Math.floor(min_double/10) *10;
        max_double += 10;
        min_double -= 10;
        System.out.println("max_double : " + max_double);
        System.out.println("min_double : " + min_double);

        if(max_double <= 0){
            max_double = 1;
        }
        if(min_double <= 0){
            min_double = 0;
        }
        difstr = "" + dif;
        int cnt = 0;
        for(i = 0  ; i < difstr.length() ; i++){
            cnt++;
        }
        cnt -= 2;
        for(i = 0 ; i < cnt ; i++){
            dif = dif / 10;
        }

        dif = Math.round(dif);
        if(dif==0){
            stepsize = 5;
            cnt--;
        }
        else{
            stepsize = 1;
        }
        for(i = 0 ; i < cnt-1 ; i++){
            stepsize = stepsize * 10;
        }
        System.out.println("stepsize : " + stepsize);

        int unit_int = 1;
        String unit_str = "";
        if(max >= 10000){
            unit_int = 10000;
            unit_str = "万";
        }
        if(max >= 1000000){
            unit_int = 1000000;
            unit_str = "百万";
        }
        if(max >= 10000000){
            unit_int = 10000000;
            unit_str = "千万";
        }
        if(max >= 100000000){
            unit_int = 100000000;
            unit_str = "億";
        }
        /*if(max >= 10000000000){
            unit_int = 10000000000;
            unit_str = "百億";
        }*/


%>
<html lang="ja">
    <head>
        <title>全体売上</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <form action="FrontController" method="POST">
        <input type="text" name="class_name" value="analyse.MenuAction" hidden>

        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-5 my-3 col-4 main_title">
                    メニュー別売上
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <div class="row">
                        <div class="col-8">
                            <div class="row my-3">
                                <input type="date" class="form-control" name="date" value="<%= date %>">
                            </div>
                            <div class="row my-3">
                                <select name="yaxis">
                                    <option value="sales"
                                    <% if(yaxis.equals("sales")){ %>
                                    selected
                                    <% } %>
                                    >売上

                                    <option value="noo"
                                    <% if(yaxis.equals("noo")){ %>
                                    selected
                                    <% } %>
                                    >注文数
                                </select>
                                <% //System.out.println(yaxis); %>
                            </div>
                            <div class="row">
                                <div class="h4 col text-center">
                                    <% if(xaxis.equals("year")){ %>
                                    <%= yy-10 %>年~<%= yy-1 %>年
                                    <% } %>
                                    <% if(xaxis.equals("month")){ %>
                                        <% if(mm == 1){ %>
                                            <%= yy-1 %>年
                                        <%}else{%>
                                            <%= yy-1 %>年~<%= yy %>年
                                        <% } %>
                                    <% } %>
                                    <% if(xaxis.equals("week")){ %>
                                        <% 
                                            y1 = cal2.get(Calendar.YEAR);
                                            m1 = cal2.get(Calendar.MONTH)+1;

                                            str = str + y1 + "年 " + m1 + "月~";

                                            cal2.add(Calendar.DATE,-69-dayofweek);
                                            m2 = cal2.get(Calendar.MONTH)+1;
                                            y2 = cal2.get(Calendar.YEAR);
                                            if(y1 != y2){
                                                str = str + y2 + "年 ";
                                            }
                                            str = str + m2 + "月";
                                         %>
                                         <%= str %>
                                    <% } %>
                                    <% if(xaxis.equals("day")){
                                            cal2.add(Calendar.DATE,-10);
                                            m1 = cal2.get(Calendar.MONTH)+1;
                                            d = cal2.get(Calendar.DATE);

                                            str = str + m1 + "月" + d + "日~";

                                            cal2.add(Calendar.DATE,10);
                                            m2 = cal2.get(Calendar.MONTH)+1;
                                            d = cal2.get(Calendar.DATE);
                                            if(m1 != m2){
                                                str = str + m2 + "月";
                                        }
                                            str = str + d + "日";
                                    %>
                                        <%= str %>
                                    <% } %>
                                </div>
                            </div>
                            <div class="row my-3" style="">
                                <canvas id="myLineChart"></canvas>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
                                
                                <script>
                                  var ctx = document.getElementById("myLineChart");
                                  var myLineChart = new Chart(ctx, {
                                    type: 'line',
                                    data: {
                                      labels: [

                                      <% //年ごとの場合
                                        if(xaxis.equals("year")){
                                            y1 = yy-10;
                                            for(i = 1 ; i <= 10 ; i++){
                                      %>
                                      '<%= y1 %>年'
                                      <% 
                                          if(i!=10){
                                      %>
                                      ,
                                      <%
                                          }//if閉じ
                                          y1++;
                                        }//for閉じ
                                      }//if閉じ 
                                      %>

                                      <% //月ごとの場合
                                        if(xaxis.equals("month")){
                                            i = 1;
                                            m1 = mm;
                                            while(i <= 12){
                                      %>
                                      '<%= m1 %>月'
                                      <% 
                                          if(i!=12){
                                      %>
                                      ,
                                      <%
                                          }//if閉じ
                                          i++;
                                          if(m1>=12){
                                            m1 = 1;
                                          }else{
                                            m1++;
                                          }//else閉じ
                                        }//while閉じ
                                      }//if閉じ 
                                      %>



                                      <% //週ごとの場合
                                        if(xaxis.equals("week")){
                                            str = "";
                                            m1 = 0;
                                            m2 = 0;
                                            d = 0;
                                            cal2.setTime(today);
                                            cal2.add(Calendar.DATE,7);
                                            cal2.add(Calendar.DATE,-70-cal2.get(Calendar.DAY_OF_WEEK)+1);

                                            for(i = 1; i<= 10; i++){
                                                str="";
                                                m1 = cal2.get(Calendar.MONTH)+1;
                                                d = cal2.get(Calendar.DATE);
                                                if(m1 != m2){
                                                    str = str + m1 + "月 ";
                                                }
                                                str = str + d + "日~";
                                                m2 = m1;
                                      %>
                                      '<%= str %>'
                                      <% 
                                          if(i!=10){
                                      %>
                                      ,
                                      <%
                                          }//if閉じ
                                          cal2.add(Calendar.DATE,7);
                                        }//while閉じ
                                      }//if閉じ 
                                      %>


                                      <% //日ごとの場合
                                        if(xaxis.equals("day")){
                                            cal2.setTime(today);
                                            cal2.add(Calendar.DATE,1);
                                            m1 = 0;
                                            m2 = 0;
                                            d = 0;
                                            w = 0;
                                            w_str = "";
                                            cal2.add(Calendar.DATE,-7);

                                            for(i = 1 ; i <= 7 ; i++){
                                                str="";
                                                m1 = cal2.get(Calendar.MONTH)+1;
                                                d = cal2.get(Calendar.DATE);
                                                w = cal2.get(Calendar.DAY_OF_WEEK);
                                                switch(w){
                                                    case 1:
                                                    w_str = "日";
                                                    break;
                                                    case 2:
                                                    w_str = "月";
                                                    break;
                                                    case 3:
                                                    w_str = "火";
                                                    break;
                                                    case 4:
                                                    w_str = "水";
                                                    break;
                                                    case 5:
                                                    w_str = "木";
                                                    break;
                                                    case 6:
                                                    w_str = "金";
                                                    break;
                                                    case 7:
                                                    w_str = "土";
                                                    break;
                                                }
                                                if(m1 != m2){
                                                    str = str + m1 + "月 ";
                                                }
                                                str = str + d + "(" + w_str + ")";
                                      %>
                                      '<%= str %>'
                                      <% 
                                          if(i!=7){
                                      %>
                                      ,
                                      <%
                                          }//if閉じ
                                          m2 = m1;
                                          cal2.add(Calendar.DATE,1);
                                        }//for閉じ
                                      }//if閉じ 
                                      %>




                                      ],
                                      datasets: [
                                        {
                                          label: 
                                          <% 
                                          str = "";
                                            if(xaxis.equals("year")){ //年ごとの場合
                                                str = "年";
                                            }
                                            if(xaxis.equals("month")){ //月ごとの場合
                                                str = "月";
                                            }
                                            if(xaxis.equals("week")){ //週ごとの場合
                                                str = "週";
                                            }
                                            if(xaxis.equals("day")){ //日ごとの場合
                                                str = "日";
                                            }
                                           %>
                                          '<%= str %>別売上',

                                          data:[
                                          <%// データをセット
                                            int start_point = 0;
                                            int x_size = 0;
                                            int list_cnt = 0;
                                            if(xaxis.equals("year")){
                                                start_point = 10 - datas.size();
                                                x_size = 10;
                                            }//if
                                            if(xaxis.equals("week")){
                                                start_point = 10 - datas.size();
                                                x_size = 10;
                                            }//if
                                            if(xaxis.equals("month")){
                                                start_point = 12 - datas.size();
                                                x_size = 12;
                                            }//if
                                            if(xaxis.equals("day")){
                                                start_point = 7 - datas.size();
                                                x_size = 7;
                                            }//if
                                            for(i = start_point ; i > 0 ; i--){
                                            %>
                                            ,
                                            <%
                                            }//for
                                            for(i = start_point ; i < x_size ; i++){
                                                if(!datas.equals("0")){
                                            %>
                                            <%= datas.get(list_cnt) %>
                                            <% 
                                                }
                                                list_cnt++;
                                                if(list_cnt != datas.size()){
                                            %>
                                            ,
                                            <%
                                                }//if
                                                }//for
                                            %>
                                          ],//data
                                          borderColor: "rgba(0, 16, 138,1)",
                                          backgroundColor: "rgba(143, 156, 255,0.2)"
                                        },
                                      ],
                                    },
                                    options: {
                                      title: {
                                        display: true,
                                        text: ''
                                      },
                                      scales: {
                                        yAxes: [{
                                          ticks: {
                                            suggestedMax: <%= max_double %>,
                                            suggestedMin: <%= min_double %>,
                                            stepSize: <%= stepsize %>,
                                            callback: function(value, index, values){
                                              return  value / <%= unit_int %> + 
                                              <% if(yaxis.equals("sales")){ %>
                                                '<%= unit_str %>円'
                                              <% }else{ %>
                                                '<%= unit_str %>個'
                                              <% } %>
                                            }
                                          }
                                        }]
                                      },
                                    }
                                  });
                                </script>

                            </div>
                            <div class="row">
                                <div class="offset-11 col-1">
                                    <select name="xaxis">
                                        <option value="year"
                                        <% if(xaxis.equals("year")){ %>
                                        selected
                                        <% } %>
                                        >年
                                        <option value="month"
                                        <% if(xaxis.equals("month")){ %>
                                        selected
                                        <% } %>
                                        >月
                                        <option value="week"
                                        <% if(xaxis.equals("week")){ %>
                                        selected
                                        <% } %>
                                        >週
                                        <option value="day"
                                        <% if(xaxis.equals("day")){ %>
                                        selected
                                        <% } %>
                                        >日
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <a class="btn btn-primary"  href="FrontController?class_name=analyse.TopAction" role="button">全体売上</a>
                            </div>
                        </div>

                        <div class="col-4">

                            <div class="row my-3">
                                <div class="h5 col-12 ml-4 text-center">
                                    年齢層
                                </div>
                            </div>
                            <div class="row">
                                <%
                                            String age = "";
                                            if((String)request.getAttribute("age")!=null)
                                            {
                                              age = (String)request.getAttribute("age");
                                            }
                                %>
                                <div class="offset-5 col-4 my-3">
                                  <select name="age" size="1">
                                      <option value="子ども" 
                                      <% if(age.equals("子ども")){ %>
                                      selected
                                      <% } %>
                                      >子ども
                                      <option value="10代" 
                                      <% if(age.equals("10代")){ %>
                                      selected
                                      <% } %>
                                      >10代
                                      <option value="20代" 
                                      <% if(age.equals("20代")){ %>
                                      selected
                                      <% } %>
                                      >20代
                                      <option value="30代" 
                                      <% if(age.equals("30代")){ %>
                                      selected
                                      <% } %>
                                      >30代
                                      <option value="40代" 
                                      <% if(age.equals("40代")){ %>
                                      selected
                                      <% } %>
                                      >40代
                                      <option value="50代" 
                                      <% if(age.equals("50代")){ %>
                                      selected
                                      <% } %>
                                      >50代
                                      <option value="シニア" 
                                      <% if(age.equals("シニア")){ %>
                                      selected
                                      <% } %>
                                      >シニア
                                  </select>
                                </div>
                            </div>

                            <div class="custom-control custom-checkbox">
                                <div class="row">
                                    <div class="offset-5 col mb-3">
                                        <%
                                            Boolean age_check = (Boolean)request.getAttribute("age_check");
                                            if(age_check == null){
                                                age_check = true;
                                            }
                                        %>
                                        <input type="checkbox" class="custom-control-input" id="age_c" name="age_check" value="true"
                                        <% if(age_check){ %>
                                        checked
                                        <% } %>
                                        >
                                        <label class="custom-control-label" for="age_c">年齢層を指定しない</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="h5 col-12 ml-4 mt-3 text-center">
                                    性別
                                </div>
                            </div>
                            <div class="row">
                                <div class="offset-4 col my-3 input-group">
                                    <div class="">
                                        <%  //性別を取得
                                            String sex = (String)request.getAttribute("sex");
                                            if(sex == null){
                                                sex = "both";
                                            }
                                        %>
                                        <input type="radio" class="form-check-input" name="sex" value="male"
                                        <% if(sex.equals("male")){ %>
                                        checked
                                        <% } %>
                                        >
                                        <label class="form-check-label" for="male">男</label>
                                    </div>

                                    <div class="form-check ml-3">
                                        <input type="radio" class="form-check-input" name="sex" value="female"
                                        <% if(sex.equals("female")){ %>
                                        checked
                                        <% } %>
                                        >
                                        <label class="form-check-label" for="female">女</label>
                                    </div>

                                    <div class="form-check ml-3">
                                        <input type="radio" class="form-check-input" name="sex" value="both"
                                        <% if(sex.equals("both")){ %>
                                        checked
                                        <% } %>
                                        >
                                        <label class="form-check-label" for="both">全体</label>
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="h5 col-12 ml-4 mt-3 text-center">
                                    時間帯
                                </div>
                            </div>
                            <div class="ml-4 row">
                                <%
                                    String time_lead = (String)request.getAttribute("time_lead");
                                    String time_last = (String)request.getAttribute("time_last");
                                %>
                                <div class=" col-5 my-3">
                                        <input type="time" name="time_lead" class="form-control" value="<%= time_lead%>">
                                </div>
                                <div class="col-1 my-3 mr-3">
                                        ～
                                </div>
                                <div class="col-5 my-3">
                                        <input type="time" name="time_last" class="form-control"  value="<%= time_last%>">
                                </div>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <div class="row">
                                    <div class="offset-5 col mb-3 mt-1">
                                        <%
                                            Boolean timezone_check = (Boolean)request.getAttribute("timezone_check");
                                            if(timezone_check == null){
                                                timezone_check = true;
                                            }
                                        %>
                                        <input type="checkbox" class="custom-control-input" id="timezone" name="timezone_check" value="true"
                                        <% if(timezone_check){ %>
                                        checked
                                        <% } %>
                                        >
                                        <label class="custom-control-label" for="timezone">時間帯を指定しない</label>
                                    </div>
                                </div>
                            </div>


                            <% if(!xaxis.equals("day")){ %>
                            <div class="row my-3">
                                <div class="h5 col-12 ml-4 mt-3 text-center">
                                    曜日
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="offset-5 col">
                                    <%
                                        String dotw = (String)request.getAttribute("dotw");
                                        if(dotw == null){
                                            dotw = "sun";
                                        }
                                    %>
                                    <select name="dotw" size="1">

                                        <option value="sun" 
                                        <% if(dotw.equals("sun")){ %>
                                        selected
                                        <% } %>
                                        >日曜日

                                        <option value="mon" 
                                        <% if(dotw.equals("mon")){ %>
                                        selected
                                        <% } %>
                                        >月曜日

                                        <option value="tue" 
                                        <% if(dotw.equals("tue")){ %>
                                        selected
                                        <% } %>
                                        >火曜日

                                        <option value="wed" 
                                        <% if(dotw.equals("wed")){ %>
                                        selected
                                        <% } %>
                                        >水曜日

                                        <option value="thu" 
                                        <% if(dotw.equals("thu")){ %>
                                        selected
                                        <% } %>
                                        >木曜日

                                        <option value="fri" 
                                        <% if(dotw.equals("fri")){ %>
                                        selected
                                        <% } %>
                                        >金曜日

                                        <option value="sat" 
                                        <% if(dotw.equals("sat")){ %>
                                        selected
                                        <% } %>
                                        >土曜日
                                    </select>
                                </div>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <div class="row">
                                    <div class="offset-5 col mb-3 mt-1">
                                        <%
                                            Boolean dotw_check = (Boolean)request.getAttribute("dotw_check");
                                            if(dotw_check == null){
                                                dotw_check = true;
                                            }
                                        %>
                                        <input type="checkbox" class="custom-control-input" id="dotw" name="dotw_check" value="true"
                                        <% if(dotw_check){ %>
                                        checked
                                        <% } %>
                                        >
                                        <label class="custom-control-label" for="dotw">曜日を指定しない</label>
                                    </div>
                                </div>
                            </div>
                            <% } %>


                            <div class="offset-0">
                                <div class="my-3">

                                                                    <!-- Custom css that makes this example work like it does: -->
                                    <style type="text/css" scoped>
                                    .scrollspy-example {
                                        position: relative;
                                        height: 200px;
                                        margin-top: .5rem;
                                        overflow: auto;
                                    }
                                    </style>

                                    <!-- Actual scrollspy markup: -->
                                    <nav id="navbar-example2" class="navbar navbar-light bg-light">
                                      <h3 class="navbar-brand">メニュー</h3>
                                      <ul class="nav nav-pills">
                                        <li class="nav-item"><a class="nav-link" href="#reco">オススメ</a></li>
                                        <li class="nav-item"><a class="nav-link" href="#food">フード</a></li>
                                        <li class="nav-item"><a class="nav-link" href="#drink">ドリンク</a></li>
                                        <li class="nav-item"><a class="nav-link" href="#side">サイドメニュー</a></li>
                                        <li class="nav-item"><a class="nav-link" href="#dessert">デザート</a></li>
                                      </ul>
                                    </nav>
                                    <% boolean flg = false; %>
                                    <div data-spy="scroll" data-target="#navbar-example2" data-offset="0" class="scrollspy-example">
                                      <h4 id="reco">オススメ</h4>
                                      <% for(i=0 ; i < menulist_reco.size() ; i++){ %>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name = "menu_check" id="menu_reco<%= i %>" value = "<%= menulist_reco.get(i) %>"
                                            <% 
                                            if(checked_menu != null){
                                            flg=false;
                                              for(int j = 0 ; j < checked_menu.length ; j++){
                                                if(checked_menu[j].equals(menulist_reco.get(i))){
                                                  flg = true;
                                                }
                                              }
                                            }
                                            if(flg){ %>
                                            checked
                                            <% } %>
                                            >
                                            <label class="form-check-label" for="menu_reco<%= i %>"><%= menulist_reco.get(i) %></label>
                                        </div>
                                      <% } %>
                                      <h4 id="food">フード</h4>
                                      <% for(i=0 ; i < menulist_food.size() ; i++){ %>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name = "menu_check" id="menu_food<%= i %>" value = "<%= menulist_food.get(i) %>"
                                            <% 
                                            if(checked_menu != null){
                                            flg=false;
                                              for(int j = 0 ; j < checked_menu.length ; j++){
                                                if(checked_menu[j].equals(menulist_food.get(i))){
                                                  flg = true;
                                                }
                                              }
                                            }
                                            if(flg){ %>
                                            checked
                                            <% } %>
                                            >
                                            <label class="form-check-label" for="menu_food<%= i %>"><%= menulist_food.get(i) %></label>
                                        </div>
                                      <% } %>

                                      <h4 id="drink">ドリンク</h4>
                                      <% for(i=0 ; i < menulist_drink.size() ; i++){ %>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name = "menu_check" id="menu_drink<%= i %>" value = "<%= menulist_drink.get(i) %>"
                                            <% 
                                            if(checked_menu != null){
                                            flg=false;
                                              for(int j = 0 ; j < checked_menu.length ; j++){
                                                if(checked_menu[j].equals(menulist_drink.get(i))){
                                                  flg = true;
                                                }
                                              }
                                            }
                                            if(flg){ %>
                                            checked
                                            <% } %>
                                            >
                                            <label class="form-check-label" for="menu_drink<%= i %>"><%= menulist_drink.get(i) %></label>
                                        </div>
                                      <% } %>

                                      <h4 id="side">サイドメニュー</h4>
                                      <% for(i=0 ; i < menulist_side.size() ; i++){ %>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name = "menu_check" id="menu_side<%= i %>" value = "<%= menulist_side.get(i) %>"
                                            <% 
                                            if(checked_menu != null){
                                            flg=false;
                                              for(int j = 0 ; j < checked_menu.length ; j++){
                                                if(checked_menu[j].equals(menulist_side.get(i))){
                                                  flg = true;
                                                }
                                              }
                                            }
                                            if(flg){ %>
                                            checked
                                            <% } %>
                                            >
                                            <label class="form-check-label" for="menu_side<%= i %>"><%= menulist_side.get(i) %></label>
                                        </div>
                                      <% } %>

                                      <h4 id="dessert">デザート</h4>
                                      <% for(i=0 ; i < menulist_reco.size() ; i++){ %>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name = "menu_check" id="menu_dessert<%= i %>" value = "<%= menulist_dessert.get(i) %>"
                                            <% 
                                            if(checked_menu != null){
                                            flg=false;
                                              for(int j = 0 ; j < checked_menu.length ; j++){
                                                if(checked_menu[j].equals(menulist_dessert.get(i))){
                                                  flg = true;
                                                }
                                              }
                                            }
                                            if(flg){ %>
                                            checked
                                            <% } %>
                                            >
                                            <label class="form-check-label" for="menu_dessert<%= i %>"><%= menulist_dessert.get(i) %></label>
                                        </div>
                                      <% } %>
                                    </div>
                                </div>

                            </div>


                            <div class="row">
                                <div class="offset-5">
                                    <div class="my-3">
                                        <input type="submit" class="btn btn-primary" value="適用" role="button">
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="FrontController?class_name=situation.TopAction" role="button">トップページへ</a>
                </div>

            </div>
        </div>
    </form>
    </body>
</html>