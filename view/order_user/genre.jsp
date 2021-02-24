<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.OrderUserBean" %>
<%

    ArrayList<OrderUserBean> order_userBeans = (ArrayList<OrderUserBean>)request.getAttribute("order_userBeans");
    String genre = request.getParameter("genre");
    String menu_id = request.getParameter("menu_id");
    String menu_name = request.getParameter("menu_name");
    String menu_qty = request.getParameter("menu_qty");
    // 全ページ数
    int all_page = (order_userBeans.size()-1)/5;
    // 現在のページ
    int current_page = 0;
    if (request.getParameter("page") != null) {
        current_page = Integer.parseInt(request.getParameter("page"));
    }
    int flag = 0;

%>
<html lang="ja">
    <head>
        <title>オススメ画面</title>
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

                    <!-- ページネーション -->
                    <div class="col mt-3">
                      <div class="pagination offset-4">
                        <div class="page-item">
                            <% if (current_page == 0) { %>
                                <a class="page-link disabled">前のページ</a>
                            <% } else { %>
                                <a class="page-link page" href="FrontController?class_name=order_user.GenreAction&genre=<%=genre%>&page=<%=current_page-1%>">前のページ</a>
                            <% } %>
                        </div>
                            <% for (int i=1; i<=all_page+1; i++) { %>
                                <% if (i == current_page+1) { %>
                                    <div class="page-item active">
                                      <a class="page-link"><%=i%><span class="sr-only">(current)</span></a>
                                    </div>
                                <% } else { %>
                                    <div class="page-item">
                                        <a class="page-link page" href="FrontController?class_name=order_user.GenreAction&genre=<%=genre%>&page=<%=i-1%>"><%=i%></a>
                                    </div>
                                <% } %>
                            <% } %>
                        <div class="page-item">
                            <% if (current_page == all_page) { %>
                                <a class="page-link disabled">次のページ</a>
                            <% } else { %>
                                <a class="page-link page" href="FrontController?class_name=order_user.GenreAction&genre=<%=genre%>&page=<%=current_page+1%>">次のページ</a>
                            <% } %>
                        </div>
                      </div>
                    </div>

                    <!-- メイン -->
                    <% if (order_userBeans.size() == 0) { %>
                    <div class="h3">
                        検索結果はありませんでした
                    </div>
                    <% }else{ %>

                        <!-- 1列目の商品名 -->
                        <% if (order_userBeans.size()-(current_page*5) <= 3) { %>

                            <% flag = 1; %>
                            <div class="row m-2">
                            <% for (int i=current_page*5; i<order_userBeans.size(); i++) { %>
                                <div class="sub_title col-4 text-center">
                                    <%= order_userBeans.get(i).getName() %>
                                </div>
                            <% } %>
                            </div>

                        <% } else { %>

                            <div class="row m-2">
                            <% for (int i=current_page*5; i<current_page*5+3; i++) { %>
                                <div class="sub_title col-4 text-center">
                                    <%= order_userBeans.get(i).getName() %>
                                </div>
                            <% } %>
                            </div>

                        <% }  %>

                        <!-- 1列目のサムネイル -->
                        <% if (flag == 1) { %>

                            <div class="row m-2">
                            <% for (int i=current_page*5; i<order_userBeans.size(); i++) { %>
                                <a class="col-4" id="<%=i%>" href="FrontController?class_name=order_user.SelectAction&genre=<%=genre%>&id=<%=order_userBeans.get(i).getId()%>">
                                    <img class="col-12" src="../static/images/<%=String.valueOf(order_userBeans.get(i).getId())%>.jpg">
                                </a>
                            <% } %>
                            </div>

                        <% } else { %>

                            <div class="row m-2">
                            <% for (int i=current_page*5; i<current_page*5+3; i++) { %>
                                <a class="col-4" id="<%=i%>" href="FrontController?class_name=order_user.SelectAction&genre=<%=genre%>&id=<%=order_userBeans.get(i).getId()%>">
                                    <img class="col-12" src="../static/images/<%=order_userBeans.get(i).getId()%>.jpg">
                                </a>
                            <% } %>
                            </div>

                        <% }  %>

                        <!-- 2列目の商品名 -->
                        <% if (flag == 1) { %>

                        <% } else if (order_userBeans.size()-(current_page*5) <= 5) { %>

                            <% flag = 2; %>
                            <div class="row m-2">
                            <% for (int i=current_page*5+3; i<order_userBeans.size(); i++) { %>
                                <div class="sub_title col-4 text-center">
                                    <%= order_userBeans.get(i).getName() %>
                                </div>
                            <% } %>
                            </div>

                        <% } else { %>

                            <div class="row m-2">
                            <% for (int i=current_page*5+3; i<current_page*5+5; i++) { %>
                                <div class="sub_title col-4 text-center">
                                    <%= order_userBeans.get(i).getName() %>
                                </div>
                            <% } %>
                            </div>

                        <% }  %>

                        <!-- 2列目のサムネ -->
                        <% if (flag == 1) { %>

                                <div class="offset-8 col-4 text-center my-5 py-5">
                                    <a class="bg-info rounded p-4 text-white h1" href="FrontController?class_name=order_user.ArchiveAction">注文履歴</a>
                                </div>

                        <% } else if (order_userBeans.size()-(current_page*5) <= 5) { %>

                            <% flag = 2; %>
                            <div class="row m-2">
                            <% for (int i=current_page*5+3; i<order_userBeans.size(); i++) { %>
                                <a class="col-4" id="<%=i%>" href="FrontController?class_name=order_user.SelectAction&genre=<%=genre%>&id=<%=order_userBeans.get(i).getId()%>">
                                    <img class="col-12" src="../static/images/<%=order_userBeans.get(i).getId()%>.jpg">
                                </a>
                            <% } %>
                                <div class="col-4 mt-4 py-5 text-center">
                                    <a class="bg-info rounded p-4 text-white h1" href="FrontController?class_name=order_user.ArchiveAction">注文履歴</a>
                                </div>
                            </div>

                        <% } else { %>

                            <div class="row m-2">
                            <% for (int i=current_page*5+3; i<current_page*5+5; i++) { %>
                                <a class="col-4" id="<%=i%>" href="FrontController?class_name=order_user.SelectAction&genre=<%=genre%>&id=<%=order_userBeans.get(i).getId()%>">
                                    <img class="col-12" src="../static/images/<%=order_userBeans.get(i).getId()%>.jpg">
                                </a>
                            <% } %>
                                <div class="col-4 mt-4 py-5 text-center">
                                    <a class="bg-info rounded p-4 text-white h1" href="FrontController?class_name=order_user.ArchiveAction">注文履歴</a>
                                </div>
                            </div>

                        <% }  %>


                    <% } %>
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

        // メニューIDを入れる文字列
        var idCsv = "";
        // メニュー名を入れる文字列
        var nameCsv = "";
        // 数量を入れる文字列
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


        //メニュー選択
        <% for (int i=current_page*5; i<order_userBeans.size(); i++) { %>

            $('#<%=i%>').click(function() {

                if (id.length != 0) {

                    $('#<%=i%>').attr(
                        'href',
                        $('#<%=i%>').attr('href') + '&menu_id=' + idCsv + 
                        '&menu_name=' + nameCsv + 
                        '&menu_qty=' + qtyCsv
                        );

                }

            });

        <% } %>

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

        //ページネーション
        $('.page').click(function() {

            if (id.length != 0) {

                $('.page').attr(
                    'href',
                    $('.page').attr('href') + '&menu_id=' + idCsv + 
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
