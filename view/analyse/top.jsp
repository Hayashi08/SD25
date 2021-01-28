<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>全体売上</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-5 my-3 col-4 main_title">
                    全体売上
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <div class="row">

                        <div class="offset-0 col-8">
                            <div class="row my-3">
                                <select name="yaxis">
                                    <option value="sales" selected>売上
                                    <option value="visitors">来客数
                                </select>
                            </div>
                            <div class="row my-3" style="">
                                <canvas id="myLineChart"></canvas>
                 				<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
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
                                <a class="btn btn-primary"  href="FrontController?class_name=analyse.MenuAction" role="button">メニュー別売上</a>
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

                            <div class="row">
                                <div class="offset-5">
                                    <div class="my-3">
                                        <a class="btn btn-primary"  href="FrontController?class_name=analyse.TopAction" role="button">適用</a>
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
