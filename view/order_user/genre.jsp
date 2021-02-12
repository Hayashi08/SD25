<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.OrderUserBean" %>
<%

    ArrayList<OrderUserBean> order_userBeans = (ArrayList<OrderUserBean>)request.getAttribute("order_userBeans");
    String genre = request.getParameter("genre");
    // 全ページ数
    int all_page = (order_userBeans.size()/5);
    // 現在のページ
    int current_page = 0;
    if (request.getParameter("page") != null) {
        current_page = Integer.parseInt(request.getParameter("page"));
    }
    int flag = 0;

%>
<html lang="ja">
    <head>
        <title>オススメ画面</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3 row">
                <div class="main p-1 col-10">
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

                    <div class="col mt-3">
                      <div class="pagination offset-4">
                        <div class="page-item">
                            <% if (current_page == 0) { %>
                                <a class="page-link disabled">前のページ</a>
                            <% } else { %>
                                <a class="page-link" href="FrontController?class_name=order_user.GenreAction&genre=<%=genre%>&page=<%=current_page-1%>">前のページ</a>
                            <% } %>
                        </div>
                            <% for (int i=1; i<=all_page+1; i++) { %>
                                <% if (i == current_page+1) { %>
                                    <div class="page-item active">
                                      <a class="page-link"><%=i%><span class="sr-only">(current)</span></a>
                                    </div>
                                <% } else { %>
                                    <div class="page-item">
                                        <a class="page-link" href="FrontController?class_name=order_user.GenreAction&genre=<%=genre%>&page=<%=i-1%>"><%=i%></a>
                                    </div>
                                <% } %>
                            <% } %>
                        <div class="page-item">
                            <% if (current_page == all_page) { %>
                                <a class="page-link disabled">次のページ</a>
                            <% } else { %>
                                <a class="page-link" href="FrontController?class_name=order_user.GenreAction&genre=<%=genre%>&page=<%=current_page+1%>">次のページ</a>
                            <% } %>
                        </div>
                      </div>
                    </div>

                    <% if (order_userBeans.size() == 0) { %>
                        検索結果はありませんでした
                    <% }else{ %>

                        <!-- 1列目の商品名 -->
                        <% if (order_userBeans.size()-(current_page*5) <= 3) { %>

                            <% flag = 1; %>
                            <div class="row m-2">
                            <% for (int i=current_page*5; i<order_userBeans.size(); i++) { %>
                                <div class="sub_title col-4 text-center">
                                    <%= order_userBeans.get(i).getName() %>
                                </div>
                            <% } %>
                            </div>

                        <% } else { %>

                            <div class="row m-2">
                            <% for (int i=current_page*5; i<current_page*5+3; i++) { %>
                                <div class="sub_title col-4 text-center">
                                    <%= order_userBeans.get(i).getName() %>
                                </div>
                            <% } %>
                            </div>

                        <% }  %>

                        <!-- 1列目のサムネイル -->
                        <% if (flag == 1) { %>

                            <div class="row m-2">
                            <% for (int i=current_page*5; i<order_userBeans.size(); i++) { %>
                                <a class="col-4" href="FrontController?class_name=order_user.SelectAction&id=<%=order_userBeans.get(i).getId()%>">
                                    <img class="col-12" src="../static/images/<%=String.valueOf(order_userBeans.get(i).getId())%>.jpg">
                                </a>
                            <% } %>
                            </div>

                        <% } else { %>

                            <div class="row m-2">
                            <% for (int i=current_page*5; i<current_page*5+3; i++) { %>
                                <a class="col-4" href="FrontController?class_name=order_user.SelectAction&id=<%=order_userBeans.get(i).getId()%>">
                                    <img class="col-12" src="../static/images/<%=order_userBeans.get(i).getId()%>.jpg">
                                </a>
                            <% } %>
                            </div>

                        <% }  %>

                        <!-- 2列目の商品名 -->
                        <% if (flag == 1) { %>

                        <% } else if (order_userBeans.size()-(current_page*5) <= 5) { %>

                            <% flag = 2; %>
                            <div class="row m-2">
                            <% for (int i=current_page*5+3; i<order_userBeans.size(); i++) { %>
                                <div class="sub_title col-4 text-center">
                                    <%= order_userBeans.get(i).getName() %>
                                </div>
                            <% } %>
                            </div>

                        <% } else { %>

                            <div class="row m-2">
                            <% for (int i=current_page*5+3; i<current_page*5+5; i++) { %>
                                <div class="sub_title col-4 text-center">
                                    <%= order_userBeans.get(i).getName() %>
                                </div>
                            <% } %>
                            </div>

                        <% }  %>

                        <!-- 2列目のサムネ -->
                        <% if (flag == 1) { %>

                                <div class="col-4 text-center">
                                    <a class="btn-lg btn-info" href="">注文履歴</a>
                                </div>

                        <% } else if (order_userBeans.size()-(current_page*5) <= 5) { %>

                            <% flag = 2; %>
                            <div class="row m-2">
                            <% for (int i=current_page*5+3; i<order_userBeans.size(); i++) { %>
                                <a class="col-4" href="FrontController?class_name=order_user.SelectAction&id=<%=order_userBeans.get(i).getId()%>">
                                    <img class="col-12" src="../static/images/<%=order_userBeans.get(i).getId()%>.jpg">
                                </a>
                            <% } %>
                                <div class="col-4 mt-4 py-5 text-center">
                                    <a class="bg-info rounded p-4 text-white h1" href="">注文履歴</a>
                                </div>
                            </div>

                        <% } else { %>

                            <div class="row m-2">
                            <% for (int i=current_page*5+3; i<current_page*5+5; i++) { %>
                                <a class="col-4" href="FrontController?class_name=order_user.SelectAction&id=<%=order_userBeans.get(i).getId()%>">
                                    <img class="col-12" src="../static/images/<%=order_userBeans.get(i).getId()%>.jpg">
                                </a>
                            <% } %>
                                <div class="col-4 mt-4 py-5 text-center">
                                    <a class="bg-info rounded p-4 text-white h1" href="">注文履歴</a>
                                </div>
                            </div>

                        <% }  %>


                    <% } %>
                </div>
                <div class="col-2 p-1">
                    <div class="text-center mx-3">
                        <div class="field sub_title py-3">
                            注文リスト
                        </div>
                        <div class="sub py-3">
                            <div class="row py-2">
                                <div class="ml-2 mr-1">
                                    フライドポテト
                                </div>
                                <div class="mx-1 btn-sm btn-secondary">
                                    -
                                </div>
                                2
                                <div class="mx-1 btn-sm btn-secondary">
                                    +
                                </div>
                            </div>
                            <div class="row py-2">
                                <div class="mx-4">
                                    ビール
                                </div>
                                <div class="mx-3 row">
                                    <div class="mx-1 btn-sm btn-secondary">
                                        -
                                    </div>
                                    4
                                    <div class="mx-1 btn-sm btn-secondary">
                                        +
                                    </div>
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
        <%@ include file="../enhance.jsp" %>
    </body>
</html>
