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
                
                    <div class="row">
                        <div class="offset-3 sub_title">
                            未提供検索
                        </div>
                    </div>
                    
                    <form action="FrontController" method="POST">
                    	
                        <input type="text" name="class_name" value="order.MiteikyouSearchAction" hidden>
                    
	                    <div class="row mt-4">
	                        <div class="input-group offset-3 col-6">
	                            <input type="search" name="keyword" class="form-control" maxlength="16" placeholder="注文番号を入力してください" required>
	                            <div class="input-group-append">
	                                <input type="submit" class="btn btn-primary" value="検索" role="button">
	                            </div>
	                        </div>
	                    </div>
                    </form>
                    
                    
                    <div class=" p-3 sub_title">
                        検索結果
                    </div>
		            <form action="FrontController" method="POST">
                    <table class="col-12 table table-striped">
                        <tr>
                          <th class="field text-center">注文番号</th>
                          <th class="field text-center">部屋ID</th>
                          <th class="field text-center">利用ID</th>
                          <th class="field text-center">注文内容</th>
                          <th class="field text-center">数量</th>
                          <th class="field text-center">注文時間</th>
                          <th class="field text-center">調理完了時間</th>
                          <th class="field text-center">性別</th>
                          <th class="field text-center">年齢層</th>
                          <th class="field text-center">注文状況変更</th>
                        </tr>
                        
                        <% for (int i=0; i < taskBeans.size(); i++) { %>
                        
                        <tr>
                          <td class="text-center"><%= taskBeans.get(i).getTask_id() %></td>
                          <td class="text-center"><%= taskBeans.get(i).getFloor_id() %></td>
                          <td class="text-center"><%= taskBeans.get(i).getSituation_id() %></td>
                          <td class="text-center"><%= taskBeans.get(i).getMenu_id() %></td>
                          <td class="text-center"><%= taskBeans.get(i).getTask_qty() %></td>
                          <td class="text-center"><%= taskBeans.get(i).getTask_time() %></td>
                          <td class="text-center"><%= taskBeans.get(i).getTask_deploy() %></td>
                          
                          <td class="input-group">
                            <div class="form-check">
                                <input type="radio" class="form-check-input" name="sex<%= i %>" value="男" checked>
                                <label class="form-check-label" for="male">男</label>
                            </div>
                            <div class="form-check ml-3">
                                <input type="radio" class="form-check-input" name="sex<%= i %>" value="女">
                                <label class="form-check-label" for="female">女</label>
                            </div>
                              <input type="text" name="i" value="<%= i %>" hidden>
                          </td>
                          
                          <td>
                            <select name="age" size="1">
                                <option value="未入力" selected>未入力
                                <option value="子ども">子ども
                                <option value="10代">10代
                                <option value="20代">20代
                                <option value="30代">30代
                                <option value="40代">40代
                                <option value="50代">50代
                                <option value="シニア">シニア
                            </select>
                          </td>
							
                          <td>
		                    	
		                        <input type="text" name="class_name" value="order.TaskCompleteAction" hidden>
		                    
		                        <input type="text" name="task_stn" value="complete" hidden>
                            <input type="text" name="task_id" value="<%= taskBeans.get(i).getTask_id() %>" hidden>
                            <input type="text" name="floor_id" value="<%= taskBeans.get(i).getFloor_id() %>" hidden>
                            <input type="text" name="situation_id" value="<%= taskBeans.get(i).getSituation_id() %>" hidden>
                            <input type="text" name="menu_id" value="<%= taskBeans.get(i).getMenu_id() %>" hidden>
                            <input type="text" name="task_qty" value="<%= taskBeans.get(i).getTask_qty() %>" hidden>
	                                <input type="submit" class="btn btn-primary" value="提供完了" role="button">
		                    
                          </td>
                        </tr>
                        
                        <%}%>
                    </table>
                    </form>
                </div>
                    
                    
                </div>
                
                

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="FrontController?class_name=order.TopAction" role="button">注文管理トップページへ</a>
                </div>

            </div>
        </div>
    </body>
</html>
