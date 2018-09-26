<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%

	//1. 데이터베이스 드라이버 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String pw = "1234";

	// 2. 커넥션 객체 생성 및 데이터베이스 연결
	conn = DriverManager.getConnection(url, user, pw);

	// 3. Statement 객체 생성
	stmt = conn.createStatement();

	int idx = Integer.parseInt(request.getParameter("idx"));
	
	try {
		stmt = conn.createStatement();
		String sql = "select board_id, board_title, board_content, board_regdate, board_hit from board where board_num=" + idx;
		
		rs = stmt.executeQuery(sql);
		
		if (rs.next()) {
			String board_id = rs.getString(1);
			String board_title = rs.getString(2);
			String board_content = rs.getString(3);
			String board_regdate = rs.getString(4);
			int board_hit = rs.getInt(5);
			board_hit++;
			
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 보기</title>
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


	<table align="center">
		<tr>
			<td>
				<table cellpadding="0" cellspacing="0" border="0">
					<tr
						style="background: url('img/table_mid.gif') repeat-x; text-align: center;">
						<td width="5"><img src="img/table_left.gif" width="5"
							height="30" /></td>
						<td>내 용</td>
						<td width="5"><img src="img/table_right.gif" width="5"
							height="30" /></td>
					</tr>
				</table>
				<table>
					<tr>
						<td align="center" width="76">글번호</td>
						<td width="400"><%=idx%></td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td align="center" width="76">조회수</td>
						<td width="400"><%=board_hit%></td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td align="center" width="76">이름</td>
						<td width="400"><%=board_id%></td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td align="center" width="76">작성일</td>
						<td width="400"><%=board_regdate%></td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td align="center" width="76">제목</td>
						<td width="400"><%=board_title%></td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0"></td>
						<td width="399" colspan="2" height="200"><%=board_content%>
					</tr>
					<%
						sql = "update board set board_hit=" + board_hit + " where board_num=" + idx;
								stmt.executeUpdate(sql);
								rs.close();
								stmt.close();
								conn.close();
							}
						} catch (

						SQLException e) {
						}
					%>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="4" width="407"></td>
					</tr>
					<tr align="center">
						<td width="0">&nbsp;</td>
						<td colspan="2" width="399"><input type=button value="글쓰기"
							OnClick="window.location='BoardWriteForm.jsp'"> <input type=button
							value="답글"> <input type=button value="목록"
							OnClick="window.location='BoardListForm.jsp'"> <input type=button
							value="수정"> <input type=button value="삭제">
						<td width="0">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

</body>
</html>