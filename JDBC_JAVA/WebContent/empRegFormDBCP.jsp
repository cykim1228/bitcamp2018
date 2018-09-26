<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%

         // 1. 데이터베이스 드라이버 로드
         Class.forName("oracle.jdbc.driver.OracleDriver");
		
         Connection conn = null;
         Statement stmt = null;
         ResultSet rs = null;
         
         // String url = "jdbc:oracle:thin:@localhost:1521:orcl";
         // String user = "scott";
         // String password = "1234";
         
         String jdbcUrl = "jdbc:apache:commons:dbcp:open";
         
         // 2. 커넥션 객체 생성 및 데이터베이스 연결
         conn = DriverManager.getConnection(jdbcUrl);
         
         // 3. Statement 객체 생성
         stmt = conn.createStatement();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="empReg.jsp">
	
		<table>
			<tr>
				<td>사원번호</td>
				<td><input type="text" value="" name="empno"></td>
			</tr>
			<tr>
				<td>사원이름</td>
				<td><input type="text" value="" name="ename">
				</td>
			</tr>
			<tr>
				<td>사원직급</td>
				<td><input type="text" value="" name="job"></td>
			</tr>
			<tr>
				<td coslpan="2"><input type="submit" value="추가"></td>
			</tr>
		</table>

	</form>
	
</body>
</html>