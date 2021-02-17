<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>トップページ画面</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
                <div class="main m-1">
                    <div class="row">
                        <div class="offset-1 title col-2">
                            まさる堂
                        </div>
                        <div class="offset-1 sub_title pt-4">
                            メニューボタンをタッチして注文してください
                        </div>
                        <a href="#modal2" class="offset-3" data-toggle="modal" data-target="#modal2">
                            <i class="fas fa-user fa-3x"></i>
                        </a>
                    </div>
                </div>
            <div class="p-3 row">
                <div class="main p-1 col-10">
                    <div class="row m-2">
                        <div class="sub_title col-4 text-center">
                            オススメ
                        </div>
                        <div class="sub_title col-4 text-center">
                            フード
                        </div>
                        <div class="sub_title col-4 text-center">
                            ドリンク
                        </div>
                    </div>
                    <div class="row m-2">
                        <a class="col-4" href="FrontController?class_name=order_user.GenreAction&genre=オススメ"><img class="col-12" src="../static/images/recommend_thumbnail.jpg"></a>
                        <a class="col-4" href="FrontController?class_name=order_user.GenreAction&genre=フード"><img class="col-12" src="../static/images/food_thumbnail.jpg"></a>
                        <a class="col-4" href="FrontController?class_name=order_user.GenreAction&genre=ドリンク"><img class="col-12" src="../static/images/drink_thumbnail.jpg"></a>
                    </div>
                    <div class="row m-2">
                        <div class="sub_title col-4 text-center">
                            サイドメニュー
                        </div>
                        <div class="sub_title col-4 text-center">
                            デザート
                        </div>
                    </div>
                    <div class="row m-2">
                        <div class="col-8 row">
                            <a class="col-6" href="FrontController?class_name=order_user.GenreAction&genre=サイドメニュー"><img class="col-12" src="../static/images/side_thumbnail.jpg"></a>
                            <a class="col-6" href="FrontController?class_name=order_user.GenreAction&genre=デザート"><img class="col-12" src="../static/images/desert_thumbnail.jpg"></a>
                        </div>
                        <div class="col-4">
                            <div class="row">
                                <a href="archive.html" class="offset-2 col-8 p-3 mt-5 text-center btn-lg btn-info">
                                    注文履歴
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-2 p-1">
                    <div class="text-center mx-3">
                        <div class="field sub_title py-3">
                            注文リスト
                        </div>
                        <div class="sub py-3">
                            <div class="row py-2">
                                <div class="col-9">
                                    フライドポテト
                                </div>
                                <div class="col-3">
                                    ×2
                                </div>
                            </div>
                            <div class="row py-2">
                                <div class="col-9">
                                    ビール
                                </div>
                                <div class="col-3">
                                    ×4
                                </div>
                            </div>
                            <div class="row py-5">
                            </div>
                            <div class="row py-5">
                            </div>
                            <div class="row py-5">
                            </div>
                            <div class="btn-lg btn-success" data-toggle="modal" data-target="#modal1">
                                注文する
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 注文処理 -->
        <div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="modal1" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="modal1">この内容で注文しますか?</h5>
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
                <button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#modal_ans1">注文する</button>
              </div>
            </div>
          </div>
        </div>
        <div class="modal fade" id="modal_ans1" tabindex="-1"
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
        <!-- ログアウト処理 -->
        <div class="modal fade" id="modal2" tabindex="-1" role="dialog" aria-labelledby="modal2" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="modal2">ログイン</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="row my-5">
                    <div class="offset-2 col-3">
                        従業員ID
                    </div>
                    <div class="col-4">
                        <input type="text" placeholder="従業員ID">
                    </div>
                </div>
                <div class="row my-5">
                    <div class="offset-2 col-3">
                        パスワード
                    </div>
                    <div class="col-4">
                        <input type="password" placeholder="パスワード">
                    </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#modal_ans2">ログイン</button>
              </div>
            </div>
          </div>
        </div>
        <div class="modal fade" id="modal_ans2" tabindex="-1"
      role="dialog" aria-labelledby="level2" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="level2">部屋番号入力</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="row my-5">
                    <div class="offset-2 col-3">
                        部屋番号
                    </div>
                    <div class="col-4">
                        <input type="text" placeholder="101">
                    </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">確定</button>
              </div>
            </div>
          </div>
        </div>
        <%@ include file="../enhance.jsp" %>
    </body>
</html>