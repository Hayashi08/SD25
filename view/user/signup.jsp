<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>会員登録</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    会員登録
                </div>

                <div class="offset-1 col-10 p-5 main">

                    <form action="FrontController" method="POST">
                        <input type="text" name="class_name" value="user.SignupAction" hidden>

                        <div class="offset-3 p-3 sub_title">
                            各項目を入力してください
                        </div>
                        <table class="offset-3 col-6 table table-striped">
                            <tr>
                              <td class="field">会員ID</td>
                              <td class="input-group"><input type="text" class="form-control" name="id" required></td>
                            </tr>
                            <tr>
                              <td class="field">会員パスワード</td>
                              <td class="input-group"><input type="password" class="form-control" name="pass" required></td>
                            </tr>
                            <tr>
                              <td class="field">名前</td>
                              <td class="input-group"><input type="text" class="form-control" name="name" required></td>
                            </tr>
                            <tr>
                              <td class="field">性別</td>
                              <td class="input-group"><input type="text" class="form-control" name="sex" required></td>
                            </tr>
                            <tr>
                              <td class="field">生年月日</td>
                              <td class="input-group">
                                <input type="date" class="form-control" name="birth" required>
                              </td>
                            </tr>
                            <tr>
                              <td class="field">メールアドレス</td>
                              <td class="input-group"><input type="text" class="form-control" name="mail" required></td>
                            </tr>
                            <tr>
                              <td class="field">電話番号</td>
                              <td class="input-group"><input type="text" class="form-control" name="tel" required></td>
                            </tr>
                            <tr>
                              <td class="field">信用度</td>
                              <td class="input-group">
                                  <select name="credit" size="1">
                                      <option value="1" >1
                                      <option value="2" >2
                                      <option value="3" >3
                                      <option value="4" >4
                                      <option value="5" selected>5
                                  </select>
                              </td>
                            </tr>
                            <tr>
                              <td class="field">ランク</td>
                              <td class="input-group">
                                  <select name="rank" size="1">
                                      <option value="1"  selected>1
                                      <option value="2" >2
                                      <option value="3" >3
                                      <option value="4" >4
                                      <option value="5">5
                                  </select>
                                </td>
                            </tr>
                            <tr>
                              <td class="field">職業</td>
                              <td class="input-group"><input type="text" class="form-control" name="job" required></td>
                            </tr>
                        </table>

                        <div class="row my-3">
                            <div class="col-2 offset-4">
                                <input type="submit" class="btn btn-primary" value="登録" role="button">
                            </div>
                            <div class="col-2 offset-1">
                                <input type="reset" value="クリア" class="btn btn-primary" role="button">
                            </div>
                        </div>

                    </form>

                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="javascript:history.back();" role="button">戻る</a>
                </div>

            </div>
        </div>
    </body>
</html>
