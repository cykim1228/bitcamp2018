<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>

<%
	// 1. 데이터베이스 드라이버 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");

	Connection conn = null;
	PreparedStatement pstmt = null;

	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String pw = "1234";

	int total = 0;

	int resultCnt = 0;

	try {
		// 2. 커넥션 객체 생성 및 데이터베이스 연결
		conn = DriverManager.getConnection(url, user, pw);

		Statement stmt = conn.createStatement();

		// 3. PreparedStatement 객체 생성
		String sqlcount = "select count(*) from board"; // DB내의 자료개수를 찾는 SQL문

		ResultSet rs = stmt.executeQuery(sqlcount); // DB실행

		if (rs.next()) { // rs.next()의 반환값은 true or false. 찾는결과가 있으면 true
			total = rs.getInt(1); // SELECT문의 첫번째 필드 여기선 COUNT(*)
		}

		out.print("총 게시물 : " + total + "개"); // 게시물수 출력

		String sql = "select board_num, board_id, board_title, board_regdate, board_hit from board order by board_num desc";
		// board 테이블에 있는 Num, UserName, title, time, hit의 값을 가져오되 Num을 기준으로 내림차순정렬

		rs = stmt.executeQuery(sql); // DB실행
%>

<html>
<head>

<title>전체 게시글</title>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/list.css?after">

<style type="text/css">
#tttt {
	width: 800px;
	margin: 0 auto 0 auto;
}

#topForm {
	text-align: right;
}

#board, #pageForm, #searchForm {
	text-align: center;
}

#bList {
	text-align: center;
}
</style>

<script type="text/javascript">
	function writeForm() {
		location.href = "BoardWriteForm.jsp";
	}
</script>

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

	<div id="tttt">

		<!-- 글목록 위 부분-->
		<br>
		<div id="topForm">
			<c:if test="${sessionScope.login != null}">
				<input type="button" value="글쓰기" onclick="writeForm()">
			</c:if>
		</div>

		<!-- 게시글 목록 부분 -->
		<br>
		<div id="board">
			<table id="bList" width="800" border="3" bordercolor="lightgray">
				<tr height="30">
					<td>글번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>

				<%
					if (total == 0) {
				%>
				<tr align="center" bgcolor="#FFFFFF" height="30">
					<td colspan="6">등록된 글이 없습니다.</td>
				</tr>
				<%
					} else {

							while (rs.next()) {
								int idx = rs.getInt(1);
								String name = rs.getString(2);
								String title = rs.getString(3);
								String time = rs.getString(4);
								int hit = rs.getInt(5);
				%>
				<tr height="25" align="center">
					<td><%=idx%></td>
					<td align="left"><a href="viewForm.jsp?idx=<%=idx%>"><%=title%></a></td>
					<td align="center"><%=name%></td>
					<td align="center"><%=time%></td>
					<td align="center"><%=hit%></td>
				</tr>
				<tr height="1" bgcolor="#D2D2D2">
					<td colspan="6"></td>
				</tr>
				<%
					}
						}
						rs.close();
						stmt.close();
						conn.close();
					} catch (SQLException e) {
						out.println(e.toString());
					}
				%>

			</table>
		</div>

		<!-- 페이지 넘버 부분 -->
		<br>
		<div id="pageForm">
			<c:if test="${startPage != 1}">
				<a href='BoardListAction.bo?page=${startPage-1}'>[이전]</a>
			</c:if>

			<c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
				<c:if test="${pageNum == spage}">
                ${pageNum}&nbsp;
            </c:if>
				<c:if test="${pageNum != spage}">
					<a href='BoardListAction.bo?page=${pageNum}'>${pageNum}&nbsp;</a>
				</c:if>
			</c:forEach>

			<c:if test="${endPage != maxPage }">
				<a href='BoardListAction.bo?page=${endPage+1 }'>[다음]</a>
			</c:if>
		</div>

		<!--  검색 부분 -->
		<br>
		<div id="searchForm">
			<form>
				<select name="opt">
					<option value="0">제목</option>
					<option value="1">내용</option>
					<option value="2">제목+내용</option>
					<option value="3">글쓴이</option>
				</select> <input type="text" size="20" name="condition" />&nbsp; <input
					type="submit" value="검색" />
			</form>
		</div>
	</div>

</body>
</html>