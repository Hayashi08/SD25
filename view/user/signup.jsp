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
                        <div class="offset-3 p-3 sub_title">
                            各項目を入力してください
                        </div>
                        <table class="offset-3 col-6 table table-striped">
                            <tr>
                              <td class="field">会員ID</td>
                              <td class="input-group"><input type="text" class="form-control" name="id" id="id" maxlength="16" required></td>
                            </tr>
                            <tr>
                              <td class="field">会員パスワード</td>
                              <td class="input-group"><input type="text" class="form-control" id="pass" maxlength="16" required></td>
                            </tr>
                            <tr>
                              <td class="field">氏名</td>
                              <td class="input-group"><input type="text" class="form-control" id="name" maxlength="24" required></td>
                            </tr>
                            <tr>
                              <td class="field">性別</td>
                              <td class="input-group">
                                  <div class="form-check">
                                      <input type="radio" class="form-check-input" id="sex" name="sex" value="男" checked>
                                      <label class="form-check-label"　for="male">男</label>
                                  </div>
                                  <div class="form-check ml-3">
                                      <input type="radio" class="form-check-input" id="sex" name="sex" value="女">
                                      <label class="form-check-label"　for="female">女</label>
                                  </div>
                                  
                              </td>
                            </tr>
                            <tr>
                              <td class="field">生年月日</td>
                              <td class="input-group">
                                <input type="date" class="form-control" id="birth" required>
                              </td>
                            </tr>
                            <tr>
                              <td class="field">メールアドレス</td>
                              <td class="input-group"><input type="email" class="form-control" id="mail" maxlength="32" required></td>
                            </tr>
                            <tr>
                              <td class="field">電話番号</td>
                              <td class="input-group"><input type="tel" class="form-control" id="tel" maxlength="13" required></td>
                            </tr>
                            <tr>
                              <td class="field">職業</td>
                              <%-- <td class="input-group"><input type="text" class="form-control" id="job" maxlength="16" required></td> --%>
                                 <td class="input-group">
                                    <select id="job" size="1">
                                        <option value="未入力" selected>未入力
                                        <option value="学生">学生
                                        <option value="会社員">会社員
                                        <option value="主婦">主婦
                                        <option value="シニア">シニア
                                    </select>
                                 </td>
                            </tr>
                            <tr>
                              <td class="field">信用度</td>
                              <td class="input-group">
                                  <select id="credit" size="1">
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
                                  <select id="rank" size="1">
                                      <option value="1"  selected>1
                                      <option value="2" >2
                                      <option value="3" >3
                                      <option value="4" >4
                                      <option value="5">5
                                  </select>
                                </td>
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
                
               
              <%@ include file="../ModalOpenTab.jsp" %>
              <form action="FrontController" method="POST">
                <input type="text" name="class_name" value="user.SignupAction" hidden>
                <table class="offset-1 col-10 table table-striped">
                    <tr>
                      <td class="field">従業員ID</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_id" name="id" maxlength="3" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">会員パスワード</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_pass" name="pass" maxlength="16" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">氏名</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_name" name="name" maxlength="24" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">性別</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_sex" name="sex" maxlength="1" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">生年月日</td>
                      <td class="input-group"><input type="date" class="form-control" id="modal_birth" name="birth" maxlength="32" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">メールアドレス</td>
                      <td class="input-group"><input type="email" class="form-control" id="modal_mail" name="mail" maxlength="32" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">電話番号</td>
                      <td class="input-group"><input type="tel" class="form-control" id="modal_tel" name="tel" maxlength="13" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">職業</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_job" name="job" maxlength="16" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">信用度</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_credit" name="credit" maxlength="1" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">ランク</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_rank" name="rank" maxlength="1" readonly></td>
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
                $('#modal_id').val($('#id').val());
                $('#modal_pass').val($('#pass').val());
                $('#modal_name').val($('#name').val());
                $('#modal_sex').val($('#sex:checked').val());
                $('#modal_birth').val($('#birth').val());
                $('#modal_mail').val($('#mail').val());
                $('#modal_tel').val($('#tel').val());
                $('#modal_job').val($('#job').val());
                $('#modal_credit').val($('#credit').val());
                $('#modal_rank').val($('#rank').val());
              });
            });
        </script>

            </div>
        </div>
        
    </body>
</html>
