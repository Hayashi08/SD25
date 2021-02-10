<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.ItemBean" %>
<%

    ArrayList<ItemBean> itemBeans = (ArrayList<ItemBean>)request.getAttribute("itemBeans");
    String genre = (String)request.getAttribute("genre");
%>
<html lang="ja">
    <head>
        <title>在庫登録画面</title>
       <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    在庫登録
                </div>

                <div class="offset-1 col-10 p-4 main">
                    <div class="row">
                        <div class="offset-3 sub_title">
                            登録する品目のジャンルを選択してください
                        </div>
                    </div>
                    <form action="FrontController" method="POST">
                        <input type="text" name="class_name" value="stock.GenreSearchAction" hidden>
                        <div class="row my-3">
                            <div class="offset-3 col-6 text-center">
                                <select class="custom-select" name="genre" size="1">
                                    <option value="未入力" selected>未入力
                                    <option value="米・雑穀・シリアル">米・雑穀・シリアル
                                    <option value="麺類">麺類
                                    <option value="野菜">野菜
                                    <option value="水産物・水産加工品">水産物・水産加工品
                                    <option value="肉・肉加工品">肉・肉加工品
                                    <option value="卵・チーズ・乳製品">卵・チーズ・乳製品
                                    <option value="果物">果物
                                    <option value="調味料">調味料
                                    <option value="リキュール">リキュール
                                    <option value="ソフトドリンク">ソフトドリンク
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="offset-7">
                                <input type="submit" class="btn btn-primary" value="検索" role="button">
                            </div>
                        </div>
                    </form>

                    <% if (itemBeans.size() == 0) { %>
                        <div class="h3 m-5 col text-center">
                            検索結果はありませんでした
                        </div>
                    <% }else{ %>
                    <table class="col-12 table table-striped my-5">
                        <tr>
                          <th style="width:20%" class="field">品目名</th>
                          <th style="width:8%" class="field">在庫量</th>
                          <th style="width:8%" class="field">許容量</th>
                          <th style="width:8%" class="field">最低量</th>
                          <th style="width:14%" class="field">発注登録</th>
                          <th style="width:12%" class="field">定量発注</th>
                          <th style="width:10%" class="field">発注状況</th>
                          <th style="width:8%" class="field">発注量</th>
                          <th style="width:12%" class="field">在庫登録</th>
                        </tr>
                        <% for (int i=0; i < itemBeans.size(); i++) { %>
                            <tr>
                                <td><%= itemBeans.get(i).getName() %></td>
                                <td><%= itemBeans.get(i).getSumQty() %></td>
                                <td><%= itemBeans.get(i).getMax() %></td>
                                <td><%= itemBeans.get(i).getMin() %></td>
                                <td>
                                    <div class="row">
                                        <input id="id<%= i %>" value="<%= itemBeans.get(i).getId() %>" hidden>
                                        <input id="name<%= i %>" value="<%= itemBeans.get(i).getName() %>" hidden>
                                        <input type="number" min="1" max="<%= itemBeans.get(i).getMax() - itemBeans.get(i).getSumQty() - itemBeans.get(i).getOrderSumQty() %>" id="qty<%= i %>" class="form-control offset-1 col-6" required>
                                        <div class="btn btn-primary col-5" id="signup_btn<%=i%>">
                                            登録
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <% if (itemBeans.get(i).getSumQty() < itemBeans.get(i).getMin() & itemBeans.get(i).getOrderSumQty() < itemBeans.get(i).getMin()) {%>
                                        <input id="id_amount<%= i %>" value="<%= itemBeans.get(i).getId() %>" hidden>
                                        <input id="name_amount<%= i %>" value="<%= itemBeans.get(i).getName() %>" hidden>
                                        <input type="number" id="qty_amount<%= i %>" value="<%= itemBeans.get(i).getMax() - itemBeans.get(i).getMin() %>" hidden>
                                        <div class="btn btn-primary" id="amount_btn<%=i%>">
                                            定量発注
                                        </div>
                                    <% } %>
                                </td>
                                <td>
                                    <% if (itemBeans.get(i).getOrderState() == null) { %>
                                    未発注
                                    <% } else if (itemBeans.get(i).getOrderState().equals("1")) { %>
                                    発注中
                                    <% } else { %>
                                    取引済み
                                    <% } %>
                                </td>
                                <td>
                                    <% if (itemBeans.get(i).getOrderState() == null) { %>
                                    <% } else{ %>
                                    <%= itemBeans.get(i).getOrderSumQty() %>
                                    <% } %>
                                </td>
                                <td>
                                    <% if (itemBeans.get(i).getOrderState() == null) { %>
                                    <% } else{ %>
                                        <input id="id_ordering<%= i %>" value="<%= itemBeans.get(i).getId() %>" hidden>
                                        <input id="name_ordering<%= i %>" value="<%= itemBeans.get(i).getName() %>" hidden>
                                        <input type="number" id="qty_ordering<%= i %>" value="<%= itemBeans.get(i).getMax() - itemBeans.get(i).getMin() %>" hidden>
                                        <div class="btn btn-primary" id="ordering_btn<%=i%>">
                                            <%= itemBeans.get(i).getOrderDate().substring(5) %>日分
                                        </div>
                                    <% } %>
                                </td>
                            </tr>
                        <% } %>
                    </table>
                    <% } %>

                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="FrontController?class_name=stock.TopAction" role="button">在庫管理トップ</a>
                </div>

            </div>
        </div>
    </body>
    <%@ include file="../ModalOpenTab.jsp" %>
          <form action="FrontController" method="POST">
            <input type="text" name="class_name" value="stock.OrderingSignupAction" hidden>
            <input type="text" id="modal_item_id" name="item_id" value="" hidden>
            <input type="text" name="genre" value="<%= genre %>" hidden>
            <table class="offset-1 col-10 table table-striped">
                <tr>
                  <td class="field">品目名</td>
                  <td class="input-group"><input type="text" class="form-control" id="modal_item_name" readonly></td>
                </tr>
                <tr>
                  <td class="field">発注量</td>
                  <td class="input-group"><input type="text" class="form-control" id="modal_qty" name="qty" readonly></td>
                </tr>
            </table>
            <div class="row">
                <div class="col-2 offset-3">
                    <input type="submit" class="btn btn-primary" value="登録" role="button">
                </div>
                <div class="col-3 offset-1">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
                </div>
            </div>
          </form>
    <%@ include file="../ModalCloseTab.jsp" %>
    <%@ include file="../ModalDisplayOpenTab.jsp" %>
          <form action="FrontController" method="POST">
            <input type="text" name="class_name" value="stock.StockSignupAction" hidden>
            <input type="text" id="modal_ordering_item_id" name="item_id" value="" hidden>
            <input type="text" name="genre" value="<%= genre %>" hidden>
            <table class="offset-1 col-10 table table-striped">
                <tr>
                  <td class="field">品目名</td>
                  <td class="input-group"><input type="text" class="form-control" id="modal_ordering_item_name" readonly></td>
                </tr>
                <tr>
                  <td class="field">発注量</td>
                  <td class="input-group"><input type="text" class="form-control" id="modal_ordering_qty" name="qty" readonly></td>
                </tr>
            </table>
            <div class="row">
                <div class="col-2 offset-3">
                    <input type="submit" class="btn btn-primary" value="登録" role="button">
                </div>
                <div class="col-3 offset-1">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
                </div>
            </div>
          </form>
    <%@ include file="../ModalCloseTab.jsp" %>
    <%@ include file="../enhance.jsp" %>
    <script>
        $(function () {
            <% for (int i=0; i < itemBeans.size(); i++) { %>
              $('#signup_btn<%=i%>').click(function() {
                $('#modal1').modal('show');
                $('#modal_qty').val($('#qty<%=i%>').val());
                $('#modal_item_id').val($('#id<%=i%>').val());
                $('#modal_item_name').val($('#name<%=i%>').val());
              });
              $('#amount_btn<%=i%>').click(function() {
                $('#modal1').modal('show');
                $('#modal_qty').val($('#qty_amount<%=i%>').val());
                $('#modal_item_id').val($('#id_amount<%=i%>').val());
                $('#modal_item_name').val($('#name_amount<%=i%>').val());
              });
              $('#ordering_btn<%=i%>').click(function() {
                $('#modal_display').modal('show');
                $('#modal_ordering_qty').val($('#qty_ordering<%=i%>').val());
                $('#modal_ordering_item_id').val($('#id_ordering<%=i%>').val());
                $('#modal_ordering_item_name').val($('#name_ordering<%=i%>').val());
              });
            <% } %>
        });
    </script>
</html>
