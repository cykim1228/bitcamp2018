import java.sql.*;

public class JDBCExampleOracleInsert {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. 데이터베이스 연결
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "scott";
			String pw = "1234";
			
			// 3. 커넥션 객체 생성
			conn = DriverManager.getConnection(url, user, pw);
			
			System.out.println("데이터베이스에 접속했습니다.");
			
			// 4. Statement 객체 생성
			stmt = conn.createStatement();
			String sql = "INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			
			// 5. 쿼리 실행
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				
			} else {
				
				
				
			}
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1111);
			pstmt.setString(2, "김찬영");
			pstmt.setString(3, "개발자");
			pstmt.setInt(4, 8000);
			pstmt.setString(5, "18-09-01");
			pstmt.setInt(6, 5000);
			pstmt.setString(7, null);
			pstmt.setInt(8, 50);
			
			java.util.Date utilDate = new java.util.Date();
		    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			
			int procNum = pstmt.executeUpdate();
			
			System.out.println(procNum + "개 행이 적용되었습니다.");
			
			// 6. 데이터베이스 연결 종료
			conn.close();
			
		} catch (ClassNotFoundException cnfe) {
			System.out.println("해당 클래스를 찾을 수 없습니다." + cnfe.getMessage());
			
			cnfe.printStackTrace();
			
		} catch (SQLException se) {
			System.out.println("에러 발생" + se.getMessage());
			
			se.printStackTrace();
			
		}
		
	}

}
