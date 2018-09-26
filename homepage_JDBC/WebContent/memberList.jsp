<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>

<%@page import="homepage.MemberInfo"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="dateValue" class="java.util.Date" />

<jsp:setProperty property="time" name="dateValue"
	value="${timestampValue}" />

<c:set var="dateValue" value="<%=new java.util.Date()%>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="css/list.css?after">

<style>
#membertable {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
    align-content: center;
}

#membertable td, #membertable th {
    border: 1px solid #ddd;
    padding: 8px;
}

#membertable tr:nth-child(even){background-color: #f2f2f2;}

#membertable tr:hover {background-color: #ddd;}

#membertable th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>

</head>
<body>

	<div id="wrap">
		<div id="header">
			<!--        로고 버튼    -->
			<h1>
				<a href="http://www.naver.com" class="logo"> <span class="blind">NAVER</span>
				</a>
			</h1>
		</div>
	</div>

	<table id="membertable">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>성별</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>가입날짜</th>
			<th>관리</th>
		</tr>

		<%
         // 1. 데이터베이스 드라이버 로드
         // Class.forName("oracle.jdbc.driver.OracleDriver");
      
         Connection conn = null;
         Statement stmt = null;
         ResultSet rs = null;
         
         String url = "jdbc:oracle:thin:@localhost:1521:orcl";
         String user = "scott";
         String pw = "1234";
         
         try{
         // 2. 커넥션 객체 생성 및 데이터베이스 연결
         conn = DriverManager.getConnection(url, user, pw);
         
         // 3. Statement 객체 생성
         stmt = conn.createStatement();
         
         String list_sql = "select id, password, name, birthdate, gender, email, phonenumber, regdate from member order by id";
         
         // 4. 쿼리 실행
         rs = stmt.executeQuery(list_sql); // 실행할 쿼리문 뒤로 실행문을 넣어준다.
         
         if(rs.next()){
            do{
            %>
		<tr>
			<td><%=rs.getString("id") %></td>
			<td><%=rs.getString("password") %></td>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getDate("birthdate") %></td>
			<td><%=rs.getString("gender") %></td>
			<td><%=rs.getString("email") %></td>
			<td><%=rs.getString("phonenumber") %></td>
			<td><%=rs.getDate("regdate") %></td>
			<td><a href="editForm.jsp?id=<%= rs.getString("id") %>">수정</a>
			<a href="delete.jsp?id=<%= rs.getString("id") %>">삭제</a></td>
		</tr>
		<%
            } while(rs.next());
         }else{
            %>
		<tr>
			<td colsapan=3>등록된 회원정보가 없습니다.</td>
		</tr>
		<% 
         }
         
         } finally {
            if(rs!=null){
               try{
                  rs.close();
               } catch(SQLException e){
                  e.printStackTrace();
               }
            }
            if(stmt!=null){
               try{
                  stmt.close();
               } catch(SQLException e){
                  e.printStackTrace();
               }
            }
            if(conn!=null){
               try{
                  conn.close();
               } catch(SQLException e){
                  e.printStackTrace();
               }   
            }
         }
         
      %>
	</table>
	
</body>
</html>