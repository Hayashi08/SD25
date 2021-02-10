<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>未提供一覧</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 mx-3 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 main_title text-center">
                    未提供一覧
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <div class="row">
                        <div class="offset-3 sub_title">
                            未提供検索
                        </div>
                    </div>
                    
                    <div class="row mt-4">
                        <div class="input-group offset-3 col-6">
                            <input type="search" name="keyword" class="form-control" maxlength="16" placeholder="を入力してください" required>
                            <div class="input-group-append">
                                <input type="submit" class="btn btn-primary" value="検索" role="button">
                            </div>
                        </div>
                    </div>
                    <div class=" p-3 sub_title">
                        検索結果
                    </div>

                    <table class="col-12 table table-striped">
                        <tr>
                          <th class="field">注文番号</th>
                          <th class="field">部屋ID</th>
                          <th class="field">利用ID</th>
                          <th class="field">注文内容</th>
                          <th class="field">数量</th>
                          <th class="field">注文時間</th>
                          <th class="field">性別</th>
                          <th class="field">年齢層</th>
                          <th class="field">注文状況</th>
                          <th class="field">注文状況変更</th>
                        </tr>
                        <tr>
                          <td>2</td>
                          <td>102</td>
                          <td>2</td>
                          <td>コーンスープ</td>
                          <td>2</td>
                          <td>13:00</td>
                          <td></td>
                          <td></td>
                          <td>未提供</td>
                          <td>　<a class="btn btn-primary" href="miteikyou_confirm.html" role="button">提供完了</a></td>
                        </tr>
                    </table>
                </div>

                <div class="offset-9 col-3 my-3">
                    <a class="btn btn-primary m-5" href="FrontController?class_name=order.TopAction" role="button">注文管理トップページへ戻る</a>
                </div>

            </div>
        </div>
    </body>
</html>