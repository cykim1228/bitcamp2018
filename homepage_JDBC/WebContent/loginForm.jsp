<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	// 쿠키를 저장할 배열을 생성. request를 통해 쿠키를 받아온다.
	Cookie[] cookie = request.getCookies();
	String id = "";
	if(cookie != null) {
		for(int i = 0 ; i < cookie.length ; i++) {
			if(cookie[i].getName().trim().equals("id")) {
				System.out.println(cookie[i].getValue());
				// id라는 이름의 키가 있을 경우 문자열에 그 쿠키의 값을 넣는다.
				id = cookie[i].getValue();
			}
		}
	}

%>


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
        <input type="text" id="textbox" placeholder="아이디" name="id" value="<%= id %>">
    </div>
    <div>
        <input type="password" id="textbox" placeholder="비밀번호" name="password">
    </div>
    <div>
        <input type="submit" id="joinbutton" value="로그인">
    </div>
    <br>
    <div>
    	<input type="checkbox" id="chk" name="idsave" <% if(id.length() > 1) {out.println("checked");} %>> 아이디 기억
    </div>
</form>
    <footer>
        <div id="center">
            <h6>아이디 찾기 | 비밀번호 찾기 | 회원가입</h6>
 
        </div>
        <div id="center">
            © NAVER Corp.
        </div>
        <br><br>
    </footer>
</body>

</html>