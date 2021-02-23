<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.StockBean" %>
<%@ page import="bean.ItemBean" %>
<%

    ArrayList<StockBean> stockBeans = (ArrayList<StockBean>)request.getAttribute("stockBeans");
        ArrayList<ItemBean> itemBeans = (ArrayList<ItemBean>)request.getAttribute("itemBeans");
    String keyword = (String)request.getAttribute("keyword");
    for(int i  = 0 ; i < itemBeans.size() ; i++){
        System.out.println(itemBeans.get(i).getName());
    }
    for(int i  = 0 ; i < stockBeans.size() ; i++){
        System.out.println(stockBeans.get(i).getName());
    }

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
                        <input type="text" name="class_name" value="stock.StockSearchAction" hidden>
                    
                        <div class="row">
                            <div class="offset-3 sub_title">
                                在庫検索
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="input-group offset-3 col-6">
                                <input type="serch" name="keyword" class="form-control" maxlength="16" required>
                                <div class="input-group-append">
                                    <input type="submit" class="btn btn-primary" value="検索" role="button">
                                </div>
                            </div>
                        </div>
                    
                    </form>

                    <% if (itemBeans.size() == 0) { %>
                        <div class="h3 m-5 col text-center">
                            検索結果はありませんでした
                        </div>
                    <% }else{ %>
                    <table class="offset-1 col-10 table table-striped">
                        <tr>
                          <th class="field">品目名</th>
                          <th class="field">在庫量</th>
                          <th class="field">詳細</th>
                          <th class="field">消費個数</th>
                        </tr>
                        <% 
                        int j = 0;
                        for (int i=0; i < itemBeans.size(); i++) { 
                        System.out.println(i);
                        System.out.println(j);
                        %>
                            <tr>
                                <td><%= itemBeans.get(i).getName() %></td>
                                <%
                                String item_name_item = itemBeans.get(i).getName();

                                String item_name_stock = "";
                                if(stockBeans.size() != 0){
                                    item_name_stock = stockBeans.get(j).getName();
                                }

                                %>
                                <% if(item_name_item.equals(item_name_stock)){ %>
                                    <td><%= stockBeans.get(j).getQty() %></td>
                                <%  }else{ %>
                                    <td>0</td>
                                <% } %>
                                <td>
                                    <% if(item_name_item.equals(item_name_stock)){ %>
                                    <a class="btn btn-primary" href="FrontController?class_name=stock.StockDetailAction&id=<%=stockBeans.get(j).getId()%>" role="button">詳細</a></td>
                                    <% } %>
                                <td>
                                <% if(item_name_item.equals(item_name_stock)){ %>
                                    <div class="row">
                                        <input type="number" id="qty<%= j %>" min="0" max="<%= stockBeans.get(j).getQty() %>" class="form-control col-3" >
                                        <input type="hidden" id="name<%= j %>" value="<%= stockBeans.get(j).getName() %>">
                                        <input type="hidden" id="genre<%= j %>" value="<%= stockBeans.get(j).getGenre() %>">
                                        <div class="btn btn-primary" id="btn<%= j %>" data-toggle="modal" data-target="#modal1">
                                         登録
                                        </div>
                                    </div>
                                <% 
                                    if(stockBeans.size() > j+1){
                                    j++;
                                    }
                                } 
                                %>
                                </td>
                            </tr>
                        <% } %>
                    </table>
                    <% } %>
                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="FrontController?class_name=stock.TopAction" role="button">トップページへ</a>
                </div>

            </div>
        </div>

    </body>

        <%@ include file="../ModalOpenTab.jsp" %>

                    <form action="FrontController" method="POST">
                        <input type="text" name="class_name" value="stock.StockSignupConsumptionAction" hidden>
                        <input type="number" id= "modal_qty_send" name="qty" hidden>
                        <input type="text" id="modal_genre" name="genre" hidden>
                        <input type="text" name="keyword" value="<%= keyword %>" hidden>
                    
                    <table class="offset-1 col-10 table table-striped">
                        <tr>
                          <td class="field">品目名</td>
                          <td class="input-group">
                            <input id="modal_name"　type="text" class="form-control" name="item_name" readonly>
                          </td>
                        </tr>
                        <tr>
                          <td class="field">使用個数</td>
                          <td class="input-group">
                            <input id="modal_qty" type="number" class="form-control" readonly>
                          </td>
                        </tr>
                    </table>

                    <div class="row my-3">
                        <div class="col-2 offset-4">
                                <input type="submit" class="btn btn-primary" value="登録" role="button">
                        </div>
                        <div class="col-3 offset-1">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
                        </div>
                    </div>
                    
                    </form>

    <%@ include file="../ModalCloseTab.jsp" %>
    <%@ include file="../enhance.jsp" %>
    <script type="text/javascript">

            $(function () {

            <% for (int i=0; i < stockBeans.size(); i++) { %>
              $('#btn<%= i %>').click(function() {
                $('#modal_genre').val($('#genre<%=i%>').val());
                $('#modal_name').val($('#name<%=i%>').val());
                var qty = document.getElementById("qty<%= i %>").value;
                qty = qty * (-1);
                $('#modal_qty_send').qty;
                $('#modal_qty').val($('#qty<%=i%>').val());
                $('#modal_qty_send').val(qty);
              });
            <% } %>


            });
        </script>
</html>
