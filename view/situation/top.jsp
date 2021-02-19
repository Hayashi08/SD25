<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.TopBean" %>
<%
    ArrayList<TopBean> topBeans = (ArrayList<TopBean>)request.getAttribute("topBeans");
%>
<html lang="ja">
    <head>
        <title>トップページ</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="text-center my-3 col main_title">
                    トップページ
                </div>

                <div class="main col-12 mx-auto">

                    <form action="FrontController" method="POST">

                    <input type="text" name="class_name" value="situation.DetailAction" hidden>

                    <% for (int i = 1; i <= 5; i++) { %>

                        <div class="row px-5">

                        <% for (int j = 1; j <= 10; j++) { %>

                            <% if (j == 10) { %>
                                <button type="submit" name="id" value="<%= i %><%= j %>" class="col border p-3 text-center"><%= i %><%= j %></button>
                            <% } else { %>
                                <button type="submit" name="id" value="<%= i %>0<%= j %>" class="col border p-3 text-center"><%= i %>0<%= j %></button>
                            <% } %>

                        <% } %>

                        </div>

                    <% } %>

                    </form>

                    <div class="row mx-5 my-3">
                        <a class=" col p-3 mx-3 btn btn-danger" href="FrontController?class_name=situation.FormAuthUserAction" role="button">
                            <h1 class="text-white">利用受付</h1>
                        </a>
                        <a class=" col p-3 mx-3 btn btn-success" href="FrontController?class_name=situation.FormLiquidationAction" role="button">
                            <h1 class="text-white">清算</h1>
                        </a>
                    </div>

                    <div class="row mx-5 my-3">
                        <a class="col p-3 mx-3 btn btn-warning" href="situation/book_auth.html" role="button">
                            <h1 class="text-white">予約登録</h1>
                        </a>
                        <a class="col p-3 mx-3 btn btn-info" href="situation/reception_list.html" role="button">
                            <h1 class="text-white">利用情報一覧</h1>
                        </a>
                        <a class="col p-3 mx-3 btn btn-info" href="situation/book_list.html" role="button">
                            <h1 class="text-white">予約情報一覧</h1>
                        </a>
                    </div>

                </div>

            </div>
        </div>
    </body>
</html>
