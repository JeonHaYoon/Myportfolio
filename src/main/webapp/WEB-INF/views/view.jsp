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

    .board_wrap{
        width:1000px;
        margin: 100px auto;
    }
.board_view{
width:1000px;
border-top:2px solid burlywood;

}

.board_view .title{
padding: 20px 15px;
border-bottom: 1px dashed beige;
font-size:2rem;
}

.board_view .info{
padding:15px;
border-bottom:1px solid beige;
font-size:0;
}

.board_view .info dl{
position: relative;
display:inline-block;
padding:0 20px;
}

.board_view .info dl:first-child{
padding-left:0;

}

.board_view .info dl::before{
content:"";
width:1px;
height: 13px;
position:absolute;
top:1px;
left:0;
display:block;
color:#ddd;
}

.board_view .info dl:first-child::before{
display:none;
}

.board_view .info dl dt,
.board_view .info dl dd{
display:inline-block;
font-size:1.4rem;


}


.board_view .info dl dt{
color:darkgoldenrod;

}

.board_view .info dl dd{
color:burlywood;
margin-left:10px;

}

.board_view .cont{
padding:15px;
border-bottom:1px solid black;
line-height:160%;
font-size: 1.4rem;
}


    .list, .edit {

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
    /*  버튼 중앙에 정렬 시키는법, 버튼 display:inline-block 같이 작성 */
    width: 100%;
    text-align: center;
}


</style>


<title>게시판</title>

<div class="board_wrap">
    <div class="board_title">
        <strong>후기 게시판</strong>
        <p>캠핑장을 이용해본 후기를 작성해주세요.</p>
    </div>

    <div class="board_view_wrap">
        <div class="board_view">

            <div class="title">
                글제목이 들어갑니다.
            </div>
            <div class="info">
                <dl>
                    <dt>번호</dt>
                    <dd>1</dd>
                </dl>
                <dl>
                    <dt>캠핑장이름</dt>
                    <dd>트리독스</dd>
                </dl>
                <dl>
                    <dt>아이디</dt>
                    <dd>asdf</dd>
                </dl>
                <dl>
                    <dt>1박비용</dt>
                    <dd>4만원</dd>
                </dl>
                <dl>
                    <dt>작성일</dt>
                    <dd>2022.12.12</dd>
                </dl>
                <dl>
                    <dt>조회수</dt>
                    <dd>31</dd>
                </dl>


            </div>
            <div class="cont">
                글 내용이 들어갑니다.<br>
                글 내용이 들어갑니다.<br>
                글 내용이 들어갑니다.<br>
                글 내용이 들어갑니다.<br>
                글 내용이 들어갑니다.<br>
                글 내용이 들어갑니다.<br>
                글 내용이 들어갑니다.<br>
                글 내용이 들어갑니다.
            </div>
        </div>
        <div class="bt_wrap">
            <button type="button" class="list" href="#">목록</button>
            <button type="button" class="edit" href="#">수정</button>
        </div>

    </div>
</div>

</body>
</html>
