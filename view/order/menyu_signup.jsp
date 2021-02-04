<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>メニュー登録</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    メニュー登録
                </div>

                 <div class="offset-1 col-10 p-5 main">
                    <div class="offset-3 p-3 sub_title">
                        各項目を入力してください
                    </div>
                    
                    <form action="FrontController" method="POST">
                        <input type="text" name="class_name" value="order.MenyuSignupAction" hidden>
                    
                    <table class="offset-3 col-6 table table-striped">
                          <td class="field">メニュー名</td>
                          <td class="input-group">
                          	<input id="name" type="text" maxlength="30" name=name class="form-control required">
                          </td>
                        </tr>
                        <tr>
                          <td class="field">ジャンル</td>
                          <td class="input-group">
                          	<input id="genre" type="text" name=genre class="form-control" required>
                          </td>
                        </tr>
                        <tr>
                          <td class="field">値段</td>
                          <td class="input-group">
                          	<input id="price" type="number" name="price" max="65535" min="0" class="form-control" required>
                          </td>
                        </tr>
                        <tr>
                          <td class="field">説明</td>
                          <td class="input-group">
                          	<textarea id="des" class="form-control"　 maxlength="500" name="des" required></textarea>
                          	</td>
                        </tr>
                        <tr>
                          <td class="field">アレルギー</td>
                          <td class="input-group">
                          <div class="custom-control custom-checkbox">
                          	<div class="row">
                          	<div class="col">
                            	<input id="customCheck1" type="checkbox" class="custom-control-input" id="customCheck1" value="卵"　name="allergy">
                            	<label class="custom-control-label" for="customCheck1">卵</label>
                            </div>
                            </div>
                            
                            <div class="row">
                          	<div class="col">
                            <input type="checkbox" class="custom-control-input" id="customCheck2" 　value="乳"　name="allergy">
                            <label class="custom-control-label" for="customCheck2">乳</label>	
                            </div>
                            </div>
                            
                            <div class="row">
                          	<div class="col">
                            <input type="checkbox" class="custom-control-input" id="customCheck3" value="小麦"  name="allergy">
                            <label class="custom-control-label" for="customCheck3">小麦</label>	
                            </div>
                            </div>
                            
                            <div class="row">
                          	<div class="col">
                            <input type="checkbox" class="custom-control-input" id="customCheck4" value="そば" name="allergy">
                            <label class="custom-control-label" for="customCheck4">そば</label>	
                            </div>
                            </div>
                            
                            <div class="row">
                          	<div class="col">
                            <input type="checkbox" class="custom-control-input" id="customCheck5" value="落花生(ピーナッツ)" name="allergy">
                            <label class="custom-control-label" for="customCheck5">落花生(ピーナッツ)</label>	
                            </div>
                            </div>
                            
                            <div class="row">
                          	<div class="col">
                            <input type="checkbox" class="custom-control-input" id="customCheck6" value="えび" name="allergy">
                            <label class="custom-control-label" for="customCheck6">えび</label>	
                            </div>
                            </div>
                            
                            <div class="row">
                          	<div class="col">
                            <input type="checkbox" class="custom-control-input" id="customCheck7" value="かに"  name="allergy">
                            <label class="custom-control-label" for="customCheck7">かに</label>	
                            </div>
                            </div>
                          </div>
                          </td>
                        </tr>
                    </table>

                    <div class="row my-3">
                        <div class="col-2 offset-4">
                        
                            <div class="btn btn-primary" id="btn" data-toggle="modal" data-target="#modal1">
                                	登録する
                            </div>
						</div>
                        <div class="col-2 offset-1">
                            <input type="reset" class="btn btn-primary">
                        </div>
                    </div>
                    
                    </form>
                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="javascript:history.back();" role="button">戻る</a>
                </div>

            </div>
        </div>
        
        
        <%@ include file="../ModalOpenTab.jsp" %>

                    <form action="FrontController" method="POST">
                        <input type="text" name="class_name" value="order.MenyuSignupAction" hidden>
                    
                    <table class="offset-3 col-6 table table-striped">
                        <tr>
                          <td class="field">メニュー名</td>
                          <td class="input-group">
                          	<input id="modal_name"　type="text" maxlength="30" name="name" class="form-control"></td>
                        </tr>
                        <tr>
                          <td class="field">ジャンル</td>
                          <td class="input-group">
                          	<input id="modal_genre" type="text" name=genre class="form-control">
                          </td>
                        </tr>
                        <tr>
                          <td class="field">値段</td>
                          <td class="input-group">
                          	<input id="modal_price" type="number" name="price" max="65535" min="0" class="form-control">
                          </td>
                        </tr>
                        <tr>
                          <td class="field">説明</td>
                          <td class="input-group">
                          	<textarea id="modal_des" class="form-control"　 maxlength="500" name="des"></textarea>
                          	</td>
                        </tr>
                        <tr>
                          <td class="field">アレルギー</td>
                          <td class="input-group">
	                            	<input type="text" class="custom-control-input" id="modal_customCheck" name="allergy">
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
              $('#btn').click(function() {
                $('#modal_name').val($('#name').val());
                $('#modal_genre').val($('#genre').val());
                $('#modal_price').val($('#price').val());
                $('#modal_des').val($('#des').val());
                $('#modal_customCheck').val($('#customCheck1').val()+','+
                							$('#customCheck2').val()+','+
                							$('#customCheck3').val()+','+
                							$('#customCheck4').val()+','+
                							$('#customCheck5').val()+','+
                							$('#customCheck6').val()+','+
                							$('#customCheck7').val()
                							);
              });
            });
        </script>
    </body>
</html>
