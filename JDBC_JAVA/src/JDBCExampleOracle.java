import java.sql.*;

public class JDBCExampleOracle {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Connection conn = null;
		
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. 데이터베이스 연결
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "scott";
			String pw = "1234";
			
			conn = DriverManager.getConnection(url, user, pw);
			
			System.out.println("데이터베이스에 접속했습니다.");
			// 3. 데이터베이스 작업 
			
			
			// 4. 데이터베이스 연결 종료
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
