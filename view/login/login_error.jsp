<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>ログイン エラー</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col title text-center my-5">
                    カラオケボックス管理システム
                </div>
            </div>

            <div class="main col-8 mx-auto pt-3 text-center">
                <div class="row">
                    <div class="col error mt-5">
                        <h1>ログインエラー</h1>
                    </div>
                </div>
                
                <div class="row my-5">
                    <div class="col">
                      <a class="btn btn-primary"  href="../index.html" role="button">リトライ</a>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
