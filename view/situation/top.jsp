<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.TopBean" %>
<%
    ArrayList<TopBean> topBeans = (ArrayList<TopBean>)request.getAttribute("topBeans");
    int floor = (Integer)request.getAttribute("floor");
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

                <div class="main col-10 mx-auto p-5">

                    <form action="FrontController" method="POST">

                        <input type="text" name="class_name" value="situation.DetailAction" hidden>

                        <% 
                            int index = 0;
                            String floor_id = "";
                            String situation_id = "";
                            String state = "";
                            String buttonClass = "";
                            String floorButton = "";
                            int floor_value = 1;
                        %>

                        <% for (int i = 1; i <= 2; i++) { %>

                            <div class="row mx-5">

                            <% for (int j = 1; j <= 5; j++) { %>

                                <% 
                                    floor_id = topBeans.get(index).getFloor_id();
                                    situation_id = topBeans.get(index).getSituation_id();
                                    state = topBeans.get(index).getState();

                                    buttonClass = "col h1 border mb-0 p-4 text-center";
                                    if (situation_id != null)  {
                                        buttonClass += " bg-primary";
                                    }
                                    else if (state.equals("未")) {
                                        buttonClass += " bg-warning";
                                    }

                                    index++;
                                %>

                                <button type="submit" name="id" value="<%= floor_id %>" class="<%= buttonClass %>"><%= floor_id %></button>

                            <% } %>

                            <% 
                                if (i == 1) {
                                    floorButton = "▲";
                                    if (floor < 5) {
                                        floor_value = floor + 1;
                                    }
                                    else {
                                        floor_value = floor;
                                    }
                                }
                                else {
                                    floorButton = "▼";
                                    if (floor > 1) {
                                        floor_value = floor - 1;
                                    }
                                    else {
                                        floor_value = floor;
                                    }
                                }
                            %>

                            <button type="submit" name="floor" value="<%= floor_value %>" class="col bg-transparent border-0 text-warning text-center" style="font-size: 60px;"><%= floorButton %></button>

                            </div>

                        <% } %>

                    </form>

                    <div class="row mx-5 mt-5">
                        <a class="col-10 p-3 mx-auto btn btn-danger" href="FrontController?class_name=situation.FormAuthUserAction" role="button">
                            <h1 class="text-white">利用受付</h1>
                        </a>
                        <%-- <a class=" col p-3 mx-3 btn btn-success" href="FrontController?class_name=situation.FormLiquidationAction" role="button">
                            <h1 class="text-white">清算</h1>
                        </a> --%>
                    </div>

                    <%-- <div class="row mx-5 my-3">
                        <a class="col p-3 mx-3 btn btn-warning" href="situation/book_auth.html" role="button">
                            <h1 class="text-white">予約登録</h1>
                        </a>
                        <a class="col p-3 mx-3 btn btn-info" href="situation/reception_list.html" role="button">
                            <h1 class="text-white">利用情報一覧</h1>
                        </a>
                        <a class="col p-3 mx-3 btn btn-info" href="situation/book_list.html" role="button">
                            <h1 class="text-white">予約情報一覧</h1>
                        </a>
                    </div> --%>

                </div>

            </div>
        </div>
    </body>
</html>
