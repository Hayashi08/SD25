<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>ログアウト 確認</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col title text-center my-5">
                    カラオケボックス管理システム
                </div>
            </div>

            <div class="col-8 mx-auto pt-3 text-center main">
                <div class="row">
                    <div class="col mt-5">
                        <h1>ログアウトしますか？</h1>
                    </div>
                </div>
                
                <div class="row my-5">
                    <div class="col text-center">
                      <a class="btn btn-primary mx-5"  href="FrontController?class_name=login.LogoutAction" role="button">はい</a>
                      <a class="btn btn-primary mx-5"  href="FrontController?class_name=situation.TopAction" role="button">いいえ</a>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
