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
        $(function() {
            $('#listBtn').click(function() {
                // 게시판 목록으로 이동 : GET / board / list

                location.href = "/board/review/list";
            }); // on click
        })

        function readURL(input) {
            var file = input.files[0]
            console.log(file)
            if (file != '') {
                var reader = new FileReader();
                reader.readAsDataURL(file);
                reader.onload = function (e) {
                    console.log(e.target)
                    console.log(e.target.result)
                    $('#preview').attr('src', e.target.result);
                }
            }
        }
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
        <form id="frm" action="/board/review/write" method="post" enctype="multipart/form-data" >
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
                        <div class="input_box col2">
                            <input class="b_input" type="text" name="writer">
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


<%--일단  재우기 --%>
    <div class="file_container"></div>
    <div class="file_form">
        <input type="file">
        <span class="text">파일추가</span>
    </div>
<%--           합쳐보기 --%>
            <div class="inputArea">
                <label for="gdsImg">이미지</label>
                <input type="file" id="gdsImg" name="file" />
                <div class="select_img"><img src="" /></div>

                <script>
                    $("#gdsImg").change(function(){
                        if(this.files && this.files[0]) {
                            var reader = new FileReader;
                            reader.onload = function(data) {
                                $(".select_img img").attr("src", data.target.result).width(500);
                            }
                            reader.readAsDataURL(this.files[0]);
                        }
                    });
                </script>
            </div>
            <%=request.getRealPath("/") %>

    <div class="button_wrap">
        <button type="submit" id="writeBtn">작성</button>
        <button type="button" id="listBtn">목록</button>
    </div>
    </form>


</div>



    <jsp:include page="../../layout/footer.jsp"/>

</body>

</html>
