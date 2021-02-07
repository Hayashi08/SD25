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
                        <div class="col-3 text-center">
                            <a class="btn btn-primary"  href="FrontController?class_name=stock.ItemIndexAction" role="button">品目管理</a>
                        </div>
                        <div class="col-3 text-center offset-1">
                            <a class="btn btn-primary" href="FrontController?class_name=stock.FormGenreSearchAction" role="button">在庫詳細検索</a>
                        </div>
                        <div class="col-3 text-center offset-1">
                            <a class="btn btn-primary" href="FrontController?class_name=user.OrderIndexAction" role="button">発注詳細検索</a>
                        </div>
                    </div>

                    <div class="row my-5">
                        <div class="offset-3 sub_title">
                            在庫管理
                        </div>
                    </div>
                    <div class="row">
                        <div class="offset-3 sub_title">
                            ジャンルを選択してください
                        </div>
                    </div>
                    <form action="FrontController" method="POST">
                        <input type="text" name="class_name" value="stock.GenreSearchAction" hidden>
                        <div class="row my-5">
                            <div class="offset-3 col-6 text-center">
                                <select class="custom-select" name="genre" size="1">
                                    <option value="未入力" selected>未入力
                                    <option value="米・雑穀・シリアル">米・雑穀・シリアル
                                    <option value="麺類">麺類
                                    <option value="野菜">野菜
                                    <option value="水産物・水産加工品">水産物・水産加工品
                                    <option value="肉・肉加工品">肉・肉加工品
                                    <option value="卵・チーズ・乳製品">卵・チーズ・乳製品
                                    <option value="果物">果物
                                    <option value="調味料">調味料
                                    <option value="リキュール">リキュール
                                    <option value="ソフトドリンク">ソフトドリンク
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="offset-7">
                                <input type="submit" class="btn btn-primary" value="検索" role="button">
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
