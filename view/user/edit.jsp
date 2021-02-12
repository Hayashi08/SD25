<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="bean.UserBean" %>
<%

    UserBean userBean = (UserBean)request.getAttribute("userBean");

%>
<html lang="ja">
    <head>
        <meta charset="utf-8">
        <title>会員編集</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                   会員編集
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <div class="offset-3 p-3 sub_title">
                        各項目を入力してください
                    </div>
                    <table class="offset-3 col-6 table table-striped">
                        <tr>
                          <td class="field">会員ID</td>
                          <td class="input-group"><input type="text" class="form-control" id="id" maxlength="16" value="<%= userBean.getId() %>" readonly></td>
                        </tr>
                        <tr>
                          <td class="field">会員パスワード</td>
                          <td class="input-group"><input type="text" class="form-control" id="pass" maxlength="16" value="<%= userBean.getPass() %>" required></td>
                        </tr>
                        <tr>
                          <td class="field">名前</td>
                          <td class="input-group"><input type="text" class="form-control" id="name" maxlength="24" value="<%= userBean.getName() %>" required></td>
                        </tr>
                        <tr>
                          <td class="field">性別</td>
                          
                          <% String sex = userBean.getSex(); %> 
                          
                          <% if(sex.equals("男")){ %>                             
                           <td class="input-group">
                                  <div class="form-check">
                                      <input type="radio" class="form-check-input" id="sex" name="sex" value="男" checked>
                                      <label class="form-check-label"　for="male">男</label>
                                  </div>
                                  <div class="form-check ml-3">
                                      <input type="radio" class="form-check-input" id="sex" name="sex" value="女">
                                      <label class="form-check-label"　for="female">女</label>
                                  </div>
                                  
                              </td>
                                  	<% }else{ %>                        
                           <td class="input-group">
                                  <div class="form-check">
                                      <input type="radio" class="form-check-input" id="sex" name="sex" value="男">
                                      <label class="form-check-label"　for="male">男</label>
                                  </div>
                                  <div class="form-check ml-3">
                                      <input type="radio" class="form-check-input" id="sex" name="sex" value="女" checked>
                                      <label class="form-check-label"　for="female">女</label>
                                  </div>
                           </td>
                                  	<% } %>
                        </tr>
                        <tr>
                          <td class="field">生年月日</td>
                          <td class="input-group"><input type="date" class="form-control" id="birth" maxlength="8" value="<%= userBean.getBirth() %>" required></td>
                        </tr>
                        <tr>
                          <td class="field">メールアドレス</td>
                          <td class="input-group"><input type="text" class="form-control" id="mail" maxlength="32" value="<%= userBean.getMail() %>" required></td>
                        </tr>
                        <tr>
                          <td class="field">電話番号</td>
                          <td class="input-group"><input type="tel" class="form-control" id="tel" maxlength="13" value="<%= userBean.getTel() %>" required></td>
                        </tr>
                        <tr>
                          <td class="field">職業</td>
                          
                          
                   <form name="frm">  
                   
                         <% String job = userBean.getJob(); %> 
                         <% if(job.equals("未入力")){ %>                             
                                   <td class="input-group">
                                    <select id="job" size="1">
                                        <option value="未入力" selected>未入力
                                        <option value="学生">学生
                                        <option value="会社員">会社員
                                        <option value="主婦">主婦
                                        <option value="シニア">シニア
                                    </select>
                                 </td>
                       　　　　　　　　　　　　　　<% }else if(job.equals("学生")){ %>                        
                                   <td class="input-group">
                                    <select id="job" size="1">
                                        <option value="未入力">未入力
                                        <option value="学生" selected>学生
                                        <option value="会社員">会社員
                                        <option value="主婦">主婦
                                        <option value="シニア">シニア
                                    </select>
                                 </td>
                                 
                       　　　　　　　　　　　　　　<% }else if(job.equals("会社員")){ %>                        
                                   <td class="input-group">
                                    <select id="job" size="1">
                                        <option value="未入力">未入力
                                        <option value="学生">学生
                                        <option value="会社員" selected>会社員
                                        <option value="主婦">主婦
                                        <option value="シニア">シニア
                                    </select>
                                 </td>
                                 
                       　　　　　　　　　　　　　　<% }else if(job.equals("主婦")){ %>                        
                                   <td class="input-group">
                                    <select id="job" size="1">
                                        <option value="未入力">未入力
                                        <option value="学生">学生
                                        <option value="会社員">会社員
                                        <option value="主婦" selected>主婦
                                        <option value="シニア">シニア
                                    </select>
                                 </td>
                        <% }else{ %>                       
                                   <td class="input-group">
                                    <select id="job" size="1">
                                        <option value="未入力">未入力
                                        <option value="学生">学生
                                        <option value="会社員">会社員
                                        <option value="主婦">主婦
                                        <option value="シニア" selected>シニア
                                    </select>
                                 </td>
                        <% } %>
                        </tr>
                        
                        <tr>
                          <td class="field">信頼度</td>
                          <td class="input-group">
                                  <select id="credit" name="credit" size="1">
                                      <option value="1" >1
                                      <option value="2" >2
                                      <option value="3" >3
                                      <option value="4" >4
                                      <option value="5" >5
                                  </select></td>
                        </tr>
                        
					      <script language="JavaScript">
					          document.frm.credit.selectedIndex = <%= userBean.getCredit() %>-1;
					      </script>	
                        <tr>
                          <td class="field">ランク</td>
                          <td class="input-group">
                                  <select id="rank" name="rank" size="1">
                                      <option value="1" >1
                                      <option value="2" >2
                                      <option value="3" >3
                                      <option value="4" >4
                                      <option value="5">5
                                  </select></td>
                        </tr>
                        
					      <script language="JavaScript">
					          document.frm.rank.selectedIndex = <%= userBean.getRank() %>-1;
					      </script>	
      
        </form>
                        <tr>
                          <td class="field">登録日</td>
                          <td class="input-group"><input type="date" class="form-control" id="date" maxlength="8" value="<%= userBean.getDate() %>" required></td>
                        </tr>
                    </table>

                    <div class="row my-3">
                        <div class="col-2 offset-4">
                            <div class="btn btn-primary" id="btn" data-toggle="modal" data-target="#modal1">
                                更新する
                            </div>
                        </div>
                        <div class="col-2 offset-1">
                            <input type="reset" value="クリア" class="btn btn-primary" role="button">
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
                <input type="text" name="class_name" value="user.UpdateAction" hidden>
                <table class="offset-1 col-10 table table-striped">
                    <tr>
                      <td class="field">従業員ID</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_id" name="id" maxlength="3" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">会員パスワード</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_pass" name="pass" maxlength="16" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">氏名</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_name" name="name" maxlength="24" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">性別</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_sex" name="sex" maxlength="1" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">生年月日</td>
                      <td class="input-group"><input type="date" class="form-control" id="modal_birth" name="birth" maxlength="32" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">メールアドレス</td>
                      <td class="input-group"><input type="email" class="form-control" id="modal_mail" name="mail" maxlength="32" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">電話番号</td>
                      <td class="input-group"><input type="tel" class="form-control" id="modal_tel" name="tel" maxlength="13" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">職業</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_job" name="job" maxlength="16" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">信用度</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_credit" name="credit" maxlength="1" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">ランク</td>
                      <td class="input-group"><input type="text" class="form-control" id="modal_rank" name="rank" maxlength="1" readonly></td>
                    </tr>
                    <tr>
                      <td class="field">登録日</td>
                      <td class="input-group"><input type="date" class="form-control" id="modal_date" name="date" maxlength="8" readonly></td>
                    </tr>
                </table>
                <div class="row">
                    <div class="col-2 offset-3">
                        <input type="submit" class="btn btn-primary" value="更新" role="button">
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
                $('#modal_id').val($('#id').val());
                $('#modal_pass').val($('#pass').val());
                $('#modal_name').val($('#name').val());
                $('#modal_sex').val($('#sex:checked').val());
                $('#modal_birth').val($('#birth').val());
                $('#modal_mail').val($('#mail').val());
                $('#modal_tel').val($('#tel').val());
                $('#modal_job').val($('#job').val());
                $('#modal_credit').val($('#credit').val());
                $('#modal_rank').val($('#rank').val());
                $('#modal_date').val($('#date').val());
              });
            });
        </script>
    </body>
</html>
