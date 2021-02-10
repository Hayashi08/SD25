<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.TaskBean" %>
<%

    ArrayList<TaskBean> taskBeans = (ArrayList<TaskBean>)request.getAttribute("TaskBeans");
    
%>
<html lang="ja">
    <head>
        <title>注文状況管理</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 main_title text-center">
                    未提供一覧
                </div>

                <div class="offset-1 col-10 p-5 main">
                
                    <form action="FrontController" method="POST">
                        <input type="text" name="class_name" value="order.TyuumonnzyoukyouSearchAction" hidden>
                    
                    <div class="row">
                        <div class="offset-3 sub_title">
                            未提供検索
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="input-group offset-3 col-6">
                            <input type="search" name="keyword" class="form-control" maxlength="16" placeholder="を入力してください" required>
                            <div class="input-group-append">
                                <input type="submit" class="btn btn-primary" value="検索" role="button">
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class=" p-3 sub_title">
                        検索結果
                    </div>
                    <table class="col-12 table table-striped">
                        <tr>
                          <th class="field">注文番号</th>
                          <th class="field">部屋ID</th>
                          <th class="field">利用ID</th>
                          <th class="field">注文内容</th>
                          <th class="field">数量</th>
                          <th class="field">注文時間</th>
                          <th class="field">調理完了時間</th>
                          <th class="field">性別</th>
                          <th class="field">年齢層</th>
                          <th class="field">注文状況変更</th>
                        </tr>
                        
                        <% for (int i=0; i < taskBeans.size(); i++) { %>
                        
                        <tr>
                          <td><%= taskBeans.get(i).getTask_id() %></td>
                          <td><%= taskBeans.get(i).getFloor_id() %></td>
                          <td><%= taskBeans.get(i).getSituation_id() %></td>
                          <td><%= taskBeans.get(i).getMenu_id() %></td>
                          <td><%= taskBeans.get(i).getTask_qty() %></td>
                          <td><%= taskBeans.get(i).getTask_time() %></td>
                          <td><%= taskBeans.get(i).getTask_deploy() %></td>
                          <td></td>
                          <td></td>
                          <td><a class="btn btn-primary" href="" role="button">提供完了</a></td>
                        </tr>
                        
                        <%}%>
                    </table>
                </div>
                    
                    
                </div>
                
                

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="FrontController?class_name=order.TopAction" role="button">注文管理トップページへ</a>
                </div>

            </div>
        </div>
    </body>
</html>
