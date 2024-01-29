<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
		//아이디와 비빌번호를 받아 출력해라
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		out.println("<h2>폼 데이터 출력 결과</h2>");
		out.println("<p>아이디" + id + "</p>");
		out.println("<p>비밀번호" + pw + "</p>");
		
	%>
</body>
</html>