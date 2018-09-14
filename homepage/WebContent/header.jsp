<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>헤더</title>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css?after" rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>

</head>
<body>

	<div class="row">
		<div class="col-md-12">

			<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
				<div class="container-fluid">
					<a class="navbar-brand" href="index.jsp" style="color:white" 
					onmouseover="this.style.color='#32cd32'" onmouseout="this.style.color='#ffffff'">HOME</a>
					<a class="navbar-brand" href="joinForm.jsp" style="color:white" 
					onmouseover="this.style.color='#32cd32'" onmouseout="this.style.color='#ffffff'">JOIN</a>
					<%
						String lid = (String) request.getSession(false).getAttribute("userId");

						if (lid == null) {
					%>
					<a class="navbar-brand" href="loginForm.jsp" style="color:white" 
					onmouseover="this.style.color='#32cd32'" onmouseout="this.style.color='#ffffff'">LOGIN</a>
					<%
						} else {
					%>
					<a class="navbar-brand" href="logout.jsp" style="color:white" 
					onmouseover="this.style.color='#32cd32'" onmouseout="this.style.color='#ffffff'">LOGOUT</a>
					<%
						}
					%>
					<a class="navbar-brand" href="myPage.jsp" style="color:white" 
					onmouseover="this.style.color='#32cd32'" onmouseout="this.style.color='#ffffff'">MYPAGE</a>
					<a class="navbar-brand" href="memberList.jsp" style="color:white" 
					onmouseover="this.style.color='#32cd32'" onmouseout="this.style.color='#ffffff'">LIST</a>
				</div>
			</nav>

		</div>
	</div>

</body>
</html>