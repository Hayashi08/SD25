<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>注文登録</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 mx-3 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    注文登録
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <div class="offset-3 p-3 sub_title">
                        各項目を入力してください
                    </div>
                    
                    
                    <table class="offset-3 col-6 table table-striped">
                        <tr>
                          <th class="field">部屋ID</th>
                          <th class="field">利用ID</th>
                          <th class="field">注文時間</th>
                        </tr>
                        <tr>
                          <td><input type="text" id="floor_id" class="form-control" maxlength="3" required></td>
                          <td><input type="number" id="situation_id" class="form-control" min="0" required></td>
                          <td><input type="time" id="task_time" class="form-control" required></td>
                        </tr>
                    </table>
                    <br>
                    <table class="offset-4 col-4 table table-striped">
                        <tr>
                          <th class="field">メニューID</th>
                          <th class="field">数量</th>
                        </tr>
                        <tr>
                          <td><input type="number" id="menu_id" class="form-control" min="0" required></td>
                          <td><input type="number" id="task_qty" class="form-control" min="0" required></td>
                        </tr>
                    </table>

                    <div class="row my-3">
                        <div class="col-2 offset-3">
                            <div class="btn btn-primary" id="btn" data-toggle="modal" data-target="#modal1">
                                	登録する
                            </div>
						</div>
                        <div class="col-2 offset-2">
                        	<input type="reset" class="form-control  btn-primary">
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
                        <input type="text" name="class_name" value="order.TyuumonnzyoukyouSignupAction" hidden>
                    
                    <table class="col-12 table table-striped">
                        <tr>
                          <th class="field">部屋ID</th>
                          <th class="field">利用ID</th>
                          <th class="field">注文時間</th>
                        </tr>
                        <tr>
                          <td><input type="text" id="modal_floor_id" name="floor_id" class="form-control" maxlength="3" required></td>
                          <td><input type="number" id="modal_situation_id" name="situation_id" class="form-control" min="0" required></td>
                          <td><input type="time" id="modal_task_time" name="task_time" class="form-control" required></td>
                        </tr>
                    </table>
                    <br>
                    <table class="offset-3 col-6 table table-striped">
                        <tr>
                          <th class="field">メニューID</th>
                          <th class="field">数量</th>
                        </tr>
                        <tr>
                          <td><input type="number" id="modal_menu_id" name="menu_id" class="form-control" min="0" required></td>
                          <td><input type="number" id="modal_task_qty" name="task_qty" class="form-control" min="0" required></td>
                        </tr>
                    </table>

                    <div class="row my-3">
                        <div class="col-2 offset-2">
                            <input type="submit" class="btn btn-primary" value="登録" role="button">
						</div>
                        <div class="col-3 offset-3">
                        	<button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
                        </div>
                    </div>
                    
                    </form>
        
        
        <%@ include file="../ModalCloseTab.jsp" %>
        <%@ include file="../enhance.jsp" %>
        <script type="text/javascript">
            $(function () {
              $('#btn').click(function() {
                $('#modal_floor_id').val($('#floor_id').val());
                $('#modal_situation_id').val($('#situation_id').val());
                $('#modal_task_time').val($('#task_time').val());
                $('#modal_menu_id').val($('#menu_id').val());
                $('#modal_task_qty').val($('#task_qty').val());
              });
            });
        </script>
        
    </body>
</html>
