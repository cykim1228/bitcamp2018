<%@page import="java.net.URLEncoder"%>
<%@page import="homepage.MemberInfo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

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

	String pass;

	Cookie cookie = null;
	
	// 아이디기억에 체크가 되어있으면 on 아닐경우 null
	String idsave = request.getParameter("idsave");

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

		String sql = "select * from member where id=?";

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, id);

		ResultSet rs = pstmt.executeQuery();
		rs.next();
		pass = rs.getString("password");

		if (pass.equals(password) && idsave != null && idsave.trim().equals("on")) {
			out.println("<script>");
			out.println("alert('로그인에 성공하였습니다.')");
			out.println("location.href = 'index.jsp'");
			out.println("</script>");
			session.setAttribute("login", id);
			cookie = new Cookie("id", java.net.URLEncoder.encode(id)); // ("키", 값)
			cookie.setMaxAge(60*60*24*365);
			response.addCookie(cookie);
		} else if (pass.equals(password) && idsave == null) {
			out.println("<script>");
			out.println("alert('로그인에 성공하였습니다.')");
			out.println("location.href = 'index.jsp'");
			out.println("</script>");
			session.setAttribute("login", id);
			cookie = new Cookie("id", null);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		} else if (idsave != null && idsave.trim().equals("on")) {
			out.println("<script>");
			out.println("alert('로그인에 실패하였습니다.')");
			out.println("location.href = 'loginForm.jsp'");
			out.println("</script>");
			cookie = new Cookie("id", java.net.URLEncoder.encode(id)); // ("키", 값)
			cookie.setMaxAge(60*60*24*365);
			response.addCookie(cookie);
		} else {
			out.println("<script>");
			out.println("alert('로그인에 실패하였습니다.')");
			out.println("location.href = 'loginForm.jsp'");
			out.println("</script>");
			cookie = new Cookie("id", null);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}

		System.out.print(session.getAttribute("login"));

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
<title>로그인 처리</title>
</head>
<body>

</body>
</html>