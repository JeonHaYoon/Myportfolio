
<%--views로 넘어오니 페이지 한글이 깨짐 이 구문 추가--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<c:set var="loginOutLink" value="${sessionScope.id==null ? '/login/login': '/login/logout'}"/>
<c:set var="loginOut" value="${sessionScope.id==null ? 'LOGIN': 'LOGOUT'}"/>

<!DOCTYPE html>
<html lang="ko">
<head>   <!--구글폰트로 가져온 noto sans-->
    <meta charset="UTF-8">
    <title>회원가입</title>
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
                    <li><a href="<c:url value='/board/list'/>">BOARD</a>
                    </li><li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
                    <li><a href="<c:url value='/sign/add'/>">SIGN</a></li>
                </ul>
            </div>
         </div>
    </div>

<style>
    .signform{
        border-radius: 30px;
        margin:30px auto;
        padding:70px;
        background:whitesmoke;
        text-align: center;
        height:100%;
        width:250px;
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

    input{
        width:280px;
        height:24px;
    }

    select{
        width:280px;
        height:24px;
    }

    .sign{
        width:80px;
        height:30px;
        background: burlywood;
        color:white;
        text-align: center;
        font-size: 15px;
        line-height:30px;
        margin:30px 10px  20px;
        border-radius: 30px;
        border:none;
        cursor: pointer;
    }

</style>

<!--class="signform"-->

<div class="signform">
    <h1>회원가입</h1>
    <%--    action c:url value는 앞의 패키지 안적어도됨 pos방식으로 데이터 전송,--%>
    <form action="<c:url value="/sign/save"/>" method="post" onsubmit="return formCheck(this);">

        <div id="msg" class="msg"></div>

        <h3>아이디<h3>
            <input class="input-field" type="text" name="id" placeholder="3글자 이상의 영어,숫자를 적어주세요" autofocus>
        <h3>비밀번호<h3>
            <input class="input-field" type="password" name="pswd" placeholder="6글자 이상의 영어,숫자를 적어주세요">
        <h3>강아지이름<h3>
            <input class="input-field" type="text" name="dogname" placeholder="함께 하는 친구의 이름을 적어주세요">
        <h3>이메일<h3>
            <input class="input-field" type="email" name="email" placeholder="abc@bbb.com">
        <h3>거주지역</h3>
            <select name="region">
                <option value="" disabled selected>------선택해주세요------</option>
                <option value="ko">강원도</option>
                <option value="gg">경기도</option>
                <option value="gn">경상남도</option>
                <option value="gb">경상북도</option>
                <option value="jn">전라남도</option>
                <option value="jb">전라북도</option>
                <option value="cn">충청남도</option>
                <option value="cb">충청북도</option>
                <option value="gj">광주광역시</option>
                <option value="dg">대구광역시</option>
                <option value="dj">대전광역시</option>
                <option value="bs">부산광역시</option>
                <option value="su">서울특별시</option>
                <option value="us">울산광역시</option>
                <option value="ic">인천광역시</option>
                <option value="sj">세종특별자치시</option>
                <option value="jj">제주특별자치도</option>
            </select>

        <h3>성별</h3>
            <select name="gender">
                <option value="" disabled selected>------선택해주세요------</option>
                <option value="m">남자</option>
                <option value="f">여자</option>
            </select>

        <button type="submit" class="sign">회원가입</button>
    </form>
</div>


<script>
    function formCheck(frm){
        var msg='';
        if(frm.id.value.length<3){
            setMessage('아이디는 3글자 이상이어야 합니다.' , frm.id);
            return false;
        }

        if(frm.pswd.value.length<6){
            setMessage('패스워드는 6글자 이상이어야 합니다.' ,frm.pswd);
            return false;
        }

        return true;
    }

    function setMessage(msg, element){
        document.getElementById("msg").innerHTML=`<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`;

        //잘못입력된 부분 선택되게함
        if(element){
            element.select();
        }
    }

</script>
</body>
</html>