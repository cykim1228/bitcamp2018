<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String empno = request.getParameter("empno");
%>

<%

         // 1. 데이터베이스 드라이버 로드
         Class.forName("oracle.jdbc.driver.OracleDriver");
      
         Connection conn = null;
         Statement stmt = null;
         ResultSet rs = null;
         
         String url = "jdbc:oracle:thin:@localhost:1521:orcl";
         String user = "scott";
         String password = "1234";
         
         // 2. 커넥션 객체 생성 및 데이터베이스 연결
         conn = DriverManager.getConnection(url, user, password);
         
         // 3. Statement 객체 생성
         stmt = conn.createStatement();
         
         String list_sql = "select empno, ename, job from emp where empno=" + empno ;
         
         // 4. 쿼리 실행
         rs = stmt.executeQuery(list_sql); // 실행할 쿼리문 뒤로 실행문을 넣어준다.
         
         String ename = "";
         String job = "";
         
         if( rs.next() ) {
        	 ename = rs.getString("ename");
        	 job = rs.getString("job");
         }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="edit.jsp">

		<table>
			<tr>
				<td>사원번호</td>
				<td><input type="text" value="<%= empno %>" name="empno"
					readonly></td>
			</tr>
			<tr>
				<td>사원이름</td>
				<td><input type="text" value="<%= ename %>" name="ename">
				</td>
			</tr>
			<tr>
				<td>사원직급</td>
				<td><input type="text" value="<%= job %>" name="job"></td>
			</tr>
			<tr>
				<td coslpan="2"><input type="submit" value="수정"></td>
			</tr>
		</table>

	</form>



</body>
</html>