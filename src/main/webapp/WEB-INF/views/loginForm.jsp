<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>

<c:set var="loginOutLink" value="${sessionScope.id==null ? '/login/login': '/login/logout'}"/>
<c:set var="loginOut" value="${sessionScope.id==null ? 'LOGIN': 'LOGOUT'}"/>

<%--views로 넘어오니 페이지 한글이 깨짐 이 구문 추가--%>
<%--<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>--%>
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
                <li><a href="<c:url value='/'/>">HOME</a></li>
                <li><a href="<c:url value='/board/list'/>">BOARD</a></li>
                <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
                <li><a href="<c:url value='/sign/add'/>">SIGN</a></li>
            </ul>
        </div>
    </div>
</div>


<style>

    .loginform{
        border-radius: 30px;
        margin:30px auto;
        padding:100px;
        background:whitesmoke;
        text-align: center;
        height:100%;
        width:200px;
    }
    h1{
        border-bottom: 2px solid burlywood;
        margin-bottom:10px;
    }

    h3{
        line-height:30px;
        font-size:15px;
        margin: 5px 0 2px;
        text-align: left;
        width: 100px;
    }


    input[type=text], input[type=password]{
        width:100%;
        height:24px;
    }

    .login, .sign{

        width:80px;
        height:30px;
        background: burlywood;
        color:white;
        text-align: center;
        cursor: pointer;
        font-size: 15px;
        line-height:30px;
        margin:30px 10px  20px;
        border-radius: 30px;
        border:none;
        float:left;

    }

    /*.last{*/
    /*    float:inherit;*/
    /*    margin-right:20px;*/
    /*    font-size: 13px;*/
    /*    vertical-align:5px;*/
    /*    display:inline;*/
    /*}*/

    h1{
        text-align:center;
        margin-bottom:60px;
    }

</style>





<div class="loginform">
    <h1>로그인</h1>
    <form action="<c:url value='/login/login'/>" method="post" onsubmit="return formCheck(this);">
        <div id="msg">
            <c:if test="${not empty param.msg}">
                <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>
            </c:if>
        </div>


        <h3>아이디</h3>
<%--        value 는 쿠키아이디--%>
        <input type="text" name="id" value="${cookie.id.value}" placeholder="아이디 입력" autofocus>
        <h3>비밀번호</h3>
        <input type="password" name="pswd" placeholder="비밀번호 입력">
        <input type="hidden" name="toURL" value="${param.toURL}">


        <button type="submit" class="login">로그인</button>
        <button type="button" class="sign" onclick="location.href=('/sign/add');">회원가입</button>


        <div class="last">
<%--            쿠키. 아이디가 비었으제 빈칸, 있으면 체크드 표시--%>
          <label> <input type="checkbox" name="rememberId" value="on" ${empty cookie.id.value ? "":"checked" }> 아이디 기억</label>
<%--            <a href="">비밀번호 찾기</a>|--%>
<%--            <a href="">회원가입</a>--%>

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