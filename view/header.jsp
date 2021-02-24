<%@ page contentType="text/html;charset=UTF-8" %>
<link rel="stylesheet" href="../static/css/haikei.css">


<div class="float">
    <table class=" table table-active">
     <tr>
      <th class="table-primary" width="50">ID</th>
      <td class="table-light" width="90"><%= session.getAttribute("id") %></td>
     </tr>
     <tr>
      <th class="table-danger" width="50">NAME</th>
      <td class="table-light" width="90"><%= session.getAttribute("name") %></td>
     </tr>
    </table>
</div>   
    <div class="offset-1 main_title1">
        	&#9834; まさる堂 &#9834;
    </div>

<div class="row mt-3 mx-4">
    <a class="col-1 p-1 btn btn-flat" href="FrontController?class_name=situation.TopAction"><span>トップ</span></a>
    <a class="col-1 p-1 btn btn-flat1" href="FrontController?class_name=user.TopAction"><span>会員管理</span></a>
    <a class="col-1 p-1 btn btn-flat2" href="FrontController?class_name=floor.TopAction"><span>フロア管理</span></a>
    <a class="col-1 p-1 btn btn-flat3" href="FrontController?class_name=stock.TopAction"><span>在庫管理</span></a>
    <a class="col-1 p-1 btn btn-flat4" href="FrontController?class_name=order.TopAction"><span>注文管理</span></a>
    <a class="col-1 p-1 btn btn-flat5" href="FrontController?class_name=analyse.TopAction"><span>売上分析</span></a>
    <a class="col-1 p-1 btn btn-flat6" href="FrontController?class_name=employee.TopAction"><span>従業員管理</span></a>
<!-- <a class="col-1 p-1 menu_title" href="FrontController?class_name=service.TopAction">会員サービス</a> -->
    <a class="col-1 p-1 btn btn-flat7" href="FrontController?class_name=login.ConfirmLogoutAction"><span>ログアウト</span></a>
        
</div>
