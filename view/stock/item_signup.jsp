<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>品目登録</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    品目登録
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <div class="offset-3 p-3 sub_title">
                        各項目を入力してください
                    </div>
                    <table class="offset-3 col-6 table table-striped">
                        <tr>
                          <td class="field">品目名</td>
                          <td class="input-group"><input type="text" class="form-control" id="name" maxlength="30" required></td>
                        </tr>
                        <tr>
                          <td class="field">ジャンル</td>
                          <td class="input-group">
                              <select class="custom-select" id="genre" size="1">
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
                          </td>
                        </tr>
                        <tr>
                          <td class="field">許容量</td>
                          <td class="input-group"><input type="number" class="form-control" id="max" maxlength="5" required></td>
                        </tr>
                        <tr>
                          <td class="field">最低量</td>
                          <td class="input-group"><input type="number" class="form-control" id="min" maxlength="5" required></td>
                        </tr>
                    </table>

                    <div class="row my-3">
                        <div class="col-2 offset-4">
                            <div class="btn btn-primary" id="btn" data-toggle="modal" data-target="#modal1">
                                登録する
                            </div>
                        </div>
                        <div class="col-2 offset-1">
                            <input type="reset" value="クリア" class="btn btn-primary" role="button">
                        </div>
                    </div>
                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="javascript:history.back();" role="button">戻る</a>
                </div>
            </div>
        </div>
        <%@ include file="../ModalOpenTab.jsp" %>
              <form action="FrontController" method="POST">
                <input type="text" name="class_name" value="stock.ItemSignupAction" hidden>
                    <table class="offset-1 col-10 table table-striped">
                        <tr>
                          <td class="field">品目名</td>
                          <td class="input-group"><input type="text" class="form-control" id="modal_name" name="name" maxlength="30" required></td>
                        </tr>
                        <tr>
                          <td class="field">ジャンル</td>
                          <td class="input-group"><input type="text" class="form-control" id="modal_genre" name="genre" maxlength="20" required></td>
                        </tr>
                        <tr>
                          <td class="field">許容量</td>
                          <td class="input-group"><input type="number" class="form-control" id="modal_max" name="max" maxlength="5" required></td>
                        </tr>
                        <tr>
                          <td class="field">最低量</td>
                          <td class="input-group"><input type="number" class="form-control" id="modal_min" name="min" maxlength="5" required></td>
                        </tr>
                    </table>
                <div class="row">
                    <div class="col-2 offset-3">
                        <input type="submit" class="btn btn-primary" value="登録" role="button">
                    </div>
                    <div class="col-3 offset-1">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
                    </div>
                </div>
              </form>
        <%@ include file="../ModalCloseTab.jsp" %>
        <%@ include file="../enhance.jsp" %>
        <script type="text/javascript">
            $(function () {
              $('#btn').click(function() {
                $('#modal_name').val($('#name').val());
                $('#modal_genre').val($('#genre').val());
                $('#modal_max').val($('#max').val());
                $('#modal_min').val($('#min').val());
              });
            });
        </script>
    </body>
</html>
