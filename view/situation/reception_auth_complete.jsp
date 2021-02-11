<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="bean.UserBean" %>
<%

    UserBean userBean = (UserBean)request.getAttribute("userBean");

%>
<html lang="ja">
    <head>
        <title>会員認証 完了</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="col main_title my-3 text-center">
                    会員認証 完了
                </div>

                <div class="main col-10 mx-auto">

                    <div class="row">
                        <table class="col-5 table mx-auto my-5">
                            <tr>
                                <td class="field text-center h5 font-weight-bold">名前</td>
                                <td class="text-center h5 bg-white"><%= userBean.getName() %></td>
                            </tr>
                            <tr>
                                <td class="field text-center h5 font-weight-bold">信用度</td>
                                <td class="text-center h5 bg-white"><%= userBean.getCredit() %></td>
                            </tr>
                            <tr>
                                <td class="field text-center h5 font-weight-bold">ランク</td>
                                <td class="text-center h5 bg-white"><%= userBean.getRank() %></td>
                            </tr>
                        </table>
                    </div>

                    <div class="row my-3">
                        <div class="col text-center">
                          <a class="btn btn-primary"  href="FrontController?class_name=situation.SelectFloorAction&id=<%= userBean.getId() %>" role="button">部屋選択</a>
                        </div>
                    </div>

                </div>
        </div>
    </body>
</html>
