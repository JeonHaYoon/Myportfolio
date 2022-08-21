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
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
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

  /* 게시판 글쓰기*/
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

  .board_write{
    border-top: 2px solid brown;
  }

  .board_write .title,
  .board_write .info{
    padding:15px;
  }

  .board_write .info{
    border-top:1px dashed gray;
    border-bottom:1px solid black;
  }

  .board_write .title dt,
  .board_write .title dd,
  .board_write .info dt,
  .board_write .info dd{
    display: inline-block;
    vertical-align:middle;
    font-size:1.1rem;
  }

  .board_write .title dl{
    font-size:0;
  }

  .board_write .title dd{
    width: calc(100% - 100px);
  }

  .board_write .title input[type="text"],
  .board_write .info input[type="text"]{
    padding: 10px;
    box-sizing: border-box;
  }

  .board_write .title input[type="text"]{
    width:800px;
  }

  .board_write .title dt,
  .board_write .info dt{
    width:100px;
  }

  .board_write .info dl{
    display:inline-block;
    width:32%;
    vertical-align:middle;
    font-size:0;
  }

  .board_write .cont{
    border-bottom: 1px solid black;
  }

  .board_write .cont textarea{
    display:block;
    padding:15px;
    width:100%;
    height:300px;
    box-sizing:border-box;
    border:0;
    resize:vertical;
  }

  .write, .cancel {
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

<title>글쓰기</title>

<form action="" method="post" id="form" class="board_write">
  <div class="title">
    <dl>
      <dt>제목</dt>
      <dd><input type="text" name="title" placeholder="제목 입력" name="title"></dd>
    </dl>
  </div>

  <div class="info">
    <dl>
      <dt>캠핑장 이름</dt>
      <dd><input type="text" name="camp_name" placeholder="캠핑장이름 입력" ></dd>
    </dl>
    <dl>
      <dt>1박 비용</dt>
      <dd><input type="text" placeholder="주중/주말 비용 입력"></dd>
    </dl>
  </div>

  <div class="cont">
    <textarea placeholder="캠핑장 후기를 적어주세요" name="cont" ></textarea>
  </div>

  <div class="bt_wrap">
    <button type="button" id="writeBtn"  class="write" href="#">등록</button>
    <button type="button" id="cancelBtn" class="cancel" onclick="location.href='/board/list'">취소</button>
  </div>
</form>

<script>
  $(document).ready(function(){
    $('#writeBtn').on("click",function(){
      let form = $("#form");
      form.attr("action", "<c:url value='/board/write'/>");
      form.attr("method","post");
      form.submit();
    });
  });

</script>
</div>
</body>
</html>
