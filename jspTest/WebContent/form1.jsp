<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:forward page="view.jsp"/>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="process.jsp">
		<input type="text" name="data"><input type="submit" value="forward"> 
	</form>
	
	<form action="process2.jsp">
		<input type="text" name="data"><input type="submit" value="redirect">
	</form>
	
</body>
</html>