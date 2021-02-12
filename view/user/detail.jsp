<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="bean.UserBean" %>
<%

    UserBean userBean = (UserBean)request.getAttribute("userBean");

%>
<html lang="ja">
    <head>
        <meta charset="utf-8">
        <title>会員情報詳細</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    会員詳細
                </div>

                <div class="offset-1 col-10 p-5 main">

                    <table class="offset-3 col-6 table table-striped">
                        <tr>
                          <td class="field">会員ID</td>
                          <td class="input-group"><%= userBean.getId() %></td>
                        </tr>
                        <tr>
                          <td class="field">会員パスワード</td>
                          <td class="input-group"><%= userBean.getPass() %></td>
                        </tr>
                        <tr>
                          <td class="field">名前</td>
                          <td class="input-group"><%= userBean.getName() %></td>
                        </tr>
                        <tr>
                          <td class="field">性別</td>
                          <td class="input-group"><%= userBean.getSex() %></td>
                        </tr>
                        <tr>
                          <td class="field">生年月日</td>
                          <td class="input-group"><%= userBean.getBirth() %></td>
                        </tr>
                        <tr>
                          <td class="field">メールアドレス</td>
                          <td class="input-group"><%= userBean.getMail() %></td>
                        </tr>
                        <tr>
                          <td class="field">電話番号</td>
                          <td class="input-group"><%= userBean.getTel() %></td>
                        </tr>
                        <tr>
                          <td class="field">職業</td>
                          <td class="input-group"><%= userBean.getJob() %></td>
                        </tr>
                        <tr>
                          <td class="field">信頼度</td>
                          <td class="input-group"><%= userBean.getCredit() %></td>
                        </tr>
                        <tr>
                          <!--  -->
                          <td class="field">ランク</td>
                          <td class="input-group"><%= userBean.getRank() %></td>
                        </tr>
                        <tr>
                          <!--  -->
                          <td class="field">登録日</td>
                          <td class="input-group"><%= userBean.getDate() %></td>
                        </tr>
                    </table>

                    <div class="row my-3">
                        <div class="col-2 offset-4">
                            <a class="btn btn-primary"  href="FrontController?class_name=user.FormUpdateAction&id=<%=userBean.getId()%>" role="button">編集</a>
                        </div>
                        <div class="btn btn-primary" id="btn" data-toggle="modal" data-target="#modal1">
                                                                     削除
                        </div>
                    </div>
                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="javascript:history.back();" role="button">戻る</a>
                </div>
                
            <%@ include file="../ModalOpenTab.jsp" %>
            <table class="offset-1 col-10 table table-striped">
                <tr>
                  <td class="field">会員ID</td>
                  <td class="input-group"><%= userBean.getId() %></td>
                </tr>
                <tr>
                  <td class="field">氏名</td>
                  <td class="input-group"><%= userBean.getName() %></td>
                </tr>
            </table>
            <div class="row">
                <div class="col-3 offset-3">
                    <a class="btn btn-primary" href="FrontController?class_name=user.DeleteAction&id=<%=userBean.getId()%>" role="button">削除</a>
                </div>
                <div class="col-3 offset-1">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
                </div>
            </div>
        <%@ include file="../ModalCloseTab.jsp" %>
        <%@ include file="../enhance.jsp" %>

            </div>
        </div>
    </body>
</html>
