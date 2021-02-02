<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="bean.EmployeeBean" %>
<%

    EmployeeBean employeeBean = (EmployeeBean)request.getAttribute("employeeBean");

%>
<html lang="ja">
    <head>
        <title>従業員更新</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    従業員更新
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <div class="offset-3 p-3 sub_title">
                        各項目を入力してください
                    </div>
                    <table class="offset-3 col-6 table table-striped">
                        <tr>
                          <td class="field">従業員ID</td>
                          <td class="input-group"><input type="text" class="form-control" id="id" maxlength="3" value="<%= employeeBean.getId() %>" readonly></td>
                        </tr>
                        <tr>
                          <td class="field">パスワード</td>
                          <td class="input-group"><input type="password" class="form-control" id="pass" maxlength="16" value="<%= employeeBean.getPass() %>" required></td>
                        </tr>
                        <tr>
                          <td class="field">氏名</td>
                          <td class="input-group"><input type="text" class="form-control" id="name" maxlength="24" value="<%= employeeBean.getName() %>" required></td>
                        </tr>
                        <tr>
                          <td class="field">役職</td>
                          <td class="input-group">
                              <input type="text" class="form-control" id="position" maxlength="24" value="<%= employeeBean.getPosition() %>" readonly>
                          </td>
                        </tr>
                        <tr>
                          <td class="field">メールアドレス</td>
                          <td class="input-group"><input type="text" class="form-control" id="mail" maxlength="32" value="<%= employeeBean.getMail() %>" required></td>
                        </tr>
                        <tr>
                          <td class="field">電話番号</td>
                          <td class="input-group"><input type="text" class="form-control" id="tel" maxlength="13" value="<%= employeeBean.getTel() %>" required></td>
                        </tr>
                    </table>

                    <div class="row my-3">
                        <div class="col-2 offset-4">
                            <div class="btn btn-primary" id="btn" data-toggle="modal" data-target="#modal1">
                                更新する
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
                <input type="text" name="class_name" value="employee.UpdateAction" hidden>
                <table class="offset-1 col-10 table table-striped">
                    <tr>
                      <td class="field">従業員ID</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_id" name="id" maxlength="3" required></td>
                    </tr>
                    <tr>
                      <td class="field">パスワード</td>
                      <td class="input-group"><input type="password" class="form-control" id="modal_pass" name="pass" maxlength="16" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">氏名</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_name" name="name" maxlength="24" required></td>
                    </tr>
                    <tr>
                      <td class="field">役職</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_position" name="position" maxlength="24" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">メールアドレス</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_mail" name="mail" maxlength="32" required></td>
                    </tr>
                    <tr>
                      <td class="field">電話番号</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_tel" name="tel" maxlength="13" required></td>
                    </tr>
                </table>
                <div class="row">
                    <div class="col-2 offset-3">
                        <input type="submit" class="btn btn-primary" value="更新" role="button">
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
                $('#modal_position').val($('#position').val());
                $('#modal_mail').val($('#mail').val());
                $('#modal_tel').val($('#tel').val());
              });
            });
        </script>
    </body>
</html>
