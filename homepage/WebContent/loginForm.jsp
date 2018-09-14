<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>로그인 양식</title>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="css/loginForm.css?after">

</head>

<body>

<div id="wrap">
        <div id="header">
            <!--        로고 버튼    -->
            <h1>
                <a href="http://www.naver.com" class="logo">
                    <span class="blind">NAVER</span>
                </a>
            </h1>
        </div>
</div>

<form action="login.jsp" method="post">
    <div>
        <input type="text" id="textbox" placeholder="아이디" name="id">
    </div>
    <div>
        <input type="password" id="textbox" placeholder="비밀번호" name="password">
    </div>
    <div>
        <input type="submit" id="joinbutton" value="로그인">
    </div>
</form>
    <footer>
        <div id="center">
            <h6>이용약관 | 개인정보처리방침 | 책임의 한계와 법적고지 | 회원정보 고객센터</h6>
 
        </div>
        <div id="center">
            © NAVER Corp.
        </div>
        <br><br>
    </footer>
</body>

</html>