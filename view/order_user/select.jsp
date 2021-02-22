<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="bean.OrderUserBean" %>
<%

    OrderUserBean order_userBean = (OrderUserBean)request.getAttribute("order_userBean");
    String allergyStr = order_userBean.getAllergy();
    String[] allergyList = allergyStr.split(",", 0);
    String genre = request.getParameter("genre");
    String menu_id = request.getParameter("menu_id");
    String menu_name = request.getParameter("menu_name");
    String menu_qty = request.getParameter("menu_qty");

%>
<html lang="ja">
    <head>
        <title><%= order_userBean.getName() %></title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3 row">
                <div class="main p-1 col-10">

                    <!-- ナビゲーション -->
                    <div class="row m-2">
                        <a class="mx-2" href="FrontController?class_name=order_user.FloorSignupAction" id="top">
                            <div class="btn btn-light">
                                トップ
                            </div>
                        </a>
                        <% if (genre.equals("オススメ")) { %>
                            
                            <a class="mx-2" href="FrontController?class_name=order_user.GenreAction&genre=オススメ" id="rec">
                                <div class="btn btn-dark">
                                    オススメ
                                </div>
                            </a>

                        <% } else { %>

                            <a class="mx-2" href="FrontController?class_name=order_user.GenreAction&genre=オススメ" id="rec">
                                <div class="btn btn-light">
                                    オススメ
                                </div>
                            </a>

                        <% } %>

                        <% if (genre.equals("フード")) { %>

                            <a class="mx-2" href="FrontController?class_name=order_user.GenreAction&genre=フード" id="food">
                                <div class="btn btn-dark">
                                    フード
                                </div>
                            </a>

                        <% } else { %>

                            <a class="mx-2" href="FrontController?class_name=order_user.GenreAction&genre=フード" id="food">
                                <div class="btn btn-light">
                                    フード
                                </div>
                            </a>

                        <% } %>

                        <% if (genre.equals("ドリンク")) { %>

                            <a class="mx-2" href="FrontController?class_name=order_user.GenreAction&genre=ドリンク" id="drink">
                                <div class="btn btn-dark">
                                    ドリンク
                                </div>
                            </a>

                        <% } else { %>

                            <a class="mx-2" href="FrontController?class_name=order_user.GenreAction&genre=ドリンク" id="drink">
                                <div class="btn btn-light">
                                    ドリンク
                                </div>
                            </a>

                        <% } %>
                        <% if (genre.equals("サイドメニュー")) { %>

                            <a class="mx-2" href="FrontController?class_name=order_user.GenreAction&genre=サイドメニュー" id="side">
                                <div class="btn btn-dark">
                                    サイドメニュー
                                </div>
                            </a>

                        <% } else { %>

                            <a class="mx-2" href="FrontController?class_name=order_user.GenreAction&genre=サイドメニュー" id="side">
                                <div class="btn btn-light">
                                    サイドメニュー
                                </div>
                            </a>

                        <% } %>

                        <% if (genre.equals("デザート")) { %>

                            <a class="mx-2" href="FrontController?class_name=order_user.GenreAction&genre=デザート" id="dess">
                                <div class="btn btn-dark">
                                    デザート
                                </div>
                            </a>

                        <% } else { %>

                            <a class="mx-2" href="FrontController?class_name=order_user.GenreAction&genre=デザート" id="dess">
                                <div class="btn btn-light">
                                    デザート
                                </div>
                            </a>

                        <% } %>

                    </div>

                    <!-- メイン -->
                    <div class="row m-3">
                        <div class="h2 offset-2 col-6 text-center">
                            <%= order_userBean.getName() %>
                        </div>
                    </div>
                    <div class="row m-2">
                        <img class="offset-1 col-6" src="../static/images/<%= order_userBean.getId() %>.jpg">
                        <div class="col-5">
                            <div class="h5 m-3">
                                アレルギー
                            </div>
                            <div class="h4 text-center">
                                <% for (int i=0; i<allergyList.length; i++) { %>
                                    <% if (!(allergyList[i].equals(""))) { %>
                                        <div class="badge badge-warning">
                                            <%= allergyList[i] %>
                                        </div>
                                    <% } %>
                                <% } %>
                            </div>
                            <div class="h5 mx-3 mb-3 mt-5">
                                料金
                            </div>
                            <div class="h2 text-center">
                                <%= order_userBean.getPrice() %>円
                            </div>
                            <div class="h5 mx-3 mb-3 mt-5">
                                数量を選択して下さい
                            </div>
                            <div class="text-center h3">
                                <div class="row mt-4 text-center">
                                    <div class="offset-3 col-2 btn btn-secondary" id="minus">
                                        -
                                    </div>
                                    <div class="col-2 mt-2" id="qty">
                                        0
                                    </div>
                                    <div class="col-2 btn btn-secondary" id="plus">
                                        +
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-4 mb-2">
                        <div class="offset-1 col-5 h5">
                            商品説明
                        </div>
                    </div>
                    <div class="row m-3">
                        <div class="h4 offset-2">
                            <%= order_userBean.getDes() %>
                        </div>
                    </div>
                </div>

                <!-- 注文リスト -->
                <div class="col-2 px-3 text-center container">
                    <div class="field sub_title py-3 col">
                        注文リスト
                    </div>
                    <div class="py-3" id="menu"></div>
                    <div class="py-3" id="empty"></div>
                    <div class="btn-lg py-3 col mx-1" id="signup" data-toggle="modal">
                        注文する
                    </div>
                </div>

            </div>
        </div>

        <!-- 注文確認モーダル -->
        <%@ include file="../ModalOpenTab.jsp" %>
              <form action="FrontController" method="POST">
                <input type="text" name="class_name" value="order_user.SignupAction" hidden>
                <input type="text" id="modal_id" name="id" hidden>
                <input type="text" id="modal_qty" name="qty" hidden>
                <table class="offset-1 col-10 table table-striped" id="modal_signup">
                </table>
                <div class="row">
                    <div class="col-2 offset-3">
                        <input type="submit" class="btn btn-primary" value="注文" role="button">
                    </div>
                    <div class="col-3 offset-1">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
                    </div>
                </div>
              </form>
        <%@ include file="../ModalCloseTab.jsp" %>

        <!-- 注文完了モーダル -->
        <%@ include file="../ModalDisplay1OpenTab.jsp" %>
            <div class="row h3 text-center my-4">
                注文しました。
            </div>
            <div class="row h4 text-center my-4">
                到着までお待ちください。
            </div>
        <%@ include file="../ModalCloseTab.jsp" %>

        <!-- アラート -->
        <%@ include file="../ModalDisplayOpenTab.jsp" %>
            <div class="text-danger h3 text-center my-4">
                1品目につき最大10件までです。
            </div>
        <%@ include file="../ModalCloseTab.jsp" %>
        <%@ include file="../enhance.jsp" %>
    </body>
    <script>

        // メニューIDを入れる配列
        var id = [];
        // メニュー名を入れる配列
        var name1 = [];
        // 数量を入れる配列
        var qty = [];

        // メニューIDを入れる変数
        var idCsv = "";
        // メニュー名を入れる変数
        var nameCsv = "";
        // 数量を入れる変数
        var qtyCsv = "";

        // 注文リストカウント
        var count = 0;

        //注文リスト
        if ("<%= menu_id %>" != "null") {

            id = "<%= menu_id %>".split(',');
            name1 = "<%= menu_name %>".split(',');
            qty = "<%= menu_qty %>".split(',');
            
            for (var i = 0; i < id.length; i++) {

                document.getElementById("menu").innerHTML += '<div class="row my-2"><div class="col-8 text-center">' + name1[i] + '</div><div class="col-4 text-center">' + qty[i] + '</div></div>';
                count = i;

            }

            //レイアウト修正
            for (var i = 12; count < i; i--) {

                document.getElementById("menu").innerHTML += '<div class="py-3"></div>';

            }

            //注文ボタンの操作
            $("#signup").prop("disabled", true);
            $("#signup").addClass('btn-success animated pulse infinite');
            $("#signup").removeClass('btn-secondary');

            // 数量表示
            if (qty[$.inArray('<%= order_userBean.getId() %>', id)] >= 1) {

                document.getElementById("qty").innerHTML = qty[$.inArray('<%= order_userBean.getId() %>', id)];

            }

        } else {

            //レイアウト修正
            for (var i = 13; count < i; i--) {

                document.getElementById("menu").innerHTML += '<div class="py-3"></div>';

            }

            //注文ボタンの操作
            $("#signup").prop("disabled", false);
            $("#signup").addClass('btn-secondary');
            $("#signup").removeClass('btn-success');

        }

        //aタグ
        $("a").click(function(){

            //配列をCSV形式に変換
            if (id.length == 0) {
                
            }else if (id.length == 1) {

                for (var i = 0; i < id.length; i++) {

                    idCsv = id[i];
                    nameCsv = name1[i];
                    qtyCsv = qty[i];

                }

            }else{

                for (var i = 0; i < id.length-1; i++) {

                    idCsv += id[i] + ',';
                    nameCsv += name1[i] + ',';
                    qtyCsv += qty[i] + ',';

                }

                idCsv += id[id.length-1];
                nameCsv += name1[id.length-1];
                qtyCsv += qty[id.length-1];

            }
        });

        //トップ
        $('#top').click(function() {

            if (id.length != 0) {

                $('#top').attr(
                    'href',
                    $('#top').attr('href') + '&menu_id=' + idCsv + 
                    '&menu_name=' + nameCsv + 
                    '&menu_qty=' + qtyCsv
                    );

            }

        });

        //オススメ
        $('#rec').click(function() {

            if (id.length != 0) {

                $('#rec').attr(
                    'href',
                    $('#rec').attr('href') + '&menu_id=' + idCsv + 
                    '&menu_name=' + nameCsv + 
                    '&menu_qty=' + qtyCsv
                    );

            }

        });

        //フード
        $('#food').click(function() {

            if (id.length != 0) {

                $('#food').attr(
                    'href',
                    $('#food').attr('href') + '&menu_id=' + idCsv + 
                    '&menu_name=' + nameCsv + 
                    '&menu_qty=' + qtyCsv
                    );

            }

        });

        //ドリンク
        $('#drink').click(function() {

            if (id.length != 0) {

                $('#drink').attr(
                    'href',
                    $('#drink').attr('href') + '&menu_id=' + idCsv + 
                    '&menu_name=' + nameCsv + 
                    '&menu_qty=' + qtyCsv
                    );

            }

        });

        //サイドメニュー
        $('#side').click(function() {

            if (id.length != 0) {

                $('#side').attr(
                    'href',
                    $('#side').attr('href') + '&menu_id=' + idCsv + 
                    '&menu_name=' + nameCsv + 
                    '&menu_qty=' + qtyCsv
                    );

            }

        });

        //デザート
        $('#dess').click(function() {

            if (id.length != 0) {

                $('#dess').attr(
                    'href',
                    $('#dess').attr('href') + '&menu_id=' + idCsv + 
                    '&menu_name=' + nameCsv + 
                    '&menu_qty=' + qtyCsv
                    );

            }

        });

        //数量+ボタン
      $('#plus').click(function() {

        // 配列idに、対象のメニューidが存在しない場合
        if ($.inArray('<%= order_userBean.getId() %>', id) == -1) {

            //配列の最終列に登録
            id.push('<%= order_userBean.getId() %>');
            name1.push('<%= order_userBean.getName() %>');
            qty.push(1);
            document.getElementById("qty").innerHTML = 1;

        // 配列idに、対象のメニューidが存在する場合
        } else if (qty[$.inArray('<%= order_userBean.getId() %>', id)] <= 9) {

            //対象のメニューidをもつ配列qtyの値を変更
            qty[$.inArray('<%= order_userBean.getId() %>', id)] = Number(qty[$.inArray('<%= order_userBean.getId() %>', id)]) + 1;
            document.getElementById("qty").innerHTML = qty[$.inArray('<%= order_userBean.getId() %>', id)];

        // 数量が10件を超えた場合
        } else {

            $('#modal_display').modal('show');

        }

        document.getElementById("menu").innerHTML = '';

        // 注文リスト書き換え
        for (var i = 0; i < id.length; i++) {

            document.getElementById("menu").innerHTML += '<div class="row my-2"><div class="col-8 text-center">' + name1[i] + '</div><div class="col-4 text-center">' + qty[i] + '</div></div>';
            count = i;

        }

        //レイアウト修正
        for (var i = 12; count < i; i--) {

            document.getElementById("menu").innerHTML += '<div class="py-3"></div>';

        }

        //注文ボタンの操作
        $("#signup").prop("disabled", true);
        $("#signup").addClass('btn-success animated pulse infinite');
        $("#signup").removeClass('btn-secondary');

      });

        //数量-ボタン
      $('#minus').click(function() {

        // 配列idに、対象のメニューidが存在しない場合
        if ($.inArray('<%= order_userBean.getId() %>', id) == -1) {

        // 配列idに、対象のメニューidが存在する場合
        } else if (qty[$.inArray('<%= order_userBean.getId() %>', id)] > 1) {

            //対象のメニューidをもつ配列qtyの値を変更
            qty[$.inArray('<%= order_userBean.getId() %>', id)] = Number(qty[$.inArray('<%= order_userBean.getId() %>', id)]) - 1;
            document.getElementById("qty").innerHTML = qty[$.inArray('<%= order_userBean.getId() %>', id)];

        //　数量が0件になった場合
        } else if (qty[$.inArray('<%= order_userBean.getId() %>', id)] == 1){

            // 各配列の対象のメニューを削除
            id.splice($.inArray('<%= order_userBean.getId() %>', id), 1);
            name1.splice($.inArray('<%= order_userBean.getId() %>', id), 1);
            qty.splice($.inArray('<%= order_userBean.getId() %>', id), 1);
            document.getElementById("qty").innerHTML = 0;

        }

        document.getElementById("menu").innerHTML = '';

        if (id.length != 0) {

            //注文リスト書き換え
            for (var i = 0; i < id.length; i++) {

                document.getElementById("menu").innerHTML += '<div class="row my-2"><div class="col-8 text-center">' + name1[i] + '</div><div class="col-4 text-center">' + qty[i] + '</div></div>';
                count = i;

            }

            //レイアウト修正
            for (var i = 12; count < i; i--) {

                document.getElementById("menu").innerHTML += '<div class="py-3"></div>';

            }

        } else {

            //レイアウト修正
            for (var i = 13; count < i; i--) {

                document.getElementById("menu").innerHTML += '<div class="py-3"></div>';

            }

            //注文ボタンの操作
            $("#signup").prop("disabled", false);
            $("#signup").addClass('btn-secondary');
            $("#signup").removeClass('btn-success animated pulse infinite');

        }

      });

      //　注文登録モーダル
      $('#signup').click(function() {

            if ("<%= menu_id %>" != "null" || id.length != 0) {

                $("#modal1").modal('show');

                //配列をCSV形式に変換
                if (id.length == 0) {
                    
                }else if (id.length == 1) {

                    for (var i = 0; i < id.length; i++) {

                        idCsv = id[i];
                        qtyCsv = qty[i];

                    }

                }else{

                    for (var i = 0; i < id.length-1; i++) {

                        idCsv += id[i] + ',';
                        qtyCsv += qty[i] + ',';

                    }

                    idCsv += id[id.length-1];
                    qtyCsv += qty[id.length-1];

                }

                $('#modal_id').val(idCsv);
                $('#modal_qty').val(qtyCsv);

                document.getElementById("modal_signup").innerHTML = '<tr><th class="field">メニュー名</th><th class="field">数量</th></tr>';

                for (var i = 0; i < name1.length; i++) {

                    document.getElementById("modal_signup").innerHTML += '<tr><td><input type="text" class="form-control" value="' + name1[i] + '" readonly></td><td><input type="text" class="form-control" name="qty" value="' + qty[i] + '" readonly></td></tr>';

                }

            }

      });

    </script>
</html>
