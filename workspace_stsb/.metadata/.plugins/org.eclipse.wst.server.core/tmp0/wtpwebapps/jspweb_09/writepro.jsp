<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
<%@ page import = "utils.DBConfig" %>
<%@ page import = "java.util.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시판 등록 처리</h2>
	
	<%
		String employeeName = request.getParameter("employeeName");
		String postTitle = request.getParameter("postTitle");
		String postContent = request.getParameter("postContent");
		
		//오라클 DB와 접속
		Connection connection = null;
		PreparedStatement pstmt = null;
		
		// 접속하기 
	    try {
	      //connection = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
	      connection = DBConfig.getConnection();
	      out.println("디비접속성공 - 게시글 등록");
	    }catch(Exception e) {
	        out.println("에러로그: "+ e.getMessage());
	     } 
		
		try{
			String sql = "INSERT INTO BO_FREE(NAME, SUBJECT, CONTENT) VALUES(?,?,?)";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, employeeName);
			pstmt.setString(2, postTitle);
			pstmt.setString(3, postContent);
		
			 int result = pstmt.executeUpdate();
	    	 out.println("게시글등록결과" + result);
	    	 
	    	 if(result == 1){
	    		   out.println("<script>alert('게시판등록성공!!')</script>");
	    		   out.println("<script>location.href='board.jsp'</script>");
	    	   }else{//실패하면 다시 직원등록화면
	    		   out.println("<script>location.href='board.jsp'</script>");
	    	   }
	       }catch(SQLException se){
	    	   out.println("에러로그: " + se.getMessage());
	       }
		
	%>

</body>
</html>