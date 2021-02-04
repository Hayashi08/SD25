<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.ItemBean" %>
<%

    ArrayList<ItemBean> itemBeans = (ArrayList<ItemBean>)request.getAttribute("itemBeans");

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
                        <input type="text" name="class_name" value="stock.ItemSearchAction" hidden>
                    
                        <div class="row">
                            <div class="offset-3 sub_title">
                                品目検索
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
                    <table class="offset-3 col-6 table table-striped">
                        <tr>
                          <th class="field">品目ID</th>
                          <th class="field">品目名</th>
                          <th class="field">ジャンル</th>
                          <th class="field">詳細</th>
                        </tr>
                        <% for (int i=0; i < itemBeans.size(); i++) { %>
                            <tr>
                                <td><%= itemBeans.get(i).getId() %></td>
                                <td><%= itemBeans.get(i).getName() %></td>
                                <td><%= itemBeans.get(i).getGenre() %></td>
                                <td><a class="btn btn-primary" href="FrontController?class_name=stock.ItemDetailAction&id=<%=itemBeans.get(i).getId()%>" role="button">詳細</a></td>
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
</html>
