<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>注文管理トップページ画面</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    注文管理トップページ
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <form method="POST" enctype="multipart/form-data" action="FrontController?class_name=order.FileAction">
                        <input type="file" name="file">
                        <input type="submit" value="アップロード">
                    </form>
                </div>
                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="FrontController?class_name=situation.TopAction" role="button">トップページへ</a>
                </div>

            </div>
        </div>
    </body>
</html>
