<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>フロア登録</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 text-center main_title">
                    フロア登録
                </div>
                
                
         <form action="FrontController" method="POST">
         <input type="text" name="class_name" value="floor.SignupAction" hidden>
                

                <div class="offset-1 col-10 p-5 main">
                    <div class="offset-3 p-3 sub_title">
                        各項目を入力してください
                    </div>
                    <table class="offset-3 col-6 table table-striped">
                        <tr>
                          <td class="field">階</td>
                                 <td class="input-group">
                                    <select name="floor" size="1">
                                        <option value="未入力" selected>未入力
                                        <option value="1">1
                                        <option value="2">2
                                        <option value="3">3
                                        <option value="4">4
                                        <option value="5">5
                                    </select>
                                 </td>
                        </tr>
                        <tr>
                          <td class="field">部屋番号</td>
                                 <td class="input-group">
                                    <select name="floor_number" size="1">
                                        <option value="未入力" selected>未入力
                                        <option value="1">1
                                        <option value="2">2
                                        <option value="3">3
                                        <option value="4">4
                                        <option value="5">5
                                        <option value="6">6
                                        <option value="7">7
                                        <option value="8">8
                                        <option value="9">9
                                        <option value="10">10
                                    </select>
                                 </td>
                        </tr>
                        <tr>
                          <td class="field">収容人数</td>
                          <td class="input-group"><input type="number" class="form-control" name="cap" maxlength="3"></td>
                        </tr>
                        <tr>
                          <td class="field">機材状況</td>
                          <td class="input-group"><input type="text" class="form-control" name="machine" maxlength="1"></td>
                        </tr>
                        <tr>
                          <td class="field">清掃状況</td>
                          <td class="input-group"><input type="text" class="form-control" name="state" maxlength="1"></td>
                        </tr>
                    </table>
                    


                        <div class="row my-3">
                            <div class="col-2 offset-4">
                                <input type="submit" class="btn btn-primary" value="登録" role="button">
                            </div>
                            <div class="col-2 offset-1">
                                <input type="reset" value="クリア" class="btn btn-primary" role="button">
                            </div>
                        </div>
                </div>
                
             </form>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="javascript:history.back();" role="button">戻る</a>
                </div>

            </div>
        </div>
    </body>
</html>
