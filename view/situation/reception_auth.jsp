<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>会員認証</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="col main_title my-3 text-center">
                    会員認証
                </div>

                <div class="main col-10 mx-auto">

                    <form action="FrontController" method="POST">

                        <input type="text" name="class_name" value="situation.AuthUserAction" hidden>

                        <div class="row">
                            <div class="col text-center">
                                <h1>会員証を読み込んで下さい。<br>または会員IDを入力してください。</h1>
                            </div>
                        </div>

                        <div class="row my-5">
                            <div class="col-5 mx-auto input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text field">会員ID</span>
                                </div>
                                <input type="text" name="id" class="form-control" maxlength="16" required>
                            </div>
                        </div>

                        <div class="row my-3">
                            <div class="col text-center">
                                <input type="submit" value="会員認証" class="btn btn-primary mx-5">
                            </div>
                        </div>

                    </form>

                </div>
        </div>
    </body>
</html>
