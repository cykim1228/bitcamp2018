<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	
	if(id != null && pw != null && id.equals(pw)) {
		
		request.getSession(false).setAttribute("id", id);
		request.getSession(false).setAttribute("password", pw);
		request.getSession(false).setAttribute("name", "짠짠영");
	
		response.sendRedirect("myPage.jsp");
		
		}

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
	
	<div id="contents">
		<h2>로그인</h2>
			<hr>
			<h1>아이디 또는 비밀번호가 틀립니다. 확인해주세요.</h1>
			<h1><a href="loginForm.jsp">다시 로그인하기</a></h1>
	
	</div>
	<h1>로그인 실패 : 아이디 혹은 비밀번호를 잘못 입력하였습니다.</h1>
	
</body>
</html>