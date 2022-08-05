<%--views로 넘어오니 페이지 한글이 깨짐 이 구문 추가--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>   <!--구글폰트로 가져온 noto sans-->
  <meta charset="UTF-8">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
<!-- 상단 부분 인트로, 내비게이션 바;페이지이동버튼-,  -->
<div class="wrap">
  <div class="intro_bg">
    <div class="header">
      <ul class="nav">
        <li><a href="#">HOME</a></li>
        <li><a href="#">ABOUT</a></li>
        <li><a href="#">BOARD</a></li>
        <li><a href="#">LOGIN</a></li>
      </ul>
    </div>
  </div>
</div>

<div class="main_text">
  <h1>WITH DOG</h1>
  <div class="contents1">강아지와 함께할 수 있는 동반 캠핑장을 공유하는 곳입니다.</div>
  <ul class="icons">
    <li>
      <div class="icon_img">
        <img src="/resources/image/icon2.svg">
      </div>
      <div class="contents1_bold"> 베스트글</div>
      <div class="contents2">
        ㅇㅇ기간동안 베스트글을 확인해보세요!
      </div>
      <div class="moreBtn">
        MORE
      </div>
    </li>

    <li>
      <div class="icon_img">
        <img src="/resources/image/icon1.svg">
      </div>
      <div class="contents1_bold"> 베스트글</div>
      <div class="contents2">
        ㅇㅇ기간동안 베스트글을 확인해보세요!
      </div>
      <div class="moreBtn">
        MORE
      </div>
    </li>

    <li>
      <div class="icon_img">
        <img src="/resources/image/icon0.svg">
      </div>
      <div class="contents1_bold"> 베스트글</div>
      <div class="contents2">
        ㅇㅇ기간동안 베스트글을 확인해보세요!
      </div>
      <div class="moreBtn">
        MORE
      </div>
    </li>
  </ul>
</div>

<!-- 하단부 -->

<footer>
  <div>
    LOGO
  </div>
  <div>
    만든 사람:JEON<br>
    문의: jmhyang91@gmail.com<br>
    COPYRIGHT 2022. J. ALL RIGHT RESERVED.

  </div>
</footer>

</body>
</html>