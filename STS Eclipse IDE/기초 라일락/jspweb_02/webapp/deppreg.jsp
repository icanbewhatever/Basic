<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*" %>
<%@ page import = "utils.DBConfig" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		out.println("부서정보처리");
		int did = Integer.parseInt(request.getParameter("did")); 
		
		//you need to parse the parameter as an int. The parameters are just "String" 
		//so you need to interpret it on the server as the type you expect
		//ex) studentId = Integer.parseInt(request.getParameter("StudentId"));
		
		
		String dname = request.getParameter("dname");
		String location = request.getParameter("location");
		String contact = request.getParameter("contact");
	
		//오라클 DB와 접속
		Connection connection = null;
     	PreparedStatement pstmt = null;
     	
       
       // 접속하기 
       try {
         //connection = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
         connection = DBConfig.getConnection();
         out.println("jsp계정 접속성공");
       }catch(Exception e) {
          out.println("jsp계정 접속실패");
          
       }      
       
       //폼 정보에서 받은 변수들 did, dname, location, contact 값
       try{ // sql문을 실행할 때 발생할 수 있는 예외들을 처리하기 위한 구문
    	   String sql = 
    	   "INSERT INTO DEPARTMENTS(DEPART_ID, DEPART_NAME, LOCATION, PHONE_NUMBER) VALUES(?,?,?,?)";
    	   pstmt = connection.prepareStatement(sql);
    	   pstmt.setInt(1, did); //1,2,3,4 물음표 번호순서
    	   pstmt.setString(2, dname);
    	   pstmt.setString(3, location);
    	   pstmt.setString(4, contact);
    	   
    	   int result = pstmt.executeUpdate();
    	   out.println("데이터입력결과" + result);
    	   
       }catch(SQLException se){
    	   
       }
	%>
	

	
</body>
</html>