<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>会員認証 エラー</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="col main_title my-3 text-center">
                    会員認証 エラー
                </div>

                <div class="main col-10 mx-auto">

                    <div class="col pt-3 mx-auto text-center">
                        <div class="row">
                            <div class="col error mt-5">
                                <h1 class="error">認証に失敗しました。</h1>
                            </div>
                        </div>
                        
                        <div class="row my-5">
                            <div class="col">
                              <a class="btn btn-primary"  href="FrontController?class_name=situation.FormAuthUserAction" role="button">リトライ</a>
                            </div>
                        </div>
                    </div>

                </div>
        </div>
    </body>
</html>
