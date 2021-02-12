<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>部屋番号入力画面</title>
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
                <input type="text" name="class_name" value="order_user.FloorSignupAction" hidden>
                <div class="offset-1 col-10 pt-3 text-center main">
                    <div class="offset-4 my-5 col-4 main_title">
                        部屋番号入力画面
                    </div>
                    <div class="row my-5">
                        <div class="offset-3 col-2">
                            部屋番号
                        </div>
                        <div class="col-4">
                            <input type="text" name="floor_id" placeholder="部屋番号">
                        </div>
                    </div>
                    <div class="row my-5">
                        <div class="col text-center">
                        <input type="submit" class="btn btn-primary" value="確定">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
