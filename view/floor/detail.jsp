<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>フロア詳細</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    フロア詳細
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <table class="offset-3 col-6 table table-striped">
                        <tr>
                          <td class="field">部屋番号</td>
                          <td class="input-group">202</td>
                        </tr>
                        <tr>
                          <td class="field">収容人数</td>
                          <td class="input-group">4</td>
                        </tr>
                        <tr>
                          <td class="field">機材状況</td>
                          <td class="input-group">マイク不良</td>
                        </tr>
                        <tr>
                          <td class="field">清掃状況</td>
                          <td class="input-group">清掃済み</td>
                        </tr>
                    </table>

                    <div class="row my-3">
                        <div class="col-2 offset-4">
                            <a class="btn btn-primary"  href="FrontController?class_name=floor.FormEditAction" role="button">編集</a>
                        </div>
                        <div class="col-2 offset-1">
                            <a class="btn btn-primary" href="FrontController?class_name=floor.FormDelete_CompleteAction" role="button">削除</a>
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
