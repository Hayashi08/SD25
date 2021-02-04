<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>トップページ画面</title>
       <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
      <%@ include file="../header.jsp" %>
                        </div>
                    </div>
                    <div class="row mt-3 mx-4">
                        <a class="col-1 p-1 menu_title" href="../top.html">トップページ</a>
                        <a class="col-1 p-1 menu_title" href="../user/top.html">会員管理</a>
                        <a class="col-1 p-1 menu_title" href="../floor/top.html">フロア管理</a>
                        <a class="col-1 p-1 menu_title" href="top.html">在庫管理</a>
                        <a class="col-1 p-1 menu_title" href="../order/top.html">注文管理</a>
                        <a class="col-1 p-1 menu_title" href="../analyse/top.html">売上分析</a>
                        <a class="col-1 p-1 menu_title" href="../employee/top.html">従業員管理</a>
                        <a class="col-1 p-1 menu_title" href="../service/top.html">会員サービス</a>
                        <a class="col-1 p-1 menu_title" href="../login/logout_confirm.html">ログアウト</a>
                    </div>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    在庫管理検索
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <div class="row">
                        <div class="offset-3 sub_title">
                            在庫検索
                        </div>
                        <div class="offset-5 mt-3 col-5">
                            <input type="text" class="form-control">
                        </div>
                    </div>
                    <div class="row my-3">
                        <div class="col-2 offset-4">
                            <a class="btn btn-primary"  href="search_result.html" role="button">検索</a>
                        </div>
                        <div class="col-2 offset-1">
                            <a class="btn btn-primary" href="search.html" role="button">クリア</a>
                        </div>
                    </div>
                </div>


                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="top.html" role="button">在庫管理トップ</a>
                </div>

            </div>
        </div>
    </body>
</html>