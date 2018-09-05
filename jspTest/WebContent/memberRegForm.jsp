<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/default.css">
</head>
<body>
	
	<%@ include file="common/header.jsp" %>
	
	<h2>회원가입</h2>
    <hr>
    <form>
        <table>
            <tr>
                <td>아이디(이메일)</td>
                <td><input type="text"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password"></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text"></td>
            </tr>
            <tr>
                <td>사진</td>
                <td><input type="file"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="회원가입"></td>
            </tr>

        </table>

    </form>
	
</body>
</html>