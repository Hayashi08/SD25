<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.ItemBean" %>
<%

    ArrayList<ItemBean> itemBeans = (ArrayList<ItemBean>)request.getAttribute("itemBeans");

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
                          <th style="width:18%" class="field">品目名</th>
                          <th style="width:8%" class="field">在庫量</th>
                          <th style="width:8%" class="field">許容量</th>
                          <th style="width:8%" class="field">最低量</th>
                          <th style="width:15%" class="field">在庫登録</th>
                          <th style="width:15%" class="field">発注登録</th>
                          <th style="width:10%" class="field">定量発注</th>
                          <th style="width:10%" class="field">発注状況</th>
                          <th style="width:8%" class="field">発注量</th>
                        </tr>
                        <% for (int i=0; i < itemBeans.size(); i++) { %>
                            <tr>
                                <td><%= itemBeans.get(i).getName() %></td>
                                <td><%= itemBeans.get(i).getSumQty() %></td>
                                <td><%= itemBeans.get(i).getMax() %></td>
                                <td><%= itemBeans.get(i).getMin() %></td>
                                <td>
                                    <form action="FrontController" method="POST">
                                        <input type="text" name="class_name" value="stock.StockSignupAction" hidden>
                                        <input type="text" name="item_id" value="<%= itemBeans.get(i).getId() %>" hidden>
                                        <div class="row">
                                            <input type="number" name="qty" class="form-control offset-1 col-6" required>
                                            <input type="submit" class="btn btn-primary col-4" value="登録">
                                        </div>
                                    </form>
                                </td>
                                <td>
                                    <form action="FrontController" method="POST">
                                        <input type="text" name="class_name" value="stock.OrderingSignupAction" hidden>
                                        <input type="text" name="item_id" value="<%= itemBeans.get(i).getId() %>" hidden>
                                        <div class="row">
                                            <input type="number" name="qty" class="form-control offset-1 col-6" required>
                                            <input type="submit" class="btn btn-primary col-4" value="登録">
                                        </div>
                                    </form>
                                </td>
                                <td>
                                    <% if (itemBeans.get(i).getSumQty() < itemBeans.get(i).getMin()) {%>
                                        <% int amount = itemBeans.get(i).getMax() - itemBeans.get(i).getMin(); %>
                                        <form action="FrontController" method="POST">
                                            <input type="text" name="class_name" value="stock.OrderingSignupAction" hidden>
                                            <input type="text" name="item_id" value="<%= itemBeans.get(i).getId() %>" hidden>
                                            <input type="text" name="qty" value="<%= amount %>" hidden>
                                            <input type="submit" class="btn btn-primary" value="定量発注">
                                        </form>
                                    <% } %>
                                </td>
                                <td>
                                    <% if (itemBeans.get(i).getOrderState()) { %>
                                    発注中
                                    <% } else { %>
                                    未発注
                                    <% } %>
                                </td>
                                <td>
                                    <% if (itemBeans.get(i).getOrderState()) { %>
                                    <%= itemBeans.get(i).getOrderSumQty() %>
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
</html>
