<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String empno = request.getParameter("empno");
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");

	// 1. 데이터베이스 드라이버 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");

	Connection conn = null;
	PreparedStatement pstmt = null;

	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String password = "1234";
	
	int resultCnt = 0;
	
	try {
		// 2. 커넥션 객체 생성 및 데이터베이스 연결
		conn = DriverManager.getConnection(url, user, password);

		// 3. PreparedStatement 객체 생성
		String sql = "update emp set ename=?, job=? where empno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ename);
		pstmt.setString(2, job);
		pstmt.setInt(3, Integer.parseInt(empno));
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

	<h1>
			
		<% 
			if(resultCnt > 0) {
		%>
		
		수정완료 
		
		<% } else { %>
		
		<% } %>
		
		<a href="JDBCTest.jsp">emp LIST</a>
	</h1>

</body>
</html>