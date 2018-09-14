<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	// 쿠키 객체 생성
	Cookie c = new Cookie("id", "zzan");

	// response에 추가
	response.addCookie(c);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1><%= c.getName() %> 쿠키의 값 = <%= c.getValue() %> </h1>
	
	<a href="viewCookie.jsp"> 쿠키 확인 </a><br>
	<a href="editCookie.jsp"> 쿠키 변경 </a><br>
	<a href="deleteCookie.jsp"> 쿠키 삭제 </a>
	
</body>
</html>