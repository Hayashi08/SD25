<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ja">
    <head>
        <title>トップページ</title>
        <%@ include file="../head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="p-3">
                <div class="col p-4 main">
                    <%@ include file="../header.jsp" %>
                </div>

                <div class="text-center my-3 col main_title">
                    トップページ
                </div>

                <div class="main col-10 mx-auto">

                    <div class="row mt-3 mx-5">
                        <div class="col border p-3 text-center bg-light"><h1>101</h1></div>
                        <div class="col border p-3 text-center bg-primary"><h1>102</h1></div>
                        <div class="col border p-3 text-center bg-primary"><h1>103</h1></div>
                        <div class="col border p-3 text-center bg-light"><h1>104</h1></div>
                        <div class="col border p-3 text-center bg-primary"><h1>105</h1></div>
                    </div>

                    <div class="row mb-5 mx-5">
                        <div class="col border p-3 text-center bg-light"><h1>106</h1></div>
                        <div class="col border p-3 text-center bg-primary"><h1>107</h1></div>
                        <div class="col border p-3 text-center bg-primary"><h1>108</h1></div>
                        <div class="col border p-3 text-center bg-primary"><h1>109</h1></div>
                        <div class="col border p-3 text-center bg-light"><h1>110</h1></div>
                    </div>


                    <div class="row mx-5 my-3">
                        <a class=" col p-3 mx-3 btn btn-danger" href="FrontController?class_name=situation.FormAuthUserAction" role="button">
                            <h1 class="text-white">利用受付</h1>
                        </a>
                        <a class=" col p-3 mx-3 btn btn-success" href="situation/liquidation.html" role="button">
                            <h1 class="text-white">清算</h1>
                        </a>
                    </div>

                    <div class="row mx-5 my-3">
                        <a class="col p-3 mx-3 btn btn-warning" href="situation/book_auth.html" role="button">
                            <h1 class="text-white">予約登録</h1>
                        </a>
                        <a class="col p-3 mx-3 btn btn-info" href="situation/reception_list.html" role="button">
                            <h1 class="text-white">利用情報一覧</h1>
                        </a>
                        <a class="col p-3 mx-3 btn btn-info" href="situation/book_list.html" role="button">
                            <h1 class="text-white">予約情報一覧</h1>
                        </a>
                    </div>

                </div>

            </div>
        </div>
    </body>
</html>
