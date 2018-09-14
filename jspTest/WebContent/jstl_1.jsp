<%@page import="jspTest.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 
	List<String> members = new ArrayList<String>();
	members.add("김찬영");
	members.add("신동진");
	members.add("한겨레");
	members.add(null);
	members.add("김민수");
	
	request.setAttribute("members", members);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Test</title>
</head>
<body>

	<table border=1>

		<c:forEach var="name" items="${members}">

			<tr>
				<td>
					<c:out value="${name}" escapeXml="false">
					

						<span style="color: red;">이름 없음</span>

					</c:out>
				</td>
			</tr>

		</c:forEach>

	</table>
	
	<%
	
		Member member = new Member();
	
		member.setName("짠짠영");
		member.setEmail("crkim1228@naver.com");
	
		request.setAttribute("member", member);
		
	%>

	<c:set var="msg" value="JAVA" scope="page" />
	msg : ${msg} <br>
	msg : <%= pageContext.getAttribute("msg") %>
	
	<c:set target="${member}" property="email" value="test@test.com" />
	
	Member name = ${member.name} <br>
	Member email = ${member.email} 
	
	<hr>
	
	<c:set var="str" value="java" />
	
	msg : ${str} <br>
	
	<c:if test="${true}">
		참입니다.
	</c:if>
	
	<br>
	
	<c:if test="${str == 'java'}" var="result">
		Test Result : ${result}
	</c:if>
	
	<hr>
	
	<h3>
	
	<c:choose>
		<c:when test="${param.sel == 'a'}">
			a를 선택
		</c:when>
		<c:when test="${param.sel == 'b'}">
			b를 선택
		</c:when>
		<c:when test="${param.sel == 'c'}">
			c를 선택
		</c:when>
		<c:otherwise>
			a, b, c 이외의 선택
		</c:otherwise>
	</c:choose>
	
	</h3>
	
	<select>
		<option ${param.sel == 'a'?'selected':''}>a</option>
		<option ${param.sel == 'b'?'selected':''}>b</option>
		<option ${param.sel == 'c'?'selected':''}>c</option>
	</select>
	
	<hr>
	
	<ul>
	<c:forEach items="${members}" var="mem" begin="0" end="2" varStatus="status">
	
		<li>${status.index} - ${status.count} - ${mem}</li>
	
	</c:forEach>
	</ul>
	
	<table border="1">
	<tr>
	<c:forTokens var="sel" items="김찬영/010-9922-2292/crkim1228@naver.com/남양주" delims="/">
		<td> ${sel} </td>
	</c:forTokens>
	</tr>
	</table>
	
	
	<hr>
	
	<c:url value="/jstl_1.jsp" var="target">
		<c:param name="sel">c</c:param>
	</c:url>
	
	경로 : ${target}
	<br>
	<a href="${target}">choose.jsp = c를 선택</a>
	
</body>
</html>