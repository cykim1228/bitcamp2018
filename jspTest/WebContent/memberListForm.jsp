<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	String userName = request.getParameter("userName");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/default.css">

<style>
	td {
		padding: 10px;
	}
</style>

</head>
<body>
	
	<%@ include file="common/header.jsp" %>
	
	<h2>회원 리스트</h2>
    <hr>
    <form>
        <table border="1">
        
            <tr>
                <td>아이디(이메일)</td>
                <td>비밀번호</td>
                <td>이름</td>
                <td>사진</td>
            </tr>
            <tr>
                <td><%= userId %></td>
                <td><%= password %></td>
                <td><%= userName %></td>
                <td></td>
            </tr>

        </table>

    </form>
	
</body>
</html>