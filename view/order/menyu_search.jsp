<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.OrderBean" %>
<%

    ArrayList<OrderBean> orderBeans = (ArrayList<OrderBean>)request.getAttribute("OrderBeans");

        for (int i=0; i < orderBeans.size(); i++) {
	        System.out.println(orderBeans.get(i).getMenu_id());
    	}
%>


<html lang="ja">
    <head>
        <title>メニュー検索結果</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>
                <div class="offset-4 my-3 col-4 main_title text-center">
                    メニュー検索結果
                </div>

                <div class="offset-1 col-10 p-5 main">
                    
                <form action="FrontController" method="POST">
                        <input type="text" name="class_name" value="order.MenyuSearchAction" hidden>
                    
                        <div class="row">
                            <div class="offset-3 sub_title">
                                メニュー検索
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="input-group offset-3 col-6">
                                <input type="search" name="keyword" class="form-control" maxlength="16" placeholder="メニュー名を入力してください" required>
                                <div class="input-group-append">
                                    <input type="submit" class="btn btn-primary" value="検索" role="button">
                                </div>
                            </div>
                        </div>
                    
                    </form>	
                    <div class="offset-3 p-3 sub_title">
                        検索結果
                    </div>
                    <table class="offset-3 col-6 table table-striped">
                        <tr>
                          <th class="field">メニューID</th>
                          <th class="field">メニュー名</th>
                          <th class="field">詳細</th>
                        </tr>
                        <% System.out.println("bbb");%>
                        <% for (int i=0; i < orderBeans.size(); i++) { %>
                            <tr>
                                <td><%= orderBeans.get(i).getMenu_id() %></td>
                                <td><%= orderBeans.get(i).getMenu_name() %></td>
                                <td></td>
                            </tr>
                        <% } %>
                    </table>
                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="FrontController?class_name=order.TopAction" role="button">メニュー管理トップページへ戻る</a>
                </div>

            </div>
        </div>
    </body>
</html>
