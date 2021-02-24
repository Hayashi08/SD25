<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String fItem = request.getParameter("fItem");
    String fItem1 = request.getParameter("fItem1");
    String str_name = request.getParameter("str_name");
%>
<html lang="ja">
    <head>
        <title>注文管理トップページ画面</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    注文管理トップページ
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <div class="row">
                        <%= fItem %>
                    </div>
                    <div class="row">
                        <%= fItem1 %>
                    </div>
                    <div class="row">
                        <%= str_name %>
                    </div>
                </div>
                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="FrontController?class_name=situation.TopAction" role="button">トップページへ</a>
                </div>

            </div>
        </div>
    </body>
</html>
