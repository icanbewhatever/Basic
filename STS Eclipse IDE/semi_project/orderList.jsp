<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.lang.Exception, java.sql.SQLException" %>    

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 목록</title>
    <link rel="icon" href="./favicon.ico" />
    <!-- 구글 아이콘 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
     <!-- reset.css -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" />
   <link rel="stylesheet" href="./css/orderList.css" />
   <script src="./js/jquery-3.7.1.min.js"></script>   
</head>

<body>
<%@ include file="header.jsp" %>

<%
	String searchText = request.getParameter("search");
	if (searchText == null) {
		searchText = "";
	}
%>

    <div class="inner"> 
      <!-- 검색어 입력 -->
      <div class="top">
        <div class="serach-bar">
          <input type="search" name="search-text" id="search-text" placeholder="검색어를 입력하세요." value="<%= searchText %>"><a class="search" href="javascript: searchText();">
          <span class="material-symbols-outlined">
            search
            </span></a>
        </div>
      </div>
      
 			<div class="wrapper">
        <div class="header">관리자 주문 목록</div>
        
        
        <div class="content-name">
            <div class="content_no">번호</div>
            <div>제품 이름</div>
            <div>의뢰처</div>
            <div>작성자</div>
            <div>주문일자</div>
            <div class="delete">삭제</div>
        </div>
<%
	String JDBC_URL = "jdbc:oracle:thin:@1.220.247.78:1522:orcl";
	String USER = "semi_project2";
 	String PASSWORD = "123452";
	
  Connection conn = null; //디비 접속 성공시 접속 정보 저장
	Statement stmt = null; //쿼리를 실행하기 객체 정보
	ResultSet rs = null;
	
	Exception exception = null;
	
  try {
	  // 0.
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  
		// 1. JDBC로 Oracle연결
	  conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
	  // System.out.println("오라클 접속 성공");
	  
		// 2. BO_FREE 테이블에서 SQL로 데이터 가져오기
	 	stmt = conn.createStatement();	// 2-1. Statement 생성
	 	rs = stmt.executeQuery("SELECT ORDER_NUM, ORDER_DATE, REQUESTER, ITEM_NAME, ORDER_PLACE FROM ORDER_PRODUCT WHERE ITEM_NAME LIKE '%" + searchText + "%' ORDER BY ORDER_NUM DESC fetch first 5 rows only"); // 2-2. SQL 쿼리 실행
		
	 	// 3. rs로 데이터 가져온 걸 웹에 보여주기 -> 쿼리 실행 결과 출력
	 	while(rs.next()) {
%>     
       
        <div class="content-box">
        	<div>
            <div class="content_no"><%= rs.getInt("ORDER_NUM") %></div>
            <div class="content_name"><a href="./orderProductUpdateForm.jsp?ordernum=<%= rs.getInt("ORDER_NUM") %>" style="color: black;"><%= rs.getString("ITEM_NAME") %></a></div>
            <div class="orderplace"><%= rs.getString("ORDER_PLACE") %></div>
            <div class="content_requester"><%= rs.getString("REQUESTER") %></div>
            <div class="content_date"><%= rs.getDate("ORDER_DATE") %></div>
            <div class="delete"><button style="cursor: pointer;" onClick="javascript: noticeDelete(<%= rs.getInt("ORDER_NUM") %>);">X</button></div>
        	</div>
       </div>
<% 		 		
	 	}
  } catch(Exception e) {
	  System.out.println("오라클 접속 오류: " + e);
  } finally {
	  if (rs != null) try { rs.close(); } catch (SQLException ex) {}
	  if (stmt != null) try { stmt.close(); } catch (SQLException ex) {}
	  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
  }
%>
         <!-- 1-3. 글쓰기 버튼은 class="btn"로 <div>로 구역 설정 -->
            <div class="btn">
                <a href="./orderProductInsertForm.jsp">주문하기</a>
            </div>

      </div>
    </div>
   
		<script>
    	function searchText() {
    		location.href = "./orderList.jsp?search=" + $('#search-text').val();
    	}
    	
    	function noticeDelete(noticeNum) {
    		if (confirm('정말 삭제하시겠습니까?')) {
    			location.href = "./orderProductDelete.jsp?order_num=" + noticeNum;
    		}
    	}
    	
 
    </script>
    
</body>
</html>