<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>

<c:set var="loginOutLink" value="${sessionScope.id==null ? '/login/login': '/login/logout'}"/>
<c:set var="loginOut" value="${sessionScope.id==null ? 'LOGIN': 'LOGOUT'}"/>


<!DOCTYPE html>
<html lang="en">

    <head>   <!--구글폰트로 가져온 noto sans-->
        <meta charset="UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css"  href="/resources/css/style.css">
    </head>



    <body>

        <div class="wrap">
            <div class="intro_bg">
                <div class="header">
                   <ul class="nav">
                    <li><a href="<c:url value='/'/>">HOME</a></li>
                    <li><a href="<c:url value='/board/list'/>">BOARD</a></li>
                    <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
                    <li><a href="<c:url value='/sign/add'/>">SIGN</a></li>
                   </ul>
                </div>
            </div>
        </div>



    <style>

    /* boardlist */

    /* 모든 캡션 */
    caption{
        display:none;
    }

    .board_list_wrap{
        padding: 100px;
    }

    .board_list{
        width:100%;
        border-top:2px solid brown;
    }

    .board_list tr{
        border-bottom:1px solid lightgray;
    }
    .board_list td{
        text-align:center;
    }

    .board_list th,
    .board_list td{
        padding:10px;
        font-size:14px;
    }

    /* 제목부분만 따로 설정 */
    .board_list .tit{
        text-align: left;
    }

    .board_list .tit:hover {
        text-decoration: underline;
    }

    .board_list_wrap .paging{
        margin-top:30px;
        font-size:0;
        text-align: center;
    }

    .board_list_wrap .paging a{
        display: inline-block;
        margin-left:10px;
        font-size:12px;
        padding:5px 10px;
        border-radius: 100px;
    }

    .board_list_wrap .paging a:first-child{
        margin-left:0;
    }

    .board_list_wrap .paging a:last-child{
        margin-right:0;
    }

    .board_list_wrap .paging a.bt{
        background: beige;
        boarder: 1px solid beige;
    }

    .board_list_wrap .paging a.num{
        border: 1px solid burlywood;
        font-weight: 600;
        color:burlywood;
    }

    /* 현재 활성화된 페이지 */
    /*.board_list_wrap .paging a.num.on {*/
    /*    background: burlywood;*/
    /*    color: white;*/

    /*}*/

    .board_list_wrap .paging a.on {
        background: burlywood;
        color: white;
    }

    .write {
        width: 80px;
        height: 30px;
        background: burlywood;
        color: white;
        text-align: center;
        font-size: 15px;
        line-height: 30px;
        margin: 30px 10px 20px;
        border-radius: 30px;
        border: none;
        cursor: pointer;
        display: inline-block;
    }

    .bt_wrap{
        width: 100%;
        text-align: center;
    }
    .board_title{
        margin-bottom: 30px;
    }

    .board_title strong{
        font-size:3rem;
    }

    .board_title p{
        margin-top:5px;
        font-size:1.4rem;
    }

    </style>
<!-- 상단 부분 인트로, 내비게이션 바;페이지이동버튼-,  -->

        <div class="board_list_wrap">

            <table class="board_list">
                <div class="board_title">
                    <strong>후기 게시판</strong>
                    <p>캠핑장을 이용해본 후기를 작성해주세요</p>
                </div>

                <div class="search-container">
                    <form action="<c:url value="/board/list"/>" class="search-form" method="get">
                        <select class="search-option" name="option">
                            <option value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected" : ""}>제목+내용</option>
                            <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>제목만</option>
                            <option value="W" ${ph.sc.option=='W' ? "selected" : ""}>작성자</option>
                        </select>

                        <input type="text" name="keyword" class="search-input" type="text" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요">
                        <input type="submit" class="search-button" value="검색">
                    </form>
                    <button id="writeBtn" class="btn-write" onclick="location.href='<c:url value="/board/write"/>'"><i class="fa fa-pencil"></i> 글쓰기</button>
                </div>

                <caption>게시판 목록</caption>
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>캠핑장 이름</th>
                            <th>글쓴이</th>
                            <th>작성일</th>
                            <th>조회수</th>
                        </tr>
                    </thead>

                    <tbody>
<%--        <tr>--%>
<%--            <!-- 프로그래밍할때는 tr을 하나만 남겨두고 프로그램을 짠다. 데이터를 가져오는 변수를 넣으면 자동입력됨.-->--%>
<%--            <td class="num">5</td>--%>
<%--            <td class="tit">--%>
<%--                <a href="#">강아지랑 캠핑!</a>--%>
<%--            </td>--%>
<%--            <td>트리독스</td>--%>
<%--            <td>관리자</td>--%>
<%--            <td>2022-5-11</td>--%>
<%--            <td>555</td>--%>
<%--        </tr>--%>


                        <%--반복문 --%>
                        <c:forEach var="board" items="${list}">
                            <tr>
                                <td>${board.bno}</td>
                                <td><a href="<c:url value='/board/read?bno=${board.bno}&page=${page}&pageSize=${pageSize}'/>">${board.title}</a></td>
                                <td>${board.camp_name}</td>
                                <td>${board.writer}</td>
                                <td>${board.reg_date}</td>
                                <td>${board.view_cnt}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
            </table>

            <div class="paging-container">
                <div class="paging">
                    <c:if test="${totalCnt==null || totalCnt==0}">
                        <div> 게시물이 없습니다. </div>
                    </c:if>
                    <c:if test="${totalCnt!=null && totalCnt!=0}">
                        <c:if test="${ph.showPrev}">
                            <a class="page" href="<c:url value="/board/list${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
                        </c:if>
                        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                            <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/board/list${ph.sc.getQueryString(i)}"/>">${i}</a>
                        </c:forEach>
                        <c:if test="${ph.showNext}">
                            <a class="page" href="<c:url value="/board/list${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
                        </c:if>
                    </c:if>
                </div>
            </div>



    <!-- 아래 페이지이동  -->
            <div class="paging">
                <a href="<c:url value='/board/list?page=1&pageSize=${ph.pageSize}'/>" class="bt">첫 페이지 </a>
                <c:if test="${ph.showPrev}">
                    <a href="<c:url value='/board/list?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>" class="bt">이전 페이지</a>
                </c:if>

               <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                   <a href="<c:url value='/board/list?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>
               </c:forEach>

<%--        <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">--%>
<%--            <li class="paginate_button ${pageMaker.cri.pageNum == num? "active":"" }">--%>
<%--                <a href="${num }">${num}</a>--%>
<%--            </li>--%>
<%--        </c:forEach>--%>


<%--        현재페이지 좀 다르게 하고 싶은데--%>
<%--               <a href="<c:url value='/board/list?page${ph.page}&pageSize=${ph.pageSize}'/>" class="num on"/>--%>
<%--           </c:if>--%>

                <c:if test="${ph.showNext}">
                    <a href="<c:url value='/board/list?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>" class="bt">다음 페이지</a>
                </c:if>

                <a href="<c:url value='/board/list?page=${ph.totalPage}&pageSize=${ph.pageSize}'/>" class="bt">마지막 페이지</a>

            </div>

            <div class="bt_wrap">
                <button type="button" class="write" onclick="location.href=('/board/write');">글쓰기</button>
            </div>

        </div>

    <script>
        let msg="${msg}"
            if(msg=="DEL_OK") alert("성공적으로 삭제되었습니다.");
            if(msg=="DEL_ERR") alert("삭제에 실패했습니다..");
            if(msg=="WRT_OK") alert("성공적으로 등록되었습니다.");
    </script>

    </body>
</html>

