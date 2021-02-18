<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>予約登録 完了</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="col main_title my-3 text-center">
                    予約登録 完了
                </div>

                <div class="main col-10 mx-auto pt-3 text-center">
                    <div class="row">
                        <div class="col mt-5">
                            <h1>予約登録完了しました。</h1>
                        </div>
                    </div>
                    
                    <div class="row my-5">
                        <div class="col">
                          <a class="btn btn-primary"  href="FrontController?class_name=situation.TopAction" role="button">トップページへ</a>
                        </div>
                    </div>
                </div>

        </div>
    </body>
</html>
