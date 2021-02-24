<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.FloorBean" %>
<%

    ArrayList<FloorBean> floorBeans = (ArrayList<FloorBean>)request.getAttribute("floorBeans");
    String user_id = (String)request.getAttribute("user_id");

%>
<html lang="ja">
    <head>
        <title>利用登録 部屋選択</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="col main_title my-3 text-center">
                    利用登録 部屋選択
                </div>

                <div class="main col-10 mx-auto">


                    <table class="col-5 table mx-auto my-3">
                        <tr>
                          <td class="field text-center h5 font-weight-bold">部屋番号</td>
                          <td class="field text-center h5 font-weight-bold">収容人数</td>
                          <td class="field text-center h5 font-weight-bold">機材状態</td>
                          <td class="field text-center h5 font-weight-bold">登録</td>
                        </tr>
                        <% for (int i=0; i < floorBeans.size(); i++) { %>
                            <tr>
                                <td class="text-center h5 bg-white"><%= floorBeans.get(i).getId() %></td>
                                <td class="text-center h5 bg-white"><%= floorBeans.get(i).getCap() %></td>
                                <td class="text-center h5 bg-white"><%= floorBeans.get(i).getMachine() %></td>
                                <td class="text-center h5 bg-white">
                                    <a href="FrontController?class_name=situation.FormSignupAction&user_id=<%= user_id %>&floor_id=<%= floorBeans.get(i).getId() %>&floor_cap=<%= floorBeans.get(i).getCap() %>" class="btn btn-primary" role="button">利用</a>
                                </td>
                            </tr>
                        <% } %>
                    </table>

                </div>
        </div>
    </body>
</html>
