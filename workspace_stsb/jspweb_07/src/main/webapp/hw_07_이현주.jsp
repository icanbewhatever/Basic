<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	th {background-color: skyblue; width: 100px;}
	tr {text-align: center;}
	
</style>
</head>
<body>
	<h2>구구단</h2>
	
	<% 
	
	out.println("<table border = '1'>");
	out.println("<tr>");//행만들어 주기
	
	for(int i=2; i<10; i++){
			out.println("<th>" + i + "단</th>"); //행 상단 제목
			
	}
	out.println("</tr>");	
	
	
		for(int i=1; i<10; i++){
			
			out.println("<tr>");
			
			for (int j=2; j<10; j++){
			//컬럼 안 값
			out.println("<td>" + j + "x" + i + "=" + (j*i) + "</td>");
			}	
		out.println("</tr>");
		}
		
	out.println("</table>");
	
	%>
	
	
</body>
</html>