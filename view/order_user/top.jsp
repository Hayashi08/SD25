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
                        <div class="offset-1 sub_title pt-4">
                            メニューボタンをタッチして注文してください
                        </div>
                        <a href="#modal2" class="offset-3" data-toggle="modal" data-target="#modal2">
                            <i class="fas fa-user fa-3x"></i>
                        </a>
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
                <div class="col-2 p-1">
                    <div class="text-center mx-3">
                        <div class="field sub_title py-3">
                            注文リスト
                        </div>
                        <div class="sub py-3">
                            <div class="row py-2">
                                <div id="menu_name">
                                </div>
                                <div id="menu_qty">
                                </div>
                            </div>
                            <div class="row py-5">
                            </div>
                            <div class="row py-5">
                            </div>
                            <div class="row py-5">
                            </div>
                            <div class="btn-lg btn-success" id="signup" data-toggle="modal" data-target="#modal1">
                                注文する
                            </div>
                        </div>
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
        <%@ include file="../ModalDisplayOpenTab.jsp" %>
            <div class="row h3 text-center my-4">
                注文しました。
            </div>
            <div class="row h4 text-center my-4">
                到着までお待ちください。
            </div>
        <%@ include file="../ModalCloseTab.jsp" %>

        <!-- ログアウト処理 -->
        <div class="modal fade" id="modal2" tabindex="-1" role="dialog" aria-labelledby="modal2" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="modal2">ログイン</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="row my-5">
                    <div class="offset-2 col-3">
                        従業員ID
                    </div>
                    <div class="col-4">
                        <input type="text" placeholder="従業員ID">
                    </div>
                </div>
                <div class="row my-5">
                    <div class="offset-2 col-3">
                        パスワード
                    </div>
                    <div class="col-4">
                        <input type="password" placeholder="パスワード">
                    </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#modal_ans2">ログイン</button>
              </div>
            </div>
          </div>
        </div>
        <div class="modal fade" id="modal_ans2" tabindex="-1"
      role="dialog" aria-labelledby="level2" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="level2">部屋番号入力</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="row my-5">
                    <div class="offset-2 col-3">
                        部屋番号
                    </div>
                    <div class="col-4">
                        <input type="text" placeholder="101">
                    </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">確定</button>
              </div>
            </div>
          </div>
        </div>
        <%@ include file="../enhance.jsp" %>
    </body>
    <script>

        // メニューIDを入れる配列
        var id = [];
        // メニュー名を入れる配列
        var name1 = [];
        // 数量を入れる配列
        var qty = [];

        // メニューIDを入れる文字列
        var idCsv = "";
        // メニュー名を入れる文字列
        var nameCsv = "";
        // 数量を入れる文字列
        var qtyCsv = "";

        //注文リスト
        if ("<%= menu_id %>" != "null") {

            id = "<%= menu_id %>".split(',');
            name1 = "<%= menu_name %>".split(',');
            qty = "<%= menu_qty %>".split(',');

            for (var i = 0; i < id.length; i++) {

                document.getElementById("menu_name").innerHTML += '<div class="mr-3 ml-4">' + name1[i] + '</div>';
                document.getElementById("menu_qty").innerHTML += '<div>' + qty[i] + '</div>';

            }

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

            //配列をCSV形式に変換
            if (id.length == 0) {
                
            }else if (id.length == 1) {
                for (var i = 0; i < id.length; i++) {
                    idCsv = id[i];
                    qtyCsv = qty[i];
                }
            }else{

                for (var i = 0; i < id.length-1; i++) {
                    idCsv += id[i] + ",";
                    qtyCsv += qty[i] + ",";
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

      });

    </script>
</html>
