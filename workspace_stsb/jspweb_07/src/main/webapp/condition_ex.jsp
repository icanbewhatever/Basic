<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <h2>학점 계산 예제</h2>
	
	<%
		int score = 83;
	
		//조건문을 A, B, C, D로 판별하는 코드 구현
		//성적이 83이면 B
		
		
		if(score >= 90){
			out.println(score +"점수는 A학점입니다.");
		}else if(score >= 80){
			out.println(score +"점수는 B학점입니다.");
		}else if(score >= 70){
			out.println(score +"점수는 C학점입니다.");
		}else{
			out.println(score +"점수는 D학점입니다.");
		}
	%>
	
</body>
</html>