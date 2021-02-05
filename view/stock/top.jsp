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

                <div class="offset-4 my-3 col-4 main_title text-center">
                    在庫管理トップページ
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <div class="row my-3">
                        <div class="col-2 offset-1">
                            <a class="btn btn-primary"  href="FrontController?class_name=stock.ItemIndexAction" role="button">品目管理</a>
                        </div>
                        <div class="col-2 offset-1">
                            <a class="btn btn-primary" href="FrontController?class_name=stock.SearchAction" role="button">在庫管理</a>
                        </div>
                        <div class="col-2 offset-1">
                            <a class="btn btn-primary" href="FrontController?class_name=user.OrderIndexAction" role="button">発注管理</a>
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
