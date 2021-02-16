<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>メニュー別売上</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-5 my-3 col-4 main_title">
                    メニュー別売上
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <div class="row">

                        <div class="offset-0 col-8">
                            <div class="row my-3">
                                <select name="yaxis">
                                    <option value="sales" selected>売上
                                    <option value="orders">注文数
                                </select>
                            </div>
                            <div class="row my-3" style="">
                                <!-- <img src="../images/graph.jpg" width="100%" alt="グラフ"> -->

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
                                                System.out.println(datas.get(list_cnt));
                                            %>
                                            <%= datas.get(list_cnt) %>
                                            <% 
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
                                            stepSize: 10,
                                            callback: function(value, index, values){
                                              return  value +
                                                <%// y軸が売り上げの場合
                                                    if(yaxis.equals("sales")){
                                                %>
                                               '万円'
                                               <% } %>
                                                <%// y軸が来客数の場合
                                                    if(yaxis.equals("visitors")){
                                                %>
                                               '百人'
                                               <% } %>
                                            }
                                          }
                                        }]
                                      },
                                    }
                                  });


                                </script>



                        
                                <script>
                                  var ctx = document.getElementById("myLineChart");
                                  var myLineChart = new Chart(ctx, {
                                    type: 'line',
                                    data: {
                                      labels: ['4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月', '1月', '2月', '3月'],
                                      datasets: [
                                        {
                                          label: '月別売上',
                                          data: [35, 34, 37, 35, 34, 35, 34, 25, 34, 35, 34, 25, 35, 34, 25],
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
                                            suggestedMax: 40,
                                            suggestedMin: 0,
                                            stepSize: 10,
                                            callback: function(value, index, values){
                                              return  value +  '円'
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
                                        <option value="year">年
                                        <option value="month" selected>月
                                        <option value="week">週
                                        <option value="day">日
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <a class="btn btn-primary"  href="FrontController?class_name=analyse.TopAction" role="button">全体売上</a>
                            </div>
                        </div>

                        <div class="col-4">

                            
                            <div class="row">
                                <div class="offset-5">
                                    年齢層
                                </div>
                            </div>
                            <div class="row">
                                <div class="offset-3">
                                    <div class="my-3">
                                        <input type="text" name="age_lead">
                                        才～
                                    </div>
                                    <div class="my-3">
                                        <input type="text" name="age_last">
                                        才
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="offset-5">
                                    性別
                                </div>
                            </div>
                            <div class="row">
                                <div class="offset-3">
                                    <div class="my-3">
                                        <input type="text" name="sex"><!-- ラジオボタン -->
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="offset-5">
                                    職業
                                </div>
                            </div>
                            <div class="row">
                                <div class="offset-3">
                                    <div class="my-3">
                                        <input type="text" name="job"><!-- プルダウン -->
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="offset-5">
                                    時間帯
                                </div>
                            </div>
                            <div class="row">
                                <div class="offset-3">
                                    <div class="my-3">
                                        <input type="text" name="time_lead">
                                        時～
                                    </div>
                                    <div class="my-3">
                                        <input type="text" name="time_last">
                                        時
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="offset-5">
                                    曜日
                                </div>
                            </div>
                            <div class="row">
                                <div class="offset-3">
                                    <div class="my-3">
                                        <input type="text" name="dow"><!-- プルダウン -->
                                    </div>
                                </div>
                            </div>

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
                                        <li class="nav-item"><a class="nav-link" href="#verse1">おつまみ</a></li>
                                        <li class="nav-item"><a class="nav-link" href="#verse2">お料理</a></li>
                                        <li class="nav-item"><a class="nav-link" href="#verse3">お食事</a></li>
                                        <li class="nav-item"><a class="nav-link" href="#verse4">パーティー</a></li>
                                        <li class="nav-item"><a class="nav-link" href="#verse5">デザート</a></li>
                                        <li class="nav-item"><a class="nav-link" href="#verse6">スナック</a></li>
                                      </ul>
                                    </nav>
                                    <div data-spy="scroll" data-target="#navbar-example2" data-offset="0" class="scrollspy-example">
                                      <h4 id="verse1">おつまみ</h4>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu1">
                                          <label class="form-check-label" for="menu1">ポテト＆チキンナゲット</label>
                                      </div>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu2">
                                          <label class="form-check-label" for="menu2">スナックバスケット</label>
                                      </div>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu3">
                                          <label class="form-check-label" for="menu3">おにぽて</label>
                                      </div>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu4">
                                          <label class="form-check-label" for="menu4">おつまみガーリックトースト</label>
                                      </div>

                                      <h4 id="verse2">お料理</h4>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu1">
                                          <label class="form-check-label" for="menu1">鶏の唐揚げ</label>
                                      </div>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu2">
                                          <label class="form-check-label" for="menu2">旨辛チキンスティック</label>
                                      </div>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu3">
                                          <label class="form-check-label" for="menu3">エビと彩野菜のチリソース</label>
                                      </div>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu4">
                                          <label class="form-check-label" for="menu4">お好み焼き串</label>
                                      </div>

                                      <h4 id="verse3">お食事</h4>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu1">
                                          <label class="form-check-label" for="menu1">ジャンボ焼きそば</label>
                                      </div>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu2">
                                          <label class="form-check-label" for="menu2">マルゲリータピザ</label>
                                      </div>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu3">
                                          <label class="form-check-label" for="menu3">チャーハン</label>
                                      </div>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu4">
                                          <label class="form-check-label" for="menu4">温玉カルボナーラ</label>
                                      </div>

                                      <h4 id="verse4">パーティ</h4>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu1">
                                          <label class="form-check-label" for="menu1">オニオンリングタワー</label>
                                      </div>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu2">
                                          <label class="form-check-label" for="menu2">おつまみプレート(リッチ)</label>
                                      </div>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu3">
                                          <label class="form-check-label" for="menu3">おつまみプレート(スタンダード)</label>
                                      </div>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu4">
                                          <label class="form-check-label" for="menu4">かわきものパーティー</label>
                                      </div>


                                      <h4 id="verse5">デザート</h4>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu1">
                                          <label class="form-check-label" for="menu1">チョコレートパフェ</label>
                                      </div>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu2">
                                          <label class="form-check-label" for="menu2">ポッキー</label>
                                      </div>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu3">
                                          <label class="form-check-label" for="menu3">コーヒーゼリーとソフトアイス</label>
                                      </div>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu4">
                                          <label class="form-check-label" for="menu4">アイスカタラーナ</label>
                                      </div>


                                      <h4 id="verse6">スナック</h4>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu1">
                                          <label class="form-check-label" for="menu1">メキシカンナチョス</label>
                                      </div>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu2">
                                          <label class="form-check-label" for="menu2">ミックスナッツ</label>
                                      </div>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu3">
                                          <label class="form-check-label" for="menu3">ポテトチップス</label>
                                      </div>
                                      <div class="form-check">
                                          <input class="form-check-input" type="checkbox" id="menu4">
                                          <label class="form-check-label" for="menu4">えびせん</label>
                                      </div>

                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="offset-5">
                                    <div class="my-3">
                                        <a class="btn btn-primary"  href="FrontController?class_name=analyse.MenuAction" role="button">適用</a>
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
    </body>
</html>