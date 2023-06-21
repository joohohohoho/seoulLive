<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>리뷰 List</title>
    <!-- layout css -->
    <link rel="stylesheet" href="../../../../resources/static/css/review/list.css">
    <link rel="stylesheet" href="../../../../resources/static/css/layout/layout.css">

    <script src="https://kit.fontawesome.com/7ae3a6a91c.js" crossorigin="anonymous"></script>

<%--    <script src="../js/list.js" defer></script>--%>
    <!-- tab -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

    <script>

        $(function() {
            $('.write_btn').click(function() {
                // 게시판 목록으로 이동 : GET / board / list

                location.href = "/board/review/write";
            }); // on click

            $('.gridView-title').click(function() {
                // 게시판 목록으로 이동 : GET / board / list

                location.href = "/board/review/view&seq=${__BOARD__.seq}";
            }); // on click

        })
        $(function (){
            $('.pageNum').on('click', function(e){
                // console.log('pageNum Clicked....')
                let selectedPageNum = e.currentTarget.textContent
                let searchType="${pageMaker.cri.searchType}";
                let keyword = "${pageMaker.cri.keyword}";

                // console.log(selectedPageNum);

                location.href = "/board/review/list?searchType="+searchType+"&keyword=" +keyword+ "&currPage=" + selectedPageNum;
            }); // onclick

            $('.searchButton').on('click', function(e){
                // e.preventDefault();
                alert("검색버튼 활성화");
                let val = $("input[name='keyword']").val();
                moveForm.find("input[name='keyword']").val(val);
                moveForm.find("input[name='pageNum']").val(1);
                moveForm.submit();
            });


        }); //jq
    </script>

</head>

<jsp:include page="../../layout/header.jsp"/>
<body>

<div id="container" class="list_wrap">

    <!-- search bar -->
    <form action="/board/review/list" method="get" id="moveForm">
        <div class="search_wrap">
            <div class="search">
                <select id="title" class="form-control search-search" name="searchType">
                    <option value="title" selected>제목</option>
                    <option value="writer">작성자</option>
                </select>
                <input type="text" class="searchTerm" placeholder="검색내용을 입력하세요." name="keyword">

                <button type="submit" class="searchButton">
                    <i class="fa fa-search"></i>
                </button>
            </div>
        </div>
        <input type="hidden" name="currPage" value="${pageMaker.cri.currPage}">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
    </form>
    <!-- list -->
    <div class="gridViewContainer">
<%---------------------%>
    <c:forEach var="review" items="${__LIST__}">
        <div class="gridView-listItem">
<%--            <a href="/board/get?currPage=${pageMaker.cri.currPage}&bno=${boardVO.bno }">${ boardVO.title }</a>--%>
            <div class="gridView-tile">
                <div class="gridView-imageSection thumbnailWrap">
                    <div class="gridView-imageSectionMaskTop"></div>
                    <div class="gridView-searchHitSelect searchHitSelect">
                        <i class="fa fa-check"></i>
                    </div>
                    <div class="gridView-menu">
                        <i class="fa fa-ellipsis-v"></i>
                    </div>
                    <div class="gridView-image" style="background-image:url('https://mblogthumb-phinf.pstatic.net/MjAxNzA4MjdfMjgy/MDAxNTAzODAyNzIzNTM4.fp7hUPYdqiPc3GHMaB3-NYOpIK6ZLLC03ZKn0w03da4g.DFgtEvRePLPBvXbdQJt8XVjq6kJEXbJQ1uwUXCveoyog.JPEG.kotfa198643/lotte-world-tower-1791802_1920.jpg?type=w800');"></div>
                </div>
                <div class="gridView-detailsSection">
                    <div class="gridView-detailsTop">
                        <a class="gridView-title u-link" href="/board/review/view?seq=${review.seq }">${review.title}</a>
                    </div>
                    <div class="gridView-detailsBottom">
<%--                        <div class="gridView-date">2 hours ago</div>--%>
                        <div class="gridView-mediaTypeIcon">
<%--                            <div class="heartButtonArea">--%>
<%--                                <label class="like-icon" title="Мне нравится!">--%>
<%--                                    <input class="like-button" type="checkbox">--%>
<%--                                    <svg class="heartSvg" clip-rule="evenodd" fill-rule="evenodd" image-rendering="optimizeQuality"--%>
<%--                                         shape-rendering="geometricPrecision" text-rendering="geometricPrecision" viewBox="0 0 500 500"--%>
<%--                                         xmlns="http://www.w3.org/2000/svg"><defs>--%>
<%--                                        <style type="text/css">--%>
<%--                                            <![CDATA[.str0 {stroke-width:15;stroke-linejoin:round}]]>--%>
<%--                                        </style>--%>
<%--                                    </defs><path class="fil0 str0" d="M412 79c-53-40-146-17-162 68-16-85-109-108-162-68-43 32-55 94-44 137 30 119 194 217 206 224 12-7 176-105 206-224 11-43-1-105-44-137z" id="Layer_x0020_1"/>--%>
<%--                                    </svg>--%>
<%--                                    --%>
<%--                                </label>--%>
<%--                            </div>--%>
                            <div class="area_txt">
                                <i class="fas fa-heart off">
                                    <input type="hidden" name="board" value="review">
                                    <input type="hidden" name="board_seq" value="${review.seq}">
                                </i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>
    <script>


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



    <!-- pagination -->
    <div class="paging_wrap">
        <div class="paging_box">
            <ul>
                <c:if test="${pageMaker.prev}">
                    <li class="prev pager">
                        <a href="/board/review/list?currPage=${pageMaker.startPage -1}" title="이전 페이지로 이동하기"><i class="fas fa-chevron-left"></i></a>
                    </li>
                </c:if>

                <c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li>
                        <a class="pageNum ${pageMaker.cri.currPage ==pageNum? 'active':''}"  href="#a">${pageNum}</a>
                    </li>

                </c:forEach>

                <c:if test="${pageMaker.next}">
                    <li class="next pager">
                        <a href="/board/review/list?currPage=${pageMaker.endPage +1}" title="다음 페이지로 이동하기"><i class="fas fa-chevron-right"></i></a>
                    </li>

                </c:if>

            </ul>
        </div>
    </div>
        <div class="btn_wrap">
            <button class="write_btn"><a href="#">글쓰기</a></button>
        </div>
</div>
        <jsp:include page="../../layout/footer.jsp"/>
</body>
</html>