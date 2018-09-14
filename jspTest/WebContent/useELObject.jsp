<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setAttribute("mame", "김찬영");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Object</title>
</head>
<body>

	기본 객체 사용 : <br>
	
	요청 URI : ${pageContext.request.requestURI} <br>
	request의 name 속성 : ${requestScope.name} <br>
	code 파라미터 : ${param.code}

</body>
</html>