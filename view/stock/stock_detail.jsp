<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="bean.StockBean" %>
<%

    StockBean stockBean = (StockBean)request.getAttribute("stockBean");

%>
<html lang="ja">
    <head>
        <title>在庫詳細</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                   在庫詳細
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <table class="offset-3 col-6 table table-striped">
                        <tr>
                          <td class="field">在庫ID</td>
                          <td class="input-group"><%= stockBean.getId() %></td>
                        </tr>
                        <tr>
                          <td class="field">品目名</td>
                          <td class="input-group"><%= stockBean.getName() %></td>
                        </tr>
                        <tr>
                          <td class="field">ジャンル</td>
                          <td class="input-group"><%= stockBean.getGenre() %></td>
                        </tr>
                        <tr>
                          <td class="field">許容量</td>
                          <td class="input-group"><%= stockBean.getMax() %></td>
                        </tr>
                        <tr>
                          <td class="field">最低量</td>
                          <td class="input-group"><%= stockBean.getMin() %></td>
                        </tr>
                        <tr>
                          <td class="field">在庫量</td>
                          <td class="input-group"><%= stockBean.getQty() %></td>
                        </tr>
                        <tr>
                          <td class="field">従業員名</td>
                          <td class="input-group"><%= stockBean.getEmployeeId() %></td>
                        </tr>
                        <tr>
                          <td class="field">登録日</td>
                          <td class="input-group"><%= stockBean.getDate() %></td>
                        </tr>
                    </table>

                    <div class="row my-3">
                        <div class="col-2 offset-4">
                            <a class="btn btn-primary"  href="FrontController?class_name=stock.StockFormUpdateAction&id=<%=stockBean.getId()%>" role="button">編集</a>
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
                  <td class="field">在庫ID</td>
                  <td class="input-group"><%= stockBean.getId() %></td>
                </tr>
                <tr>
                  <td class="field">品目名</td>
                  <td class="input-group"><%= stockBean.getName() %></td>
                </tr>
            </table>
            <div class="row">
                <div class="col-3 offset-3">
                    <a class="btn btn-primary" href="FrontController?class_name=stock.StockDeleteAction&id=<%=stockBean.getId()%>" role="button">削除</a>
                </div>
                <div class="col-3 offset-1">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
                </div>
            </div>
        <%@ include file="../ModalCloseTab.jsp" %>
        <%@ include file="../enhance.jsp" %>
    </body>
</html>
