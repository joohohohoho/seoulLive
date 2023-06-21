<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행지view</title>
    <link rel="stylesheet" href="../../../../resources/static/css/review/view.css">
    <link rel="stylesheet" href="../../../../resources/static/css/layout/layout.css">
    <!--    swiper -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <!-- <script type="text/javascript" src="/js/reviewvi.js"></script> -->
    <script src="https://kit.fontawesome.com/6ba5041685.js" crossorigin="anonymous"></script>

    <script>

        $(function() {
            $('.listBtn').click(function() {
                // 게시판 목록으로 이동 : GET / board / list

                location.href = "/board/review/list";
            }); // on click

            $('.modifyBtn').click(function() {
                // 게시판 목록으로 이동 : GET / board / list

                location.href = "/board/review/modify?&seq=${__BOARD__.seq}";
            }); // on click

        })
        function clip(){

            var url = '';    // <a>태그에서 호출한 함수인 clip 생성
            var textarea = document.createElement("textarea");
            //url 변수 생성 후, textarea라는 변수에 textarea의 요소를 생성

            document.body.appendChild(textarea); //</body> 바로 위에 textarea를 추가(임시 공간이라 위치는 상관 없음)
            url = window.document.location.href;  //url에는 현재 주소값을 넣어줌
            textarea.value = url;  // textarea 값에 url를 넣어줌
            textarea.select();  //textarea를 설정
            document.execCommand("copy");   // 복사
            document.body.removeChild(textarea); //extarea 요소를 없애줌

            alert("URL이 복사되었습니다.")  // 알림창
        }


        $(function () {
            var heartIcon = $('.area_txt .fa-heart');
            heartIcon.click(function() {
                $(this).toggleClass('on');


                var boardType = $(this).find('input[name="board"]').val();
                var boardSeq = $(this).find('input[name="board_seq"]').val();
                alert(boardType+", "+boardSeq);

                $.ajax({
                    url: '/board/review/likeList',
                    method: 'POST',
                    data: {
                        board: boardType,
                        board_seq: boardSeq
                    },
                    success: function(response) {
                        alert("좋아요!");
                        // 성공적으로 요청을 처리한 후 실행할 코드
                    },
                    error: function(xhr, status, error) {
                        alert("오류");
                        // 요청 처리 중 오류가 발생한 경우 실행할 코드
                    }
                });

            })

        });
    </script>
</head>
<jsp:include page="../../layout/header.jsp"/>
<body>
<div class="wrapper">
    <div class="title">
        <h2 class="title_name">${__BOARD__.title}</h2>
        <div class="head_line">
            <div id="writer_container">
<%--                <span class="writer_picture"><i class="fas fa-user"></i>프로필사진</span>--%>
            <span id="writer">${__BOARD__.writer}</span>
            <span id="area_profile"></span>
            <span id="nick"></span>


                <i class="fas fa-circle"></i>
                <c:choose>
                    <c:when test="${__BOARD__.modify_date!=null}">
                        <span id="end_date"><fmt:formatDate value="${__BOARD__.modify_date}" pattern="yyyy년MM월dd일HH:mm"/></span>
                    </c:when>
                    <c:when test="${__BOARD__.modify_date==null}">
                        <span id="publish_date"><fmt:formatDate value="${__BOARD__.write_date}" pattern="yyyy년MM월dd일HH:mm"/></span>
                    </c:when>
                </c:choose>
            </div>
            <div class="title_function">
                <a href="#" id="copyBtn" class="url_setClipboard" onclick="clip(); return false;"style="cursor:pointer;">
                    <i class="fas fa-share-nodes"></i>URL 복사
                </a>

                <div class="area_txt">
                    <i class="fas fa-heart off">
                        <input type="hidden" name="board" value="review">
                        <input type="hidden" name="board_seq" value="${__BOARD__.seq}">
                    </i>
                </div>

            </div>
        </div>
    </div>

    <!-- swiper -->
    <div class="swiper">
        <div class="swiper-wrapper">
            <!-- slides -->
            <div class="swiper-slide"><img src="../../../../resources/static/img/경복궁2.jpg" onclick="window.open(this.src)"
                                           style="height: 100%; width: 100%;"></div>
            <div class="swiper-slide"><img src="../../../../resources/static/img/남산1.jpg" onclick="window.open(this.src)"
                                           style="height: 100%; width: 100%;"></div>
            <div class="swiper-slide"><img src="../../../../resources/static/img/명동1.jpg" onclick="window.open(this.src)"
                                           style="height: 100%; width: 100%;"></div>
        </div>

        <div class="swiper-pagination"></div>

        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>

    </div>

    <div class="content">
        ${__BOARD__.content}
    </div>

    <div class="viewBtn">
        <ul class="btnList">
            <li><a class="deleteBtn" href="#">삭제</a></li>
            <li><a class="modifyBtn" href="#">수정</a></li>
            <li><a class="listBtn" href="#">목록</a></li>
        </ul>
    </div>
<%--댓글 구현하기--%>
    <div class="commant">
        <div class="commant_top">
            댓글
        </div>
        <div class="commant_mid">
            <input type="hidden" name="board" value="review">
            <input type="hidden" name="board_seq" value="${__BOARD__.seq}">
            <input class="commant_box" name="commentValue" type="text" placeholder="댓글을 남겨주세요.">
            <input class="commant_upload" type="button" value="등록">
        </div>

        <div class="commant_bottom">
            <c:forEach var="comm" items="${__CLIST__}">
                <ul class="commant_bot_wrap">
                    <img src="../../../../resources/static/img/profilebasic.png" alt="">
                    <li class="commant_id">${comm.writer}</li>
                    <li class="commant_cont">${comm.content}</li>
                </ul>
            </c:forEach>
        </div>
    </div>

<%--    <script>--%>
<%--        $(function () {--%>
<%--            var comment = $('.commant_mid .commant_upload');--%>
<%--            comment.click(function() {--%>

<%--                var boardType = $(this).parent().find('input[name="board"]').val();--%>
<%--                var boardSeq = $(this).parent().find('input[name="board_seq"]').val();--%>
<%--                var commentVal = $(this).parent().find('input[name="commentValue"]').val();--%>

<%--                var request = $.ajax({--%>
<%--                    url: '/board/review/commentWrite',--%>
<%--                    method: 'POST',--%>
<%--                    data: {--%>
<%--                        board_name: boardType,--%>
<%--                        post_seq: boardSeq,--%>
<%--                        content: commentVal--%>
<%--                    },--%>
<%--                    success: function(response) {--%>
<%--                        $.ajax({--%>
<%--                            url: "/board/review/view",--%>
<%--                            method: "GET",--%>
<%--                            data: {--%>
<%--                                seq: boardSeq--%>
<%--                            },--%>
<%--                            success: function(response) {--%>
<%--                                // GET 요청이 성공한 후 실행할 코드--%>
<%--                                window.location.href = "/board/review/view?seq=" + boardSeq;--%>
<%--                            },--%>
<%--                            error: function(xhr, status, error) {--%>
<%--                                // GET 요청 처리 중 오류가 발생한 경우 실행할 코드--%>
<%--                            }--%>
<%--                        });--%>
<%--                    },--%>
<%--                    error: function(xhr, status, error) {--%>
<%--                        // POST 요청 처리 중 오류가 발생한 경우 실행할 코드--%>
<%--                        $.ajax({--%>
<%--                            url: "/board/review/view",--%>
<%--                            method: "GET",--%>
<%--                            data: {--%>
<%--                                seq: boardSeq--%>
<%--                            },--%>
<%--                            success: function(response) {--%>
<%--                                // GET 요청이 성공한 후 실행할 코드--%>
<%--                                window.location.href = "/board/review/view?seq=" + boardSeq;--%>
<%--                            },--%>
<%--                            error: function(xhr, status, error) {--%>
<%--                                // GET 요청 처리 중 오류가 발생한 경우 실행할 코드--%>
<%--                            }--%>
<%--                        });--%>
<%--                    }--%>

<%--                });--%>
<%--                request.abort();--%>
<%--            })--%>

<%--        });--%>
<%--    </script>--%>
    <script>
    $(function () {
    $('.commant_upload').click(function() {
        var parentContainer = $(this).closest('.commant');
    var boardType = $(this).parent().find('input[name="board"]').val();
    var boardSeq = $(this).parent().find('input[name="board_seq"]').val();
    var commentVal = $(this).parent().find('input[name="commentValue"]').val();
    alert(boardType+","+boardSeq+","+commentVal);
    var request = $.ajax({
    url: '/board/review/commentWrite',
    method: 'POST',
    data: {
    board_name: boardType,
    post_seq: boardSeq,
    content: commentVal
    },
    success: function(response) {
    // 댓글 작성 후, 작성한 댓글을 동적으로 추가하는 코드
        var commentItem = $('<ul class="commant_bot_wrap"></ul>');
        commentItem.append('<img src="../../../../resources/static/img/profilebasic.png" alt="">');
        commentItem.append('<li class="commant_id">' + "nayoung" + '</li>');
        commentItem.append('<li class="commant_cont">' + commentVal + '</li>');

    $('.commant_bottom').append(commentItem);

    // 작성한 댓글 입력 필드 초기화
    $(this).parent().find('input[name="commentValue"]').val('');
    },
    error: function(xhr, status, error) {
    // 오류 처리
    }
    });
    });
    });
    </script>


</div>
<script src="../../../../resources/static/js/review/view.js" defer></script>
<jsp:include page="../../layout/footer.jsp"/>
</body>

</html>
