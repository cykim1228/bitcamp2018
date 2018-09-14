<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
%>
 
<jsp:useBean id="member" class="jspTest.MemberInfo" />
<jsp:setProperty property="*" name="member" />
<jsp:setProperty property="password" name="member" value="<%= member.getId() %>" />
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 정보</title>
</head>
<body>

<h2>회원가입 정보</h2>
<table>

            <tr>
                <td>아이디(이메일)</td>
                <td><%= member.getId() %> / ${member.id}</td>
            </tr>
            <tr>
                <td>이름</td>
                <td><%= member.getName() %></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><%= member.getPassword() %></td>
            </tr>
            <tr>
                <td>주소</td>
                <td><%= member.getAddress() %></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><%= member.getEmail() %></td>
            </tr>
            <tr>
                <td>사진</td>
                <td></td>
            </tr>

        </table>
        
</body>
</html>