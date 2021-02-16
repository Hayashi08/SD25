<%@ page contentType="text/html;charset=UTF-8" %>
<%

    String user_id = (String)request.getAttribute("user_id");
    String floor_id = (String)request.getAttribute("floor_id");
    String floor_cap = (String)request.getAttribute("floor_cap");
%>
<html lang="ja">
    <head>
        <title>利用登録</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="col main_title my-3 text-center">
                    利用登録
                </div>

                <div class="main col-10 mx-auto">

                    <form action="FrontController" method="POST">

                        <input type="text" name="class_name" value="situation.SignupAction" hidden>
                        <input type="text" name="user_id" value="<%= user_id %>" hidden>

                        <div class="row">
                            <table class="col-5 table mx-auto">
                                <tr>
                                    <td class="field text-center h5 font-weight-bold">部屋番号</td>
                                    <td><input type="text" name="floor_id" class="form-control" value="<%= floor_id %>" readonly></td>
                                </tr>
                                <tr>
                                    <td class="field text-center h5 font-weight-bold">利用人数</td>
                                    <td><input type="number" name="qty" class="form-control" max="<%= floor_cap %>" required></td>
                                </tr>
                                <tr>
                                    <td class="field text-center h5 font-weight-bold">開始時間</td>
                                    <td><input type="time" name="start" class="form-control" required></td>
                                </tr>
                                <tr>
                                    <td class="field text-center h5 font-weight-bold">終了時間</td>
                                    <td><input type="time" name="end" class="form-control" required></td>
                                </tr>
                                <tr>
                                    <td class="field text-center h5 font-weight-bold">フリータイム</td>
                                    <td class="input-group">
                                            <div class="form-check">
                                                <input type="radio" class="form-check-input" name="free" value="有">
                                                <label class="form-check-label" for="yes">有</label>
                                            </div>
                                            <div class="form-check ml-3">
                                                <input type="radio" class="form-check-input" name="free" value="無" checked>
                                                <label class="form-check-label" for="no">無</label>
                                            </div>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="row my-3">
                            <div class="col text-center">
                                <input type="submit" class="btn btn-primary mx-5" value="登録" role="button">
                                <a class="btn btn-primary mx-5"  href="javascript:history.back();" role="button">戻る</a>
                            </div>
                        </div>

                    </form>

                </div>
        </div>
    </body>
</html>
