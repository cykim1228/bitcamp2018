<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>숫자 포멧</h1>
	
	<h2>
	
	<c:set var="price" value="100000"/>
	
	<fmt:formatNumber value="${price}" type="number" var="numberType" scope="session" />
	
	${numberType}
	
	<br>
	
	통화 : <fmt:formatNumber value="${price}" type="currency" currencySymbol="$" />
	
	<br>
	
	퍼센트 : <fmt:formatNumber value="${price/1000000}" type="percent" groupingUsed="%" />
	
	<br>
	
	패턴 : <fmt:formatNumber value="${price}" pattern="0,000,000,000.00" />
	
	</h2>
	
	<hr>
	
	<h1>날짜 포멧</h1>
	
	<c:set var="now" value="<%= new java.util.Date() %>" />
	
	<fmt:formatDate value="${now}" type="date" dateStyle="full" /> <br>
	<fmt:formatDate value="${now}" type="date" dateStyle="short" /> <br>
	<br>
	
	<fmt:formatDate value="${now}" type="time" timeStyle="full" /> <br>
	<fmt:formatDate value="${now}" type="time" timeStyle="short" /> <br>
	<br>
	
	<fmt:formatDate value="${now}" type="both" timeStyle="full" dateStyle="full" /> <br>
	<fmt:formatDate value="${now}" type="both" timeStyle="short" dateStyle="short" /> <br>
	<br>
	
	<fmt:formatDate value="${now}" pattern="z a h:mm" /> <br>
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /> <br>
	<fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /> <br>
	<fmt:formatDate value="${now}" pattern="yyyy/MM/dd. h:mm" /> <br>
	
	<hr>
	
	<h1>function</h1>
	
	<c:set var="str1" value="Functions <태그>를 사용합니다." />
	
	<c:set var="str2" value="사용" />
	
	<c:set var="tokens" value="1, 2, 3, 4, 5, 6, 7, 8, 9, 10" />
	
	length(str1) = ${fn:length(str1)} <br>
	toUpperCase(str1) = "${fn:toUpperCase(str1)}" <br>
	toLowerCase(str1) = "${fn:toLowerCase(str1)}" <br>
	substring(str1, 3, 6) = "${fn:substring(str1, 3, 6)}" <br>
	substringAfter(str1, str2) = "${fn:substringAfter(str1, str2)}" <br>
	substringBefore(str1, str2) = "${fn:substringBefore(str1, str2)}" <br>
	trim(str1) = "${fn:trim(str1)}" <br> 
	replace(str1, src, dest) = "${fn:replace(str1, " ", "-")}" <br>
	indexOf(str1, str2) = "${fn:indexOf(str1, str2)}" <br>
    startsWith(str1, str2) = "${fn:startsWith(str1, 'Fun')}" <br>
    endsWith(str1, str2) = "${fn:endsWith(str1, "합니다.")}" <br>
    contains(str1, str2) = "${fn:contains(str1, str2)}" <br>
    containsIgnoreCase(str1, str2) = "${fn:containsIgnoreCase(str1, str2)}" <br>
   	<c:set var="array" value="${fn:split(tokens, ',')}" />
   	join(array, "-") = "${fn:join(array, "-")}" <br>
    escapeXml(str1) = "${fn:escapeXml(str1)}" <br>
	
</body>
</html>