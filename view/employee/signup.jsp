<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>従業員登録</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    従業員登録
                </div>

                <div class="offset-1 col-10 p-5 main">
                  <form action="FrontController" method="POST">
                    <input type="text" name="class_name" value="employee.SignupAction" hidden>
                    <div class="offset-3 p-3 sub_title">
                        各項目を入力してください
                    </div>
                    <table class="offset-3 col-6 table table-striped">
                        <tr>
                          <td class="field">従業員ID</td>
                          <td class="input-group"><input type="text" class="form-control" id="id" name="id" maxlength="3" required></td>
                        </tr>
                        <tr>
                          <td class="field">パスワード</td>
                          <td class="input-group"><input type="password" class="form-control" name="pass" maxlength="16" required></td>
                        </tr>
                        <tr>
                          <td class="field">氏名</td>
                          <td class="input-group"><input type="text" class="form-control" name="name" maxlength="24" required></td>
                        </tr>
                        <tr>
                          <td class="field">役職</td><!-- プルダウン -->
                          <td class="input-group">
                              <select name="position" size="1">
                                  <option value="未入力" selected>未入力
                                  <option value="SV">SV
                                  <option value="店長">店長
                                  <option value="副店長">副店長
                                  <option value="社員">社員
                                  <option value="アルバイト">アルバイト
                              </select>
                          </td>
                        </tr>
                        <tr>
                          <td class="field">メールアドレス</td>
                          <td class="input-group"><input type="text" class="form-control" name="mail" maxlength="32" required></td>
                        </tr>
                        <tr>
                          <td class="field">電話番号</td>
                          <td class="input-group"><input type="text" class="form-control" name="tel" maxlength="13" required></td>
                        </tr>
                    </table>

                    <div class="row my-3">
                        <div class="col-2 offset-4">
                            <input type="submit" class="btn btn-primary" value="登録" role="button">
                        </div>
                        <div class="col-2 offset-1">
                            <input type="reset" class="btn btn-primary" value="クリア" role="button">
                        </div>
                    </div>
                  </form>
                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="javascript:history.back();" role="button">戻る</a>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(function () {
              $('#btn').click(function() {
                $('#modal_id').val($('#id').val());
              }
            )});
        </script>
    </body>
</html>
