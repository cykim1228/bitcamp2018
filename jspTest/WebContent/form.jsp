<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<td>좋아하는 동물</td>
				<td>
					<input type="checkbox" name="pet" value="dog"> 강아지
					<input type="checkbox" name="pet" value="cat"> 고양이
					<input type="checkbox" name="pet" value="pig"> 돼지
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>