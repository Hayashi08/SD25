<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>メニュー削除完了</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 mx-3 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    メニュー削除完了
                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="FrontController?class_name=order.FormMenyu_TopAction" role="button">メニュー管理トップページへ</a>
                </div>

            </div>
        </div>
    </body>
</html>
