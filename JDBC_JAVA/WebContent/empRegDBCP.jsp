<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String empno = request.getParameter("empno");
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");

	// 1. 데이터베이스 드라이버 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = null;
	
	PreparedStatement pstmt = null;
	
	// String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	// String user = "scott";
	// String password = "1234";
	
	String jdbcUrl = "jdbc:apache:commons:dbcp:open";
	
	int resultCnt = 0;
	
	try {
		
	conn = DriverManager.getConnection(jdbcUrl);
	
	String sql = "insert into emp (empno, ename, job) values (?, ?, ?)";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(empno));
	pstmt.setString(2, ename);
	pstmt.setString(3, job);
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
<title>Insert title here</title>
</head>
<body>

	<h1>추가완료<a href="JDBCTest.jsp">emp LIST</a>
	</h1>
	
	<form action="empReg.jsp">

</body>
</html>