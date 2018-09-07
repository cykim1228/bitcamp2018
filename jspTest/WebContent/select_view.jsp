<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>

<% 

	// 1. 사용자가 요청한 데이터 받기
	// 2. 분석
	// 3. 처리 -> 결과 -> 기본객체에 속성으로 저장
	// 4. 응답 페이지 지정
	// 5. 포워딩

	String code = request.getParameter("code");
	String viewPage = ""; // 초기화
	
	if (code.equals("A")) {
		
		// 결과 데이터
		Date date = new Date();
		request.setAttribute("result", date);
		viewPage = "view/a.jsp";
		
	} else if (code.equals("B")) {
		
		String str = "Hello~!!";
		request.setAttribute("result", str);
		viewPage = "view/b.jsp";
		
	} else if (code.equals("C")) {
		
		int age = 27;
		request.setAttribute("result", age); // 자동 객체 변환
		viewPage = "view/c.jsp";
		
	}
	
%>

	<jsp:forward page="<%= viewPage %>" />
	
	