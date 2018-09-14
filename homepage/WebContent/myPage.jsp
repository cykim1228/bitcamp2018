<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");

	
	String id = (String)request.getSession(false).getAttribute("userId");
	String pw = (String)request.getSession(false).getAttribute("password");
	String name = (String)request.getSession(false).getAttribute("userName");
	
	if(id == null) {
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
<link rel="stylesheet" href="css/default.css">

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

	<%@ include file="header.jsp" %>
	
	<h2>마이 페이지</h2>
    <hr>
        <table>
            <tr>
                <td>아이디(이메일)</td>
                <td><%= id %></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><%= pw %></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><%= name %></td>
            </tr>
            <tr>
                <td>사진</td>
                <td>
                <div id="memberPhoto">
                	
                </div>
                </td>
            </tr>

        </table>

</body>
</html>

<% } %>