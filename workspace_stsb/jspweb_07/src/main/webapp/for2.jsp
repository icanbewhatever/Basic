<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>jsp를 사용해 테이블 구현</h2>
	
	<%
		// 이름 저장 배열
		ArrayList<String> name = new ArrayList<String>();
		name.add("김씨");
		name.add("이씨");
		name.add("박씨");
		ArrayList<String> departName = new ArrayList<String>();
		departName.add("기획팀");
		departName.add("개발팀");
		departName.add("보안팀");
		
		out.println("<table border = '1'>");
		out.println("<tr>"); //행
		out.println("<th>직원명</th>"); //컬럼제목
		out.println("<th>부서명</th>");
		out.println("</tr>");
		
		for(int i=0; i<name.size(); i++){
			
			out.println("<tr>");
			out.println("<td>" + name.get(i) + "</td>");
			out.println("<td>" + departName.get(i) + "</td>");
			out.println("</tr>");
		}
		
		out.print("</table>");
	%>
	
	
</body>
</html>