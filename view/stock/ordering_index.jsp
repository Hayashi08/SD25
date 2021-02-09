<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>発注詳細検索</title>
       <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>

                </div>

                <div class="offset-4 my-3 col-4 main_title text-center">
                    発注詳細検索
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <div class="row my-3">
                        <div class="col-3 text-center">
                            <a class="btn btn-primary"  href="FrontController?class_name=stock.ItemIndexAction" role="button">品目管理</a>
                        </div>
                        <div class="col-3 text-center offset-1">
                            <a class="btn btn-primary" href="FrontController?class_name=stock.StockIndexAction" role="button">在庫詳細検索</a>
                        </div>
                        <div class="col-3 text-center offset-1">
                            <a class="btn btn-primary" href="FrontController?class_name=stock.TopAction" role="button">トップページ</a>
                        </div>
                    </div>

                    <form action="FrontController" method="POST">
                        <input type="text" name="class_name" value="stock.OrderingSearchAction" hidden>

                        <div class="row">
                            <div class="offset-3 sub_title">
                                発注検索
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="input-group offset-3 col-6">
                                <input type="serch" name="keyword" class="form-control" maxlength="16" placeholder="品目ID、品目名、ジャンルを入力してください" required>
                                <div class="input-group-append">
                                    <input type="submit" class="btn btn-primary" value="検索" role="button">
                                </div>
                            </div>
                        </div>

                    </form>

                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="FrontController?class_name=situation.TopAction" role="button">トップページへ</a>
                </div>

            </div>
        </div>
    </body>
</html>