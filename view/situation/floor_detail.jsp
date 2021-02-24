<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="bean.FloorBean" %>
<%

    FloorBean floorBean = (FloorBean)request.getAttribute("floorBean");

%>
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
                          <td class="field text-center h5 font-weight-bold">部屋番号</td>
                          <td><input type="text" class="form-control" value="<%= floorBean.getId() %>" readonly></td>
                        </tr>
                        <tr>
                          <td class="field text-center h5 font-weight-bold">収容人数</td>
                          <td><input type="text" class="form-control" value="<%= floorBean.getCap() %>" readonly></td>
                        </tr>
                        <tr>
                          <td class="field text-center h5 font-weight-bold">機材状況</td>
                          <td><input type="text" class="form-control" value="<%= floorBean.getMachine() %>" readonly></td>
                        </tr>
                        <tr>
                          <td class="field text-center h5 font-weight-bold">清掃状況</td>
                          <td><input type="text" class="form-control" value="<%= floorBean.getState() %>" readonly></td>
                        </tr>
                    </table>

                    <% if (floorBean.getState().equals("未")) { %>

                        <div class="row mt-5">
                            <div class="col text-center">
                                <a class="btn btn-success" href="FrontController?class_name=situation.SetStateCleanAction&floor_id=<%= floorBean.getId() %>" role="button">清掃完了</a>
                            </div>
                        </div>

                    <% } %>

                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="FrontController?class_name=situation.TopAction" role="button">トップページへ</a>
                </div>

            </div>
        </div>
        
    </body>
</html>
