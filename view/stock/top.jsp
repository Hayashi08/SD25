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
                    <div class="row">
                      
             
                    </div>
                    <div class="row my-3">
                        <div class="col-2 offset-1">
                            <a class="btn btn-primary"  href="signup.jsp" role="button">在庫登録</a>
                        </div>
                        <div class="col-2 offset-1">
                            <a class="btn btn-primary" href="search.html" role="button">在庫管理</a>
                        </div>
                        <div class="col-2 offset-1">
                            <a class="btn btn-primary" href="order_signup.html" role="button">発注登録</a>
                        </div>
                        <div class="col-2 offset-1">
                            <a class="btn btn-primary" href="order_search.html" role="button">発注管理</a>
                        </div>
                    </div>
                    <div class="row mt-5">
  
                    </div>

                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="/view/analyse/top.jsp" role="button">トップページへ</a>
                </div>

            </div>
        </div>
    </body>
</html>
