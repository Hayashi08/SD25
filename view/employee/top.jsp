<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>従業員管理トップページ</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col-12 p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="offset-4 my-3 col-4 main_title">
                    従業員管理トップページ
                </div>


                <div class="offset-1 col-10 p-5 main">
                    <div class="row">
                      <div class="col-2 offset-3">
                          <a class="btn btn-primary"  href="FrontController?class_name=employee.EmployeeIndexAction" role="button">従業員管理</a>
                      </div>
                      <div class="col-2 offset-2">
                          <a class="btn btn-primary"  href="FrontController?class_name=employee.ShiftIndexAction" role="button">シフト管理</a>
                      </div>
                    </div>
                </div>

                <div class="offset-8 col-3 my-3">
                    <a class="btn btn-primary m-5" href="FrontController?class_name=situation.TopAction" role="button">トップページへ</a>
                </div>

            </div>
        </div>
    </body>
</html>
