<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String birthdate = request.getParameter("birthdate");
	String birthyear = request.getParameter("birthyear");
	String birthmonth = request.getParameter("birthmonth");
	String birthday = request.getParameter("birthday");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String phonenumber = request.getParameter("phonenumber");
	String regdate = request.getParameter("regdate");

	// 1. 데이터베이스 드라이버 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");

	Connection conn = null;
	PreparedStatement pstmt = null;

	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String pw = "1234";
	
	int resultCnt = 0;
	
	try {
		// 2. 커넥션 객체 생성 및 데이터베이스 연결
		conn = DriverManager.getConnection(url, user, pw);

		// 3. PreparedStatement 객체 생성
		String sql = "update member set password=?, name=?, birthdate=?, gender=?, email=?, phonenumber=? where id=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, password);
		pstmt.setString(2, name);
		pstmt.setString(3, birthyear + "-" + birthmonth + "-" + birthday);
		pstmt.setString(4, gender);
		pstmt.setString(5, email);
		pstmt.setString(6, phonenumber);
		pstmt.setString(7, id);
		
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
<title>수정 처리</title>
</head>
<body>

	<h1>

		<% 
			if(resultCnt > 0) {
		%>

		수정완료

		<% } else { %>

		<% } %>

		<a href="memberList.jsp">emp LIST</a>
	</h1>

</body>
</html>