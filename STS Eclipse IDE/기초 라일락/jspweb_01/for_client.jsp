<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>폼 데이터 전송 화면</h2>
	
	<!-- action: 결과를 전송해서 표시할 jsp파일, GET: 값을 텍스트형태로 넘겨준다-->
	<form action = "pro_server.jsp" method = "GET">
		<p>
			<label>이름:</label>
			<input type = "text" name = "name" >
		</p>
		
		<p>
			<label>이메일:</label>
			<input type = "text" name = "email" >
		</p>
		
		<p>
			<input type = "submit" value = "전송" >
		</p>
	
	</form>
</body>
</html>
