<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="bean.FloorBean" %>
<%

    FloorBean floorBean = (FloorBean)request.getAttribute("floorBean");

%>
<html lang="ja">
    <head>
        <title>フロア更新</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    フロア更新
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <div class="offset-3 p-3 sub_title">
                        各項目を入力してください
                    </div>
                    <table class="offset-3 col-6 table table-striped">
                        <tr>
                          <td class="field">部屋番号</td>
                          <td class="input-group"><input type="text" class="form-control" id="floor" maxlength="3" value="<%= floorBean.getId() %>" readonly></td>
                        </tr>
                        <tr>
                          <td class="field">収容人数</td>
                          <td class="input-group"><input type="number" class="form-control" id="cap" maxlength="3" value="<%= floorBean.getCap() %>" required></td>
                        </tr>
                        <tr>
                          <td class="field">機材状況</td>
                          <td class="input-group"><input type="text" class="form-control" id="machine" maxlength="1" value="<%= floorBean.getMachine() %>" required></td>
                        </tr>
                        <tr>
                          <td class="field">清掃状況</td>
                          <td class="input-group">
                              <input type="text" class="form-control" id="state" maxlength="1" value="<%= floorBean.getState() %>" required>
                          </td>
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
                <input type="text" name="class_name" value="floor.UpdateAction" hidden>
                <table class="offset-1 col-10 table table-striped">
                    <tr>
                      <td class="field">部屋番号</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_floor" name="floor" maxlength="3" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">収容人数</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_cap" name="cap" maxlength="3" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">機材状況</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_machine" name="machine" maxlength="1" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">清掃状況</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_state" name="state" maxlength="1" readonly></td>
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
                $('#modal_floor').val($('#floor').val());
                $('#modal_cap').val($('#cap').val());
                $('#modal_machine').val($('#machine').val());
                $('#modal_state').val($('#state').val());
              });
            });
        </script>
    </body>
</html>
