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
                        <tr>
                          <td class="field">従業員ID</td>
                          <td class="input-group"><%= employeeBeans.get(0).getId() %></td>
                        </tr>
                        <tr>
                          <td class="field">パスワード</td>
                          <td class="input-group"><%= employeeBeans.get(0).getPass() %></td>
                        </tr>
                        <tr>
                          <td class="field">氏名</td>
                          <td class="input-group"><%= employeeBeans.get(0).getName() %></td>
                        </tr>
                        <tr>
                          <td class="field">役職</td>
                          <td class="input-group"><%= employeeBeans.get(0).getPosition() %></td>
                        </tr>
                        <tr>
                          <td class="field">メールアドレス</td>
                          <td class="input-group"><%= employeeBeans.get(0).getMail() %></td>
                        </tr>
                        <tr>
                          <td class="field">電話番号</td>
                          <td class="input-group"><%= employeeBeans.get(0).getTel() %></td>
                        </tr>
                    </table>

                    <div class="row my-3">
                        <div class="col-2 offset-4">
                            <a class="btn btn-primary"  href="FrontController?class_name=employee.UpdateFormAction&keyword=<%=employeeBeans.get(0).getId()%>" role="button">編集</a>
                        </div>
                        <div class="btn btn-primary" id="btn" data-toggle="modal" data-target="#modal1">
                            削除
                        </div>
                    </div>
                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="javascript:history.back();" role="button">戻る</a>
                </div>

            </div>
        </div>
        <%@ include file="../ModalOpenTab.jsp" %>
            <table class="offset-1 col-10 table table-striped">
                <tr>
                  <td class="field">従業員ID</td>
                  <td class="input-group"><%= employeeBeans.get(0).getId() %></td>
                </tr>
                <tr>
                  <td class="field">氏名</td>
                  <td class="input-group"><%= employeeBeans.get(0).getName() %></td>
                </tr>
            </table>
            <div class="row">
                <div class="col-3 offset-3">
                    <a class="btn btn-primary" href="FrontController?class_name=employee.DeleteAction&keyword=<%=employeeBeans.get(0).getId()%>" role="button">削除</a>
                </div>
                <div class="col-3 offset-1">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
                </div>
            </div>
        <%@ include file="../ModalCloseTab.jsp" %>
        <%@ include file="../enhance.jsp" %>
    </body>
</html>
