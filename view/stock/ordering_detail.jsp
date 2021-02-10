<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="bean.OrderingBean" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%

    OrderingBean orderingBean = (OrderingBean)request.getAttribute("orderingBean");

%>
<html lang="ja">
    <head>
        <title>発注詳細</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                   発注詳細
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <table class="offset-3 col-6 table table-striped">
                        <tr>
                          <td class="field">発注ID</td>
                          <td class="input-group"><%= orderingBean.getId() %></td>
                        </tr>
                        <tr>
                          <td class="field">品目名</td>
                          <td class="input-group"><%= orderingBean.getName() %></td>
                        </tr>
                        <tr>
                          <td class="field">ジャンル</td>
                          <td class="input-group"><%= orderingBean.getGenre() %></td>
                        </tr>
                        <tr>
                          <td class="field">許容量</td>
                          <td class="input-group"><%= orderingBean.getMax() %></td>
                        </tr>
                        <tr>
                          <td class="field">最低量</td>
                          <td class="input-group"><%= orderingBean.getMin() %></td>
                        </tr>
                        <tr>
                          <td class="field">発注量</td>
                          <td class="input-group"><%= orderingBean.getQty() %></td>
                        </tr>
                        <tr>
                          <td class="field">発注状況</td>
                          <td class="input-group">
                              <% if (orderingBean.getState().equals("1")) { %>
                              発注中
                              <% } else if (orderingBean.getState() == null) { %>
                              未発注
                              <% } else { %>
                              取引済み
                              <% } %>
                          </td>
                        </tr>
                        <tr>
                          <td class="field">従業員名</td>
                          <td class="input-group"><%= orderingBean.getEmployeeName() %></td>
                        </tr>
                        <tr>
                          <td class="field">登録日</td>
                          <td class="input-group"><%= orderingBean.getDate() %></td>
                        </tr>
                    </table>

                    <% Calendar cal = Calendar.getInstance(); %>
                    <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); %>
                    <% if (String.valueOf(sdf.format(cal.getTime())).equals(orderingBean.getDate())) { %>
                    <div class="row my-3">
                        <div class="col-2 offset-4">
                            <a class="btn btn-primary"  href="FrontController?class_name=stock.OrderingFormUpdateAction&id=<%=orderingBean.getId()%>" role="button">編集</a>
                        </div>
                        <div class="btn btn-primary" id="btn" data-toggle="modal" data-target="#modal1">
                            削除
                        </div>
                    </div>
                    <% } %>
                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="javascript:history.back();" role="button">戻る</a>
                </div>

            </div>
        </div>
        <%@ include file="../ModalOpenTab.jsp" %>
            <table class="offset-1 col-10 table table-striped">
                <tr>
                  <td class="field">発注ID</td>
                  <td class="input-group"><%= orderingBean.getId() %></td>
                </tr>
                <tr>
                  <td class="field">品目名</td>
                  <td class="input-group"><%= orderingBean.getName() %></td>
                </tr>
            </table>
            <div class="row">
                <div class="col-3 offset-3">
                    <a class="btn btn-primary" href="FrontController?class_name=stock.OrderingDeleteAction&id=<%=orderingBean.getId()%>" role="button">削除</a>
                </div>
                <div class="col-3 offset-1">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
                </div>
            </div>
        <%@ include file="../ModalCloseTab.jsp" %>
        <%@ include file="../enhance.jsp" %>
    </body>
</html>
