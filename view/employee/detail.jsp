<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.EmployeeBean" %>
<%

    ArrayList<EmployeeBean> employeeBeans = (ArrayList<EmployeeBean>)request.getAttribute("employeeBeans");

%>
<html lang="ja">
    <head>
        <title>従業員詳細</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                   従業員詳細
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <table class="offset-3 col-6 table table-striped">
                        <% for (int i=0; i < employeeBeans.size(); i++) { %>
                            <tr>
                              <td class="field">従業員ID</td>
                              <td class="input-group"><%= employeeBeans.get(i).getId() %></td>
                            </tr>
                            <tr>
                              <td class="field">パスワード</td>
                              <td class="input-group"><%= employeeBeans.get(i).getPass() %></td>
                            </tr>
                            <tr>
                              <td class="field">氏名</td>
                              <td class="input-group"><%= employeeBeans.get(i).getName() %></td>
                            </tr>
                            <tr>
                              <td class="field">役職</td>
                              <td class="input-group"><%= employeeBeans.get(i).getPosition() %></td>
                            </tr>
                            <tr>
                              <td class="field">メールアドレス</td>
                              <td class="input-group"><%= employeeBeans.get(i).getMail() %></td>
                            </tr>
                            <tr>
                              <td class="field">電話番号</td>
                              <td class="input-group"><%= employeeBeans.get(i).getTel() %></td>
                            </tr>
                        <% } %>
                    </table>

                    <div class="row my-3">
                        <div class="col-2 offset-4">
                            <a class="btn btn-primary"  href="edit.html" role="button">編集</a>
                        </div>
                        <div class="col-2 offset-1">
                            <a class="btn btn-primary" href="delete_confirm.html" role="button">削除</a>
                        </div>
                    </div>
                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="javascript:history.back();" role="button">戻る</a>
                </div>

            </div>
        </div>
    </body>
</html>
