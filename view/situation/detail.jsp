<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="bean.SituationBean" %>
<%
    SituationBean situationBean = (SituationBean)request.getAttribute("situationBean");
%>
<html lang="ja">
    <head>
        <title>利用情報詳細</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="col main_title my-3 text-center">
                    利用情報詳細
                </div>

                <div class="main col-10 mx-auto">

                    <div class="row">
                        <table class="col-5 table mx-auto">
                            <tr>
                              <td class="field text-center h5 font-weight-bold">部屋番号</td>
                              <td><input type="text" class="form-control" value="<%= situationBean.getFloorId() %>" readonly></td>
                            </tr>
                            <tr>
                              <td class="field text-center h5 font-weight-bold">利用人数</td>
                              <td><input type="number" class="form-control" value="<%= situationBean.getQty() %>" readonly></td>
                            </tr>
                            <tr>
                              <td class="field text-center h5 font-weight-bold">開始時間</td>
                              <td><input type="time" class="form-control" value="<%= situationBean.getStart() %>" readonly></td>
                            </tr>
                            <tr>
                              <td class="field text-center h5 font-weight-bold">終了時間</td>
                              <td><input type="time" class="form-control" value="<%= situationBean.getEndSchedule() %>" readonly></td>
                            </tr>
                            <tr>
                              <td class="field text-center h5 font-weight-bold">フリータイム</td>
                              <td class="text-center h5"><%= situationBean.getFree() %></td>
                            </tr>
                        </table>
                    </div>


                    <div class="row my-3">
                        <div class="col text-center">
                          <%-- <a class="btn btn-primary mx-3" href="reception_edit.html" role="button">編集</a>
                          <a class="btn btn-danger" href="reception_delete_confirm.html" role="button">削除</a> --%>
                          <a class="btn btn-success" href="FrontController?class_name=situation.ConfirmLiquidationAction&id=<%= situationBean.getId() %>" role="button">
                            清算
                          </a>
                          <a class="btn btn-info ml-5" href="FrontController?class_name=book.FormSignupAction&floor_id=<%= situationBean.getFloorId() %>&end=<%= situationBean.getEndSchedule() %>" role="button">
                            予約
                          </a>
                        </div>
                    </div>

                </div>

                <div class="offset-8 col-3 my-3">
                  <a class="btn btn-primary m-5" href="FrontController?class_name=situation.TopAction" role="button">トップページへ</a>
                </div>

        </div>
    </body>
</html>
