<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String id = request.getParameter("id");

	// 1. 데이터베이스 드라이버 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = null;
	
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String password = "1234";
	int resultCnt = 0;
	
	try {
		
	conn = DriverManager.getConnection(url, user, password);
	
	String sql = "delete from member where id=?";
	
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, id);
	
	resultCnt = pstmt.executeUpdate();
	
	} finally {
		pstmt.close();
		conn.close();
	}
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 삭제처리</title>
</head>
<body>
	<h1>삭제완료 <%= resultCnt %> <a href="memberList.jsp">MEMBER LIST</a> </h1>
</body>
</html>