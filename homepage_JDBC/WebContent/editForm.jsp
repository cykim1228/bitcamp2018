<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
%>

<%
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

	String list_sql = "select id, password, name, birthdate, gender, email, phonenumber from member where id='" + id + "'";

	// 4. 쿼리 실행
	rs = stmt.executeQuery(list_sql); // 실행할 쿼리문 뒤로 실행문을 넣어준다.

	String password = "";
	String name = "";
	String birthdate = "";
	String gender = "";
	String email = "";
	String phonenumber = "";

	if (rs.next()) {
		password = rs.getString("password");
		name = rs.getString("name");
		birthdate = rs.getString("birthdate");
		gender = rs.getString("gender");
		email = rs.getString("email");
		phonenumber = rs.getString("phonenumber");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정 양식</title>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="css/joinForm.css?after">

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

	<form action="edit.jsp">
		<div>
			<h4>아이디</h4>
			<input type="text" id="textbox" name="id" value="<%=id%>" readonly>
		</div>
		<div>
			<h4>비밀번호</h4>
			<input type="password" id="textbox" name="password"
				value="<%=password%>">
		</div>
		<div>
			<h4>비밀번호 재확인</h4>
			<input type="password" id="textbox">
		</div>
		<div>
			<h4>이름</h4>
			<input type="text" id="textbox" name="name" value="<%=name%>">
		</div>
		<div>
			<h4>생년월일</h4>
			<input type="text" id="bb" name="birthyear"> <select id="bb" name="birthmonth">
				<option value="월">월</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select> <input type="text" id="bb" name="birthday">
		</div>
		<div>
			<h4>성별</h4>
			<select id="gb" name="gender">
				<option value="성별">성별</option>
				<option value="남자">남자</option>
				<option value="여자">여자</option>
			</select>
		</div>
		<div>
			<h4>본인 확인 이메일(선택)</h4>
			<input type="text" id="textbox" name="email" value="<%=email%>">
		</div>
		<div>
			<h4>휴대전화</h4>
			<select id="gbr">
				<option value="82">대한민국 +82</option>
				<option value="30">그리스 +30</option>
				<option value="49">독일 +49</option>
				<option value="52">멕시코 +52</option>
			</select> <input type="text" id="pb" name="phonenumber"><input
				type="button" id="pbr" value="인증번호 받기"> <input type="text"
				id="textboxr">
		</div>

		<div>
			<input type="submit" id="joinbutton" value="수정하기">
		</div>

	</form>

</body>
</html>