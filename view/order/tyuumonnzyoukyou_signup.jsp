<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>注文登録</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 mx-3 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    注文登録
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <div class="offset-3 p-3 sub_title">
                        各項目を入力してください
                    </div>
                    <table class="offset-3 col-6 table table-striped">
                        <tr>
                          <th class="field">部屋ID</th>
                          <th class="field">利用ID</th>
                          <th class="field">注文時間</th>
                        </tr>
                        <tr>
                          <td><input type="text" class="form-control"></td>
                          <td><input type="text" class="form-control"></td>
                          <td><input type="time" class="form-control"></td>
                        </tr>
                    </table>
                    <br>
                    <table class="offset-4 col-4 table table-striped">
                        <tr>
                          <th class="field">メニュー名</th>
                          <th class="field">数量</th>
                        </tr>
                        <tr>
                          <td><input type="text" class="form-control"></td>
                          <td><input type="number" class="form-control"></td>
                        </tr>
                    </table>

                    <div class="row my-3">
                        <div class="col-2 offset-4">
                            <a class="btn btn-primary"  href="tyuumonnzyoukyou_signup_confirm.html" role="button">確認</a>
                        </div>
                        <div class="col-2 offset-1">
                            <a class="btn btn-primary" href="tyuumonnzyoukyou_signup.html" role="button">クリア</a>
                        </div>
                    </div>
                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="javascript:history.back();" role="button">戻る</a>
                </div>

            </div>
        </div>
    </body>
</html>
