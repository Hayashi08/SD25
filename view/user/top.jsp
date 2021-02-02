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

                <div class="offset-4 my-3 col-4 main_title">
                    会員管理トップページ
                </div>

                <div class="offset-1 col-10 p-5 main">

                    <form action="FrontController" method="POST">
                        <input type="text" name="class_name" value="user.SearchAction" hidden>

                        <div class="row">
                            <div class="offset-3 sub_title">
                                会員検索
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="input-group offset-3 col-6">
                                <input type="serch" name="keyword" class="form-control" maxlength="16" placeholder="会員IDを入力してください" required>
                                <div class="input-group-append">
                                    <input type="submit" class="btn btn-primary" value="検索" role="button">
                                </div>
                            </div>
                        </div>

                    </form>

                    <div class="row mt-4">
                        <div class="offset-3 sub_title">
                            会員登録
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="offset-5 col-2">
                            <a class="btn btn-primary"  href="FrontController?class_name=user.FormSignupAction" role="button">会員登録</a>
                        </div>
                    </div>

                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="FrontController?class_name=situation.TopAction" role="button">トップページへ</a>
                </div>

            </div>
        </div>
    </body>
</html>
