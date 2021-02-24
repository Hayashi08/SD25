<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>部屋登録 エラー</title>
        <%@ include file="../head.jsp" %>
        <link rel="stylesheet" href="../static/css/haikei.css">
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col title text-center my-5">
                    商品注文システム
                </div>
            </div>

            <div class="main col-8 mx-auto pt-3 text-center">
                <div class="row">
                    <div class="col error mt-5">
                        <h1>部屋登録エラー</h1>
                    </div>
                </div>
                <div class="row my-5">
                    <div class="col">
                      <a class="btn btn-primary"  href="javascript:history.back();" role="button">リトライ</a>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
