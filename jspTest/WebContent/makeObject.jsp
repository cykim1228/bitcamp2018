<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="jspTest.MemberInfo" scope="request" />

<% 
	member.setId("zzan");
	member.setName("김찬영");
%>

<jsp:forward page="useObject.jsp" />