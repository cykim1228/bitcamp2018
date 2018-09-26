<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");

	String id = (String) session.getAttribute("login");
	
	String login = (String) request.getSession(false).getAttribute("login");

	// 1. 데이터베이스 드라이버 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String pw = "1234";

	// 2. 커넥션 객체 생성 및 데이터베이스 연결
	conn = DriverManager.getConnection(url, user, pw);

	// 3. Statement 객체 생성
	stmt = conn.createStatement();

	String list_sql = "select id, password, name, birthdate, gender, email, phonenumber, regdate from member where id='" + id + "'";

	// 4. 쿼리 실행
	rs = stmt.executeQuery(list_sql); // 실행할 쿼리문 뒤로 실행문을 넣어준다.

	String password = "";
	String name = "";
	String birthdate = "";
	String gender = "";
	String email = "";
	String phonenumber = "";
	String regdate = "";

	while (rs.next()) {
		password = rs.getString("password");
		name = rs.getString("name");
		birthdate = rs.getString("birthdate");
		gender = rs.getString("gender");
		email = rs.getString("email");
		phonenumber = rs.getString("phonenumber");
		regdate = rs.getString("regdate");
	}
	
	if(login == null) {
	
%>

<script>
	alert('로그인 후 사용가능한 서비스입니다.');
	location.href = 'loginForm.jsp';
</script>

<%
	} else {
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지 양식</title>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/joinForm.css?after">

<style>
h2, td {
	padding: 10px;
}

#memberPhoto {
	background-image: url('images/images.png');
	background-size: 100%;
	width: 150px;
	height: 150px;
	border: 1px solid black;
	border-radius: 700px;
	margin: 20px;
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

	<div>
		<h4>아이디</h4>
		<input type="text" id="textbox" name="id" value="<%=id%>" readonly>
	</div>
	<div>
		<h4>비밀번호</h4>
		<input type="password" id="textbox" name="password"
			value="<%=password%>" readonly>
	</div>
	<div>
		<h4>이름</h4>
		<input type="text" id="textbox" name="name" value="<%=name%>" readonly>
	</div>
	<div>
		<h4>생년월일</h4>
		<input type="text" id="textbox" name="birthdate"
			value="<%=birthdate%>" readonly>
	</div>
	<div>
		<h4>성별</h4>
		<input type="text" id="textbox" name="gender" value="<%=gender%>"
			readonly>
	</div>
	<div>
		<h4>이메일</h4>
		<input type="text" id="textbox" name="email" value="<%=email%>"
			readonly>
	</div>
	<div>
		<h4>휴대전화</h4>
		<input type="text" id="textbox" name="phonenumber"
			value="<%=phonenumber%>" readonly>
	</div>
	<div>
		<h4>가입날짜</h4>
		<input type="text" id="textbox" name="regdate" value="<%=regdate%>"
			readonly>
	</div>

</body>
</html>

<% } %>