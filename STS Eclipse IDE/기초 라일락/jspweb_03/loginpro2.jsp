<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="utils.DBConfig" %> <!-- 다른경로의 자바파일호출 -->
<%@ page import ="java.sql.*" %>  <!-- 오라클 쿼리를 동작하기 위한 라이브러리 호출 -->


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>사용자 인증 처리</h2>
	
	<%
		int empid = Integer.parseInt(request.getParameter("employeeId")); //loginform에 작성된 name 값 넣어주기
		String userpw = request.getParameter("userPw");
		
		Connection connection = null; //디비 접속 성공시 접속 정보 저장
		PreparedStatement pstmt = null; //쿼리를 실행하는 객체 정보
		ResultSet resultSet = null;		//select 결과를 저장하는 정보
		
		//오라클 데이터베이스 접속
		try{
			connection = DBConfig.getConnection(); //주의 : 위에 null 이기 때문에 꼭 connection = 을 넣어 접속 성공시 접속 정보 저장 
			out.println("접속성공");
		}catch(Exception se){
			out.println("실패");
		}
		
		//아이디 비번 체크 코드
		
		int dbid;
		String dbpw;
	
		try{
			String sql = "SELECT EMPLOYEE_ID, USER_PW FROM EMPLOYEES WHERE EMPLOYEE_ID =?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, Integer.valueOf(empid));  //문자를 숫자로 바꿔준다 js에서는 parse
			//pstmt.setString(2, userpw);
			resultSet = pstmt.executeQuery(); // executeQuery: select 일 때 executeUpdate: insert, delete, update
			
			dbid = 0;
			dbpw = "";
			while(resultSet.next()){
				dbid = resultSet.getInt("EMPLOYEE_ID");
				dbpw = resultSet.getString("USER_PW");
				out.println("결과 result:" + dbid); //1이면 아이디 비번 존재, 0이면 존재하지 않음
				out.println("결과 result2:" + dbpw); //1이면 아이디 비번 존재, 0이면 존재하지 않음
			}
			if(dbid == empid && dbpw.equals(userpw)){ //로그인 성공시 -> main.jsp 로 이동
				out.println("<script>alert('로그인성공!!')</script>");
				out.println("<script>location.href = 'main.jsp'</script>");
			}else{ //로그인 실패시 -> loginform.jsp 로 이동
				out.println("<script>location.href = 'loginform.jsp'</script>");
			}
		}catch(SQLException se){
			out.println("에러로그: " + se.getMessage());
		}
			//if(result == 1){ //로그인 성공시 -> main.jsp 로 이동
			//	out.println("<script>location.href = 'main.jsp'</script>");
			//}else{ //로그인 실패시 -> loginform.jsp 로 이동
			//	out.println("<script>location.href = 'loginform.jsp'</script>");
			//}
			
		
		
	%>
	
	
	
</body>
</html>








