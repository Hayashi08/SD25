<html lang="ja">
    <head>
        <meta charset="utf-8">
        <title>注文登録確認画面</title>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/common.css">
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 mx-3 p-4 main">
                    <div class="row">
                        <div class="offset-1 main_title">
                            まさる堂
                        </div>
                    </div>
                    <div class="row mt-3 mx-4">
                        <a class="col-1 p-1 menu_title" href="../top.html">トップページ</a>
                        <a class="col-1 p-1 menu_title" href="../user/top.html">会員管理</a>
                        <a class="col-1 p-1 menu_title" href="../floor/top.html">フロア管理</a>
                        <a class="col-1 p-1 menu_title" href="../stock/top.html">在庫管理</a>
                        <a class="col-1 p-1 menu_title" href="../order/top.html">注文管理</a>
                        <a class="col-1 p-1 menu_title" href="../analyse/top.html">売上分析</a>
                        <a class="col-1 p-1 menu_title" href="../employee/top.html">従業員管理</a>
                        <a class="col-1 p-1 menu_title" href="../service/top.html">会員サービス</a>
                        <a class="col-1 p-1 menu_title" href="../login/logout_confirm.html">ログアウト</a>
                    </div>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    注文登録確認画面
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <div class="offset-3 p-3 sub_title">
                        この内容で登録しますか
                    </div>

                    <table class="offset-3 col-6 table table-striped">
                        <tr>
                          <th class="field">部屋ID</th>
                          <th class="field">利用ID</th>
                          <th class="field">注文時間</th>
                        </tr>
                        <tr>
                          <td><input type="text" class="form-control" placeholder="103" readonly></td>
                          <td><input type="text" class="form-control" placeholder="3" readonly></td>
                          <td><input type="text" class="form-control" placeholder="13:30" readonly></td>
                        </tr>
                    </table>
                    <br>
                    <table class="offset-4 col-4 table table-striped">
                        <tr>
                          <th class="field">メニュー名</th>
                          <th class="field">数量</th>
                        </tr>
                        <tr>
                          <td><input type="text" class="form-control" placeholder="オムライス" readonly></td>
                          <td><input type="text" class="form-control" placeholder="1" readonly></td>
                        </tr>
                    </table>

                    <div class="row my-3">
                        <div class="col-2 offset-4">
                            <a class="btn btn-primary"  href="tyuumonnzyoukyou_complete.html" role="button">登録</a>
                        </div>
                        <div class="col-2 offset-1">
                            <a class="btn btn-primary" href="tyuumonnzyoukyou_signup.html" role="button">戻る</a>
                        </div>
                    </div>
                </div>

                <div class="offset-8 col-3 my-3">
                </div>

            </div>
        </div>
    </body>
</html>