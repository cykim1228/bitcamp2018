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
		</tr>
		
		<c:forEach var="i" items="${applicationScope.members}">

			<tr>
				<td>${i.id}</td>
				<td>${i.password}</td>
				<td>${i.name}</td>
				<td>${i.birthDate}</td>
				<td>${i.gender}</td>
				<td>${i.email}</td>
				<td>${i.phoneNumber}</td>
				<td><fmt:formatDate value="${dateValue}" pattern="yyyy/MM/dd" /></td>
			</tr>

		</c:forEach>
	</table>
</body>
</html>