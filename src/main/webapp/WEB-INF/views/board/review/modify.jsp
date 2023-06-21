<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>SEOULLIVE</title>
    <!-- layout css -->
    <!-- layout css -->
    <link rel="stylesheet" href="../../../../resources/static/css/review/list.css">
    <link rel="stylesheet" href="../../../../resources/static/css/layout/layout.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>
    <script src="https://kit.fontawesome.com/4b84ea08f3.js" crossorigin="anonymous"></script>


    <script src="../../../../resources/static/review/js/review.js"></script>
    <script>
        function chk_form() {
            document.getElementById('frm').submit();
        }
        $(function () {
        $('#deleteBtn').click(function () {
            let formObj = $("form");

            formObj.attr("action", "/board/review/remove");
            formObj.attr("method", "POST");
            formObj.submit();
        });
        });


    </script>

</head>
<body>
<!-- <%-- header --%> -->
<jsp:include page="../../layout/header.jsp"/>

<div id="container">
    <div class="title_box">
        <h2 class="title">리뷰게시판</h2>
    </div>
    <div class="board_write_wrap">
        <form id="frm" action="/board/review/modify" method="post">
            <input type="hidden" name="seq" value="${__BOARD__.seq}">
            <input type="hidden" name="writer" value="${__BOARD__.writer}">

            <fieldset class="board_write_box">
                <legend class="hide">게시글 등록</legend>
                <div>
                    <div class="row">
                        <div class="title_box col1">
                            <label for="title">제목</label>
                        </div>
                        <div class="input_box col2">
                            <input class="b_input" type="text" name="title">
                        </div>
                    </div>
                    <div class="row">
                        <div class="title_box col1">
                            <label for="writer">작성자</label>
                        </div>
                        <div class="input_box col2" style="height: 43px; margin: 11px;">
                            <p>${__BOARD__.writer}</p>
                        </div>
                    </div>

                    <div class="row">
                        <div class="title_box col1">
                            <label for="place">장소</label>
                        </div>
                        <div class="input_box col2">
                            <input class="b_input" type="text" name="place">
                        </div>
                    </div>

                    <div class="row">
                        <div class="title_box col1">
                            <label for="content">사진 설명</label>
                        </div>
                        <div class="input_box col2">
                                <textarea name="content" cols="30" rows="10">

                                </textarea>
                        </div>
                    </div>

                </div>
            </fieldset>



            <div class="file_container"></div>
            <div class="file_form">
                <input type="file">
                <span class="text">파일추가</span>
            </div>

            <div class="button_wrap">
                <button type="button" id="deleteBtn">삭제</button>
                <button type="submit" id="writeBtn">작성</button>
                <button type="button" id="listBtn">목록</button>
            </div>

        </form>


    </div>



    <jsp:include page="../../layout/footer.jsp"/>

</body>

</html>
