<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.OrderBean" %>
<% 
        OrderBean orderBean = (OrderBean)request.getAttribute("orderBean");
%>

<html lang="ja">
    <head>
        <title>メニュー詳細</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 mx-3 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    メニュー詳細
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <table class="offset-3 col-6 table table-striped">
                        <tr>
                          <td class="field">メニューID</td>
                          <td class="input-group"><%=orderBean.getMenu_id()%></td>
                        </tr>
                        <tr>
                          <td class="field">メニュー名</td>
                          <td class="input-group"><%=orderBean.getMenu_name()%></td>
                        </tr>
                        <tr>
                          <td class="field">ジャンル</td>
                          <td class="input-group"><%=orderBean.getMenu_genre()%></td>
                        </tr>
                        <tr>
                          <td class="field">値段</td>
                          <td class="input-group"><%=orderBean.getMenu_price()%></td>
                        </tr>
                        <tr>
                          <td class="field">登録日</td>
                          <td class="input-group"><%=orderBean.getMenu_create()%></td>
                        </tr>
                        <tr>
                          <td class="field">更新日</td>
                          <td class="input-group"><%=orderBean.getMenu_update()%></td>
                        </tr>
                        <tr>
                          <td class="field">説明</td>
                          <td class="input-group"><%=orderBean.getMenu_des()%></td>
                        </tr>
                        <tr>
                          <td class="field">アレルギー</td>
                          <td class="input-group"><%=orderBean.getMenu_allergy()%></td>
                        </tr>
                    </table>

                    <div class="row my-3">
                        <div class="col-2 offset-4">
                            <a class="btn btn-primary"  href="FrontController?class_name=order.FormMenyuUpdateAction&id=<%=orderBean.getMenu_id()%>" role="button">
                            	編集
                            </a>
                        </div>
                        <div class="col-2 offset-1">
                            <div class="btn btn-primary" id="btn" data-toggle="modal" data-target="#modal1">
                                	削除
                            </div>
						</div>
                    </div>
                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="javascript:history.back();" role="button">戻る</a>
                </div>

            </div>
        </div>
        
        
        
        <%@ include file="../ModalOpenTab.jsp" %>

                    <form action="FrontController" method="POST">
                        <input type="text" name="class_name" value="order.MenyuDeleteAction" hidden>
                    
            <table class="offset-1 col-10 table table-striped">
                <tr>
                  <td class="field">メニューID</td>
                  <td class="input-group"><%= orderBean.getMenu_id() %></td>
                </tr>
                <tr>
                  <td class="field">メニュー名</td>
                  <td class="input-group"><%= orderBean.getMenu_name() %></td>
                </tr>
            </table>
            <div class="row">
                <div class="col-3 offset-3">
                    <a class="btn btn-primary" href="FrontController?class_name=order.MenyuDeleteAction&id=<%=orderBean.getMenu_id()%>" role="button">削除</a>
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
              $('#btn').click(function() {
                $('#modal_name').val($('#name').val());
                $('#modal_genre').val($('#genre').val());
              });
            });
        </script>
        
    </body>
</html>
