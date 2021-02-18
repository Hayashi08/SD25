<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="bean.SituationBean" %>
<%

    SituationBean situationBean = (SituationBean)request.getAttribute("situationBean");
    int price = (Integer)request.getAttribute("price");

%>
<html lang="ja">
    <head>
        <title>清算 確認</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="col main_title my-3 text-center">
                    清算 確認
                </div>

                <div class="main col-10 mx-auto">

                    <div class="row mt-3 mb-5">
                        <div class="col text-center">
                            <h1>この内容で清算しますか？</h1>
                        </div>
                    </div>

                    <form action="FrontController" method="POST">

                        <input type="text" name="class_name" value="situation.LiquidationAction" hidden>
                        <input type="text" name="user_id" value="<%= situationBean.getUserId() %>" hidden>
                        <input type="text" name="id" value="<%= situationBean.getId() %>" hidden>

                        <div class="row">
                            <table class="col-5 table mx-auto">
                                <tr>
                                    <td class="field text-center h5 font-weight-bold">部屋番号</td>
                                    <td><input type="text" name="floor_id" class="form-control" value="<%= situationBean.getFloorId() %>" readonly></td>
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
                                    <td><input type="text" class="form-control" value="<%= situationBean.getFree() %>" readonly></td>
                                </tr>
                                <tr>
                                    <td class="bg-info text-center h5 font-weight-bold">料金</td>
                                    <td><input type="text" name="sale_total" class="form-control" value="<%= price %>" readonly></td>
                                </tr>
                            </table>
                        </div>

                        <div class="row my-3">
                            <div class="col text-center">
                                <input type="submit" class="btn btn-primary mx-5" value="はい" role="button">
                                <a class="btn btn-primary mx-5" href="javascript:history.back();" role="button">いいえ</a>
                            </div>
                        </div>

                    </form>

                </div>
        </div>
    </body>
</html>
