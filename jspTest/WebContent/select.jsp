<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>원하시는 페이지를 선택해주세요.</h1>
	
	<!-- request.getContextPath() : /web20180907/view.jsp -->
	<form action="<%= request.getContextPath() %>/select_view.jsp">
	
		<select name="code">
			<option value="A">A</option>
			<option value="B">B</option>
			<option value="C">C</option>
		</select>
		
		<input type="submit" value="이동">
		
	</form>
	
</body>
</html>