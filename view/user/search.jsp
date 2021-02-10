<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.UserBean" %>
<%

    ArrayList<UserBean> userBeans = (ArrayList<UserBean>)request.getAttribute("userBeans");

%>
<html lang="ja">
    <head>
        <title>検索結果一覧</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    検索結果
                </div>

                <div class="offset-1 col-10 p-5 main">

                    <form action="FrontController" method="POST">
                        <input type="text" name="class_name" value="user.SearchAction" hidden>
                    
                        <div class="row">
                            <div class="offset-3 sub_title">
                                会員検索
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="input-group offset-3 col-6">
                                <input type="search" name="keyword" class="form-control" maxlength="16" placeholder="会員IDを入力してください" required>
                                <div class="input-group-append">
                                    <input type="submit" class="btn btn-primary" value="検索" role="button">
                                </div>
                            </div>
                        </div>
                    
                    </form>
                    
                    <% if (userBeans.size() == 0) { %>
                        <div class="h3 m-5 col text-center">
							検索結果はありませんでした
                        </div>
                    <% }else{ %>

                    <table class="offset-3 col-6 table table-striped">
                        <tr>
                          <th class="field">会員ID</th>
                          <th class="field">氏名</th>
                          <th class="field">DATE</th>
                          <th class="field">詳細</th>
                        </tr>
                        <% for (int i=0; i < userBeans.size(); i++) { %>
                            <tr>
                                <td><%= userBeans.get(i).getId() %></td>
                                <td><%= userBeans.get(i).getName() %></td>
                                <td><%= userBeans.get(i).getDate() %></td>
                                <td><a class="btn btn-primary" href="FrontController?class_name=user.DetailAction&id=<%=userBeans.get(i).getId()%>" role="button">詳細</a></td>
                            </tr>
                        <% } %>
                    </table>
                    <% } %>
                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="FrontController?class_name=user.TopAction" role="button">会員管理トップへ</a>
                </div>

            </div>
        </div>
    </body>
</html>
