<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.OrderUserBean" %>
<%

    ArrayList<OrderUserBean> order_userBeans = (ArrayList<OrderUserBean>)request.getAttribute("order_userBeans");
    String menu_id = request.getParameter("menu_id");
    String menu_name = request.getParameter("menu_name");
    String menu_qty = request.getParameter("menu_qty");
    int sum = 0;
    for (int i=0; i < order_userBeans.size(); i++) {
      sum += order_userBeans.get(i).getPrice()*order_userBeans.get(i).getQty();
    }

%>
<html lang="ja">
    <head>
        <title>トップページ画面</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
                <div class="main m-1">
                    <div class="row">
                        <div class="offset-1 title col-2">
                            まさる堂
                        </div>
                        <div class="offset-1 sub_title pt-4">
                            メニューボタンをタッチして注文してください
                        </div>
                    </div>
                </div>
            <div class="p-3 row">
                <div class="main p-1 offset-1 col-10">
                    <div class="text-center my-4 h3">
                        注文履歴
                    </div>
                    <div class="row">
                        <div class="col-8">
                            <% if (order_userBeans.size() == 0) { %>
                                <div class="h3 m-5 col text-center">
                                    検索結果はありませんでした
                                </div>
                            <% }else{ %>
                            <table class="offset-1 col-10 table table-striped">
                                <tr>
                                  <th class="field">商品名</th>
                                  <th class="field">商品金額</th>
                                  <th class="field">数量</th>
                                  <th class="field">注文状況</th>
                                </tr>
                                <% for (int i=0; i < order_userBeans.size(); i++) { %>
                                    <tr>
                                        <td><%= order_userBeans.get(i).getName() %></td>
                                        <td><%= order_userBeans.get(i).getPrice() %></td>
                                        <td><%= order_userBeans.get(i).getQty() %></td>
                                        <% if (order_userBeans.get(i).getDeploy() == null) { %>
                                        <td>注文中</td>
                                        <% } else { %>
                                        <td>提供済み</td>
                                        <% } %>
                                    </tr>
                                <% } %>
                            </table>
                            <% } %>
                        </div>
                        <div class="col-4">
                            <div class="row my-2">
                                <div class="h2">
                                    合計
                                </div>
                            </div>
                            <div class="row my-2">
                                <div class="offset-5 h3">
                                    <%= sum %>円
                                </div>
                            </div>
                            <div class="my-5 py-5"></div>
                            <div class="row my-2">
                                <a class="bg-info rounded p-3 text-white h1 offset-2" href="FrontController?class_name=order_user.FloorSignupAction" role="button">トップ</a>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
        </div>
        <%@ include file="../enhance.jsp" %>
    </body>
</html>
