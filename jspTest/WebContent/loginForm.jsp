<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 양식</title>
<link rel="stylesheet" href="css/default.css">
</head>
<body>

	<%@ include file="common/header.jsp" %>
	
	<h2>로그인</h2>
    <hr>
    <form action="login.jsp" method="post">
        <table>
            <tr>
                <td>아이디</td>
                <td><input type="text" name="userId"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="password"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="로그인"></td>
            </tr>

        </table>

    </form>

</body>
</html>