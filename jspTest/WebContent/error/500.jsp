<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500 에러 발생</title>
</head>
<body>
500
	서버 오류가 발생하였습니다.
	빠른 시간내에 처리하겠습니다.
	
	<h3> 에러 타입 : <%= exception.getClass().getName() %></h3>
	
	<h3> 에러 메시지 : <%= exception.getMessage() %></h3>
</body>
</html>