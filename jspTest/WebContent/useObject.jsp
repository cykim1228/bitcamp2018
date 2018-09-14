<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="member" class="jspTest.MemberInfo" scope="request" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%= member.getName() %> (<%= member.getId() %>) 회원님 안녕하세요!</h1>
</body>
</html>