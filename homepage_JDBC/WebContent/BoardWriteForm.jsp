<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String id = (String) session.getAttribute("login");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/list.css?after">

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

	<br>
	<b><font size="6" color="gray">글쓰기</font></b>
	<br>

	<form action="write.jsp" enctype="multipart/form-data">
		<input type="hidden" name="board_id" value="${sessionScope.login}">
		<table width="700" border="3" bordercolor="lightgray" align="center">
			<tr>
				<td id="title">작성자</td>
				<td><input type="text" id="id" name="id" value="<%=id%>"
					readonly></td>
			</tr>
			<tr>
				<td id="title">제 목</td>
				<td><input name="board_title" type="text" size="70"
					maxlength="100" value="" /></td>
			</tr>
			<tr>
				<td id="title">내 용</td>
				<td><textarea name="board_content" cols="72" rows="20"></textarea>
				</td>
			</tr>
			<tr>
				<td id="title">파일첨부</td>
				<td><input type="file" name="board_file" /></td>
			</tr>

			<tr align="center" valign="middle">
				<td colspan="5"><input type="reset" value="작성취소"> <input
					type="submit" value="등록"> <input type="button" value="뒤로"
					OnClick="javascript:history.back(-1)"></td>
			</tr>
		</table>
	</form>

</body>
</html>