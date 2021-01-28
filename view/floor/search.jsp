<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>フロア検索</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 main_title text-center">
                    検索結果
                </div>

                <div class="offset-1 col-10 p-5 main">
                    <div class="row">
                        <div class="offset-3 sub_title">
                            フロア検索
                        </div>
                        <div class="offset-5 mt-3 col-5">
                            <input type="text" class="form-control" value="清掃済み">
                        </div>
                    </div>
                    <div class="row my-3">
                        <div class="col-2 offset-4">
                            <a class="btn btn-primary"  href="search.html" role="button">検索</a>
                        </div>
                        <div class="col-2 offset-1">
                            <a class="btn btn-primary" href="top.html" role="button">クリア</a>
                        </div>
                    </div>
                    <div class="row mt-5">
                        <div class="offset-3 sub_title">
                            ソート条件
                        </div>
                    </div>
                    <div class="row">
                        <div class="offset-5 mt-3">
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle"
                                      type="button" id="dropdownMenu1" data-toggle="dropdown"
                                      aria-haspopup="true" aria-expanded="false">
                                    ソート条件
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                    <a class="dropdown-item" href="#!">部屋番号</a>
                                    <a class="dropdown-item" href="#!">収容人数</a>
                                    <a class="dropdown-item" href="#!">機材状況</a>
                                    <a class="dropdown-item" href="#!">清掃状況</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="offset-3 p-3 sub_title">
                        検索結果
                    </div>
                    <table class="offset-3 col-6 table table-striped">
                        <tr>
                          <th class="field">部屋番号</th>
                          <th class="field">清掃状況</th>
                          <th class="field">詳細</th>
                        </tr>
                        <tr>
                          <td>101</td>
                          <td>清掃済み</td>
                          <td><a class="btn btn-primary" href="detail.html" role="button">詳細</a></td>
                        </tr>
                        <tr>
                          <td>202</td>
                          <td>清掃済み</td>
                          <td><a class="btn btn-primary" href="detail.html" role="button">詳細</a></td>
                        </tr>
                        <tr>
                          <td>205</td>
                          <td>清掃済み</td>
                          <td><a class="btn btn-primary" href="detail.html" role="button">詳細</a></td>
                        </tr>
                    </table>
                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="FrontController?class_name=floor.TopAction" role="button">トップページへ</a>
                </div>

            </div>
        </div>
    </body>
</html>
