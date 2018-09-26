<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("euc-kr"); //받아오는 값들을 한글로 인코딩합니다.

	String id = request.getParameter("id"); // BoardWriteForm.jsp에서 name에 입력한 데이터값
	String board_title = request.getParameter("board_title"); // BoardWriteForm.jsp에서 title에 입력한 데이터값
	String board_content = request.getParameter("board_content"); // BoardWriteForm.jsp에서 content에 입력한 데이터값
	
	// 1. 데이터베이스 드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");

		Connection conn = null;
		PreparedStatement pstmt = null;

		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "scott";
		String pw = "1234";
		
		int resultCnt = 0;
		
		try {
			// 2. 커넥션 객체 생성 및 데이터베이스 연결
			conn = DriverManager.getConnection(url, user, pw);

			// 3. PreparedStatement 객체 생성
			String sql = "insert into board (board_num, board_id, board_title, board_content) values (board_num.nextval, ?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, board_title);
			pstmt.setString(3, board_content);
			
			pstmt.executeUpdate();
			
			
		} finally {
			pstmt.close();
			conn.close();
		}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 처리</title>
</head>
<body>

<script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="BoardListForm.jsp"; 
</script>

</body>
</html>