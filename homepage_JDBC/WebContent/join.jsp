<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
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
		
	conn = DriverManager.getConnection(url, user, pw);
	
	String sql = "insert into member (id, password, name, birthdate, gender, email, phonenumber) values (?, ?, ?, ?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, birthyear + "-" + birthmonth + "-" + birthday);
	pstmt.setString(5, gender);
	pstmt.setString(6, email);
	pstmt.setString(7, phonenumber);
	
	pstmt.executeUpdate();
	} finally {
		pstmt.close();
		conn.close();
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>

	<h1>추가완료<a href="memberList.jsp">MEMBER LIST</a>
	</h1>
	
</body>
</html>