<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>清算</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="col main_title my-3 text-center">
                    清算
                </div>

                <div class="main col-10 mx-auto">

                    <div class="row">
                        <div class="col text-center">
                            <h1>伝票のバーコードを読み込んで下さい。<br>または利用IDを入力してください。</h1>
                        </div>
                    </div>

                    <form action="FrontController" method="POST">

                        <input type="text" name="class_name" value="situation.ConfirmLiquidationAction" hidden>

                        <div class="row my-5">
                            <div class="col-5 mx-auto input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text field">利用ID</span>
                                </div>
                                <input type="number" name="id" class="form-control" required>
                            </div>
                        </div>

                        <div class="row my-3">
                            <div class="col text-center">
                                <input type="submit" class="btn btn-primary" value="清算" role="button">
                            </div>
                        </div>

                    </form>

                </div>
        </div>
    </body>
</html>
