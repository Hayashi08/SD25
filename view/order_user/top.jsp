<%@ page contentType="text/html;charset=UTF-8" %>
<%

    String menu_id = request.getParameter("menu_id");
    String menu_name = request.getParameter("menu_name");
    String menu_qty = request.getParameter("menu_qty");

%>
<html lang="ja">
    <head>
        <title>トップページ画面</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
                <div class="main m-1">
                    <div class="row">
                        <div class="offset-1 title col-2">
                            まさる堂
                        </div>
                        <div class="offset-1 sub_title pt-4 animated bounce infinite">
                            メニューボタンをタッチして注文してください
                        </div>
                    </div>
                </div>
            <div class="p-3 row">
                <div class="main p-1 col-10">
                    <div class="row m-2">
                        <div class="sub_title col-4 text-center">
                            オススメ
                        </div>
                        <div class="sub_title col-4 text-center">
                            フード
                        </div>
                        <div class="sub_title col-4 text-center">
                            ドリンク
                        </div>
                    </div>
                    <div class="row m-2">
                        <a class="col-4" href="FrontController?class_name=order_user.GenreAction&genre=オススメ" id="rec"><img class="col-12" src="../static/images/recommend_thumbnail.jpg"></a>
                        <a class="col-4" href="FrontController?class_name=order_user.GenreAction&genre=フード" id="food"><img class="col-12" src="../static/images/food_thumbnail.jpg"></a>
                        <a class="col-4" href="FrontController?class_name=order_user.GenreAction&genre=ドリンク" id="drink"><img class="col-12" src="../static/images/drink_thumbnail.jpg"></a>
                    </div>
                    <div class="row m-2">
                        <div class="sub_title col-4 text-center">
                            サイドメニュー
                        </div>
                        <div class="sub_title col-4 text-center">
                            デザート
                        </div>
                    </div>
                    <div class="row m-2">
                        <a class="col-4" href="FrontController?class_name=order_user.GenreAction&genre=サイドメニュー" id="side"><img class="col-12" src="../static/images/side_thumbnail.jpg"></a>
                        <a class="col-4" href="FrontController?class_name=order_user.GenreAction&genre=デザート" id="dess"><img class="col-12" src="../static/images/desert_thumbnail.jpg"></a>
                        <div class="col-4 mt-4 py-5 text-center">
                            <a href="FrontController?class_name=order_user.ArchiveAction" class="bg-info rounded p-4 text-white h1">
                                注文履歴
                            </a>
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
                    idCsv += id[i] + ",";
                    nameCsv += name1[i] + ",";
                    qtyCsv += qty[i] + ",";
                }
                idCsv += id[id.length-1];
                nameCsv += name1[id.length-1];
                qtyCsv += qty[id.length-1];

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
