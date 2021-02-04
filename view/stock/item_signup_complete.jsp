<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>登録完了</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    品目登録完了
                </div>

                <div class="main col-10 mx-auto pt-3 text-center">
                    <div class="row">
                        <div class="col mt-5">
                            <h1>登録完了しました。</h1>
                        </div>
                    </div>
                    
                    <div class="row my-5">
                        <div class="col">
                            <a class="btn btn-primary m-5" href="FrontController?class_name=stock.ItemIndexAction" role="button">品目管理トップへ</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </body>
</html>
