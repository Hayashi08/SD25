<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>メニュートップ</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    メニュー管理トップページ
                </div>

               <div class="offset-1 col-10 p-5 main">
                    <div class="row">
                        <div class="offset-3 sub_title">
                            メニュー検索
                        </div>
                        <div class="offset-5 mt-3 col-5">
                            <input type="text" class="form-control">
                        </div>
                    </div>
                    <div class="row my-3">
                        <div class="col-2 offset-4">
                            <a class="btn btn-primary"  href="search.html" role="button">検索</a>
                        </div>
                        <div class="col-2 offset-1">
                            <a class="btn btn-primary" href="menyu_top.html" role="button">クリア</a>
                        </div>
                    </div>
                    <div class="row mt-5">
                        <div class="offset-3 sub_title">
                            メニュー登録
                        </div>
                    </div>
                    <div class="row">
                        <div class="offset-5 mt-3">
                            <a class="btn btn-primary"  href="FrontController?class_name=order.FormSignupAction" role="button">メニュー登録</a>
                        </div>
                    </div>
                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="javascript:history.back();" role="button">戻る</a>
                </div>

            </div>
        </div>
    </body>
</html>
