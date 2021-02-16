<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>ログイン画面</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col title text-center my-5">
                    商品注文システム
                </div>
            </div>

            <form action="FrontController" method="POST">
                <input type="text" name="class_name" value="order_user.LoginAction" hidden>

                <div class="offset-1 col-10 pt-3 text-center main">
                    <div class="offset-4 my-5 col-4 main_title">
                        ログイン画面
                    </div>
                    <div class="row my-5">
                        <div class="offset-3 col-2">
                            従業員ID
                        </div>
                        <div class="col-4">
                            <input type="text" name="id" placeholder="従業員ID">
                        </div>
                    </div>
                    <div class="row my-5">
                        <div class="offset-3 col-2">
                            パスワード
                        </div>
                        <div class="col-4">
                            <input type="password" name="pass" placeholder="パスワード">
                        </div>
                    </div>
                    <div class="row my-5">
                        <div class="col text-center">
                        <input type="submit" class="btn btn-primary" value="ログイン">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
