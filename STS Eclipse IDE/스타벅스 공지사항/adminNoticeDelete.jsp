<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.Exception" %>    
<%@ page import="java.sql.*" %>
<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	
	String num = request.getParameter("num");
	
	String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
  String USER = "test";
  String PASSWORD = "1234";
	
  Connection conn = null; //디비 접속 성공시 접속 정보 저장
	PreparedStatement pstmt = null; // 쿼리 실행문
	
	Exception exception = null;
	
  try {
	  //0
	  Class.forName("oracle.jdbc.driver.OracleDriver"); //오라클이 작동이 잘 안될때 넣어주면 좋다
	
	  // 1. JDBC로 Oracle연결
	  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
	  
		// 2. BO_FREE 테이블에 화면 폼으로부터 가져온 데이터 입력
		String deleteQuery = "DELETE FROM BO_FREE WHERE NUM =" + num;
		pstmt = conn.prepareStatement(deleteQuery);
		
		pstmt.executeUpdate();
		
  } catch(Exception e) {
	  exception = e;
	  e.printStackTrace();
  } finally {
	  if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
	  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
  }
%>

<%
	if (exception == null) {	// 공지사항 글 삭제 성공할 경우
		// 1. 성공 팝업 생성
		// 2. 공지사항 리스트로 이동
%>		
<!-- 성공 케이스 html/css/js -->
<script>
	alert('공지사항 글이 성공적으로 삭제되었습니다.');	// 1
	location.href = '<%= request.getContextPath() %>/adminNoticeList.jsp';
</script>
<%
	} else {									// 공지사항 글 수정이 실패할 경우
		// 1. 실패글
		// 2. 오류내용 표시
%>
<!-- 실패 케이스 html/css/js -->
공지사항 글 삭제 실패하였습니다. 시스템 관리자에게 문의하세요.<br>
오류내용: <%= exception.getMessage() %>
<%	
	}
%>







