<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="bean.OrderUserBean" %>
<%

    OrderUserBean order_userBean = (OrderUserBean)request.getAttribute("order_userBean");
    String allergyStr = order_userBean.getAllergy();
    String[] allergyList = allergyStr.split(",", 0);

%>
<html lang="ja">
    <head>
        <title><%= order_userBean.getName() %></title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3 row">
                <div class="main p-1 col-10">

                    <!-- ナビゲーション -->
                    <div class="row m-2">
                        <a class="mx-2" href="FrontController?class_name=order_user.FloorSignupAction">
                            <div class="btn btn-light">
                                トップ
                            </div>
                        </a>
                        <a class="mx-2" href="FrontController?class_name=order_user.GenreAction&genre=オススメ">
                            <div class="btn btn-light">
                                オススメ
                            </div>
                        </a>
                        <a class="mx-2" href="FrontController?class_name=order_user.GenreAction&genre=フード">
                            <div class="btn btn-light">
                                フード
                            </div>
                        </a>
                        <a class="mx-2" href="FrontController?class_name=order_user.GenreAction&genre=ドリンク">
                            <div class="btn btn-light">
                                ドリンク
                            </div>
                        </a>
                        <a class="mx-2" href="FrontController?class_name=order_user.GenreAction&genre=サイドメニュー">
                            <div class="btn btn-light">
                                サイドメニュー
                            </div>
                        </a>
                        <a class="mx-2" href="FrontController?class_name=order_user.GenreAction&genre=デザート">
                            <div class="btn btn-light">
                                デザート
                            </div>
                        </a>
                    </div>

                    <!-- メイン -->
                    <div class="row m-3">
                        <div class="h2 offset-2 col-6 text-center">
                            <%= order_userBean.getName() %>
                        </div>
                    </div>
                    <div class="row m-2">
                        <img class="offset-1 col-6" src="../static/images/<%= order_userBean.getId() %>.jpg">
                        <div class="col-5">
                            <div class="h5 m-3">
                                アレルギー
                            </div>
                            <div class="h4 text-center">
                                <% for (int i=0; i<allergyList.length; i++) { %>
                                    <% if (!(allergyList[i].equals(""))) { %>
                                        <div class="badge badge-warning">
                                            <%= allergyList[i] %>
                                        </div>
                                    <% } %>
                                <% } %>
                            </div>
                            <div class="h5 mx-3 mb-3 mt-5">
                                料金
                            </div>
                            <div class="h2 text-center">
                                <%= order_userBean.getPrice() %>円
                            </div>
                            <div class="h5 mx-3 mb-3 mt-5">
                                数量を選択して下さい
                            </div>
                            <div class="text-center h3">
                                <div class="row mt-4 text-center">
                                    <div class="offset-3 col-2 btn btn-secondary" id="minus">
                                        -
                                    </div>
                                    <div class="col-2 mt-2" id="qty">
                                        0
                                    </div>
                                    <div class="col-2 btn btn-secondary" id="plus">
                                        +
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row m-2">
                        <div class="offset-1 col-5 h5">
                            <%= order_userBean.getDes() %>
                        </div>
                    </div>
                </div>

                <!-- 注文リスト -->
                <div class="col-2 p-1">
                    <div class="text-center mx-3">
                        <div class="field sub_title py-3">
                            注文リスト
                        </div>
                        <div class="sub py-3">
                            <div class="row py-2">
                                <div class="d-none" id="list_name">
                                </div>
                                <div class="d-none" id="list_minus">
                                </div>
                                <div id="list_qty">
                                </div>
                                <div class="d-none" id="list_plus">
                                </div>
                            </div>
                            <div class="row py-5">
                            </div>
                            <div class="row py-5">
                            </div>
                            <div class="row py-5">
                            </div>
                            <div class="row py-3">
                            </div>
                            <div class="row py-3">
                            </div>
                            <div class="btn-lg btn-success" data-toggle="modal" data-target="#exampleModalCentered">
                                注文する
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="modal fade" id="exampleModalCentered" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenteredLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenteredLabel">この内容で注文しますか?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="row">
                    <div class="offset-1 col-6 text-center">
                        フライドポテト
                    </div>
                    <div class="col-2 text-center">
                        ×2
                    </div>
                    <div class="col-2 text-center">
                        700円
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="offset-1 col-6 text-center">
                        ビール
                    </div>
                    <div class="col-2 text-center">
                        ×4
                    </div>
                    <div class="col-2 text-center">
                        1600円
                    </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#modal1">注文する</button>
              </div>
            </div>
          </div>
        </div>

        <div class="modal fade" id="modal1" tabindex="-1"
      role="dialog" aria-labelledby="label1" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="label1">注文完了しました</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="text-center h4">
                    料理提供までお待ちください
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
              </div>
            </div>
          </div>
        </div>

        <!-- アラート -->
        <%@ include file="../ModalDisplayOpenTab.jsp" %>
            <div class="text-danger h3 text-center my-4">
                1品目につき最大10件までです。
            </div>
        <%@ include file="../ModalCloseTab.jsp" %>
        <%@ include file="../enhance.jsp" %>
    </body>
    <script>
        $(function () {

            // メニューIDを入れる配列
            var id = [];
            // メニュー名を入れる配列
            var name = [];
            // 数量を入れる配列
            var qty = [];

          $('#plus').click(function() {

            // 配列idに、対象のメニューidが存在しない場合
            if ($.inArray('<%= order_userBean.getId() %>', id) == -1) {

                //配列の最終列に登録
                id[id.length+1] = '<%= order_userBean.getId() %>';
                name[name.length+1] = '<%= order_userBean.getName() %>';
                qty[qty.length+1] = 1;
                document.getElementById("qty").innerHTML = 1;
                $('#list_name').removeClass('d-none');
                $('#list_minus').removeClass('d-none');
                $('#list_plus').removeClass('d-none');
                $('#list_name').addClass('ml-2 mr-1');
                $('#list_minus').addClass('mx-1 btn-sm btn-secondary');
                $('#list_plus').addClass('mx-1 btn-sm btn-secondary');
                document.getElementById("list_qty").innerHTML = 1;
                document.getElementById("list_name").innerHTML = '<%= order_userBean.getName() %>';

            // 配列idに、対象のメニューidが存在する場合
            } else if (qty[$.inArray('<%= order_userBean.getId() %>', id)] <= 9) {

                //対象のメニューidをもつ配列qtyの値を変更
                qty[$.inArray('<%= order_userBean.getId() %>', id)] += 1;
                document.getElementById("qty").innerHTML = qty[$.inArray('<%= order_userBean.getId() %>', id)];
                document.getElementById("list_qty").innerHTML = qty[$.inArray('<%= order_userBean.getId() %>', id)];

            // 数量が10件を超えた場合
            } else {

                $('#modal_display').modal('show');

            }

          });

          $('#minus').click(function() {

            // 配列idに、対象のメニューidが存在しない場合
            if ($.inArray('<%= order_userBean.getId() %>', id) == -1) {

            // 配列idに、対象のメニューidが存在する場合
            } else if (qty[$.inArray('<%= order_userBean.getId() %>', id)] > 1) {

                //対象のメニューidをもつ配列qtyの値を変更
                qty[$.inArray('<%= order_userBean.getId() %>', id)] += -1;
                document.getElementById("qty").innerHTML = qty[$.inArray('<%= order_userBean.getId() %>', id)];
                document.getElementById("list_qty").innerHTML = qty[$.inArray('<%= order_userBean.getId() %>', id)];
                console.log("1")
            //　数量が0件になった場合
            } else if (qty[$.inArray('<%= order_userBean.getId() %>', id)] == 1){
                console.log("2")
                id.pop();
                name.pop();
                qty.pop();
                document.getElementById("qty").innerHTML = 0;
                document.getElementById("list_qty").innerHTML = "";
                $('#list_name').addClass('d-none');
                $('#list_minus').addClass('d-none');
                $('#list_plus').addClass('d-none');
            }

          });


        });
    </script>
</html>
