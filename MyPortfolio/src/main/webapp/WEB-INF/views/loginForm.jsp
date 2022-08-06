
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%--views로 넘어오니 페이지 한글이 깨짐 이 구문 추가--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>   <!--구글폰트로 가져온 noto sans-->
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
</head>
<body>
<!-- 상단 부분 인트로, 내비게이션 바;페이지이동버튼-,  -->
<div class="wrap">
    <div class="intro_bg">
        <div class="header">
            <ul class="nav">
                <li><a href="#">HOME</a></li>
                <li><a href="#">BOARD</a></li>
                <li><a href="#">LOGIN</a></li>
                <li><a href="#">SIGN</a></li>
            </ul>
        </div>
    </div>
</div>

<h1>로그인</h1>
<div class="loginform">
    <form action="<c:url value='/login/login'/>" method="post" onsubmit="return formCheck(this);">

<%--        <div id="msg">--%>
<%--            <c:if test="${not empty param.msg}">--%>
<%--                <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>--%>
<%--            </c:if>--%>
<%--        </div>--%>



        <h3>아이디</h3>
<%--        value 는 쿠키아이디--%>
        <input type="text" name="id" value="${cookie.id.value}" placeholder="아이디 입력" autofocus>
        <h3>비밀번호</h3>
        <input type="password" name="pswd" placeholder="비밀번호 입력">
        <input type="hidden" name="toURL" value="${param.toURL}">


        <button type="submit" class="login">로그인</button>
        <button type="submit" class="sign">회원가입</button>

        <div>


<%--            쿠키. 아이디가 비었으제 빈칸, 있으면 체크드 표시--%>
            <label><input type="checkbox" name="rememberId" value="on" ${empty cookie.id.value ? "":"checked" }> 아이디 기억</label> |
            <a href="">비밀번호 찾기</a> |
            <a href="">회원가입</a>
        </div>

        <script>
            function formCheck(frm) {
                var msg ='';

                if(frm.id.value.length==0) {
                    setMessage('id를 입력해주세요.', frm.id);
                    return false;
                }

                if(frm.pwd.value.length==0) {
                    setMessage('password를 입력해주세요.', frm.pwd);
                    return false;
                }

                return true;
            }
            function setMessage(msg, element){
                document.getElementById("msg").innerHTML = ` ${'${msg}'}`;

                if(element) {
                    element.select();
                }
            }
        </script>
    </form>
</div>

</body>
</html>