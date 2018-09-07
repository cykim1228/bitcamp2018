<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
	String resourcePath = "/message/notice/notice.txt";
%>

<%= application.getRealPath(resourcePath) %>

<% 

	BufferedReader br = null;
	char[] buff = new char[512];
	int len = -1;
	
	br = new BufferedReader( new InputStreamReader(application.getResourceAsStream(resourcePath)) );
	
	while( (len = br.read(buff)) != -1) {
		out.print(new String(buff, 0, len));
	}
	
%>

</body>
</html>