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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./resources/css/style.css">
    <script src="./resources/js/jquery-3.7.1.min.js"></script>
    <title>공지사항 수정</title>
</head>
<body>
<%/*
   String JDBC_URL = "jdbc:oracle:thin:@1.220.247.78:1522:orcl";
  String USER = "semi_project2";
  String PASSWORD = "123452";
  */
   String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
  String USER = "test";
  String PASSWORD = "1234";
  
  String num = request.getParameter("num");
   
  Connection conn = null; //디비 접속 성공시 접속 정보 저장
   Statement stmt = null; //쿼리를 실행하기 객체 정보
   ResultSet rs = null;
   
   Exception exception = null;
   
   String name = "";
   String title = "";
   String content = "";
  try {
     // 0.
     Class.forName("oracle.jdbc.driver.OracleDriver");
     
      // 1. JDBC로 Oracle연결
     conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
     // System.out.println("오라클 접속 성공");
     
      // 2. BO_FREE 테이블에서 SQL로 데이터 가져오기
       stmt = conn.createStatement();   // 2-1. Statement 생성
       rs = stmt.executeQuery("SELECT NUM, NAME, SUBJECT, CONTENT FROM BO_FREE WHERE NUM = " + num); // 2-2. SQL 쿼리 실행
       
       if (rs.next()) {
          name = rs.getString("NAME");
          title = rs.getString("SUBJECT");
          content = rs.getString("CONTENT");
       }
  } catch(Exception e) {
     System.out.println("오라클 접속 오류: " + e);
  } finally {
     if (stmt != null) try { stmt.close(); } catch (SQLException ex) {}
     if (conn != null) try { conn.close(); } catch (SQLException ex) {}
  }
%>

    <div class="card">
        <div class="card-header1">
            <h1><a href="./adminNoticeList">스타벅스 공지사항 글 수정</a></h1>
        </div>
        <form action="./adminNoticeUpdate" method="post" id="form1" onSubmit="return false">
           <input type="hidden" name="num" value="<%= num %>">
           <div class="card-write">
               <div class="myinfo">
                   이름<input type="text" id="korname" name="korname" placeholder="이름을 입력하세요." value="<%= name %>">
                   <!-- 
                   비밀번호<input type="password" placeholder="비밀번호를 입력하세요.">
                   -->
               </div>
               <div class="title-w">
                   제목<input type="text" name="title" id="title" placeholder="제목을 입력하세요."  value="<%= title %>">
               </div>
               <div class="msg">
                   내용<textarea placeholder="내용을 입력하세요." name="content" id="content"><%= content %></textarea>
               </div>
               <br>
               <div>
               </div>
           </div>
           <div class="btn-w">
              <input type="submit" value="수정" class="input-btn-w" onClick="javascript: prevCheckTextBox();" />
           </div>
        </form>
    </div>
    
    <script>
       function prevCheckTextBox() {
          if (!$('#korname').val()) {   // 이름 관련 dom
             alert('이름을 입력하세요.');   // 이름 입력하라고 팝업 뜸.
             $('#korname').focus();      // 이름 입력 칸으로 포커스 이동
             
             return;
          }
          if ($('#korname').val().length > 5) { // 이름 관련 dom   
             alert('이름을 5자 이내로 입력해 주세요.');   // 이름 5자 이내로 입력하라고 팝업 뜸.
             $('#korname').focus();      // 이름 입력 칸으로 포커스 이동
             
             return;
          }
          if (!$('#title').val()) {   // 제목 관련 dom
             alert('제목을 입력하세요.');   // 제목 입력하라고 팝업 뜸.
             $('#title').focus();      // 제목 입력 칸으로 포커스 이동
             
             return;
          }
          if (!$('#content').val()) {   // 내용 관련 dom
             alert('내용을 입력하세요.');   // 내용 입력하라고 팝업 뜸.
             $('#content').focus();      // 내용 입력 칸으로 포커스 이동
             
             return;
          }
             
          // 실제 form의 action의 값으로 전송
            document.getElementById('form1').submit();
       }
       
       function deleteUploadFile(noticeNum, fileNum, fileName) {
          if (confirm('정말 해당 파일을 삭제하시겠습니까?')) {
               location.href = './fileDelete?noticeNum=' + noticeNum + '&fileNum=' + fileNum + '&fileName=' + fileName;
          }
       }
    </script>
    <%
       // 캐시 만료를 통한 뒤로가기 방지
       response.setHeader("Expires", "Thu, 27 Jul 2023 09:00:00 GMT"); // 현재시각보다 이전으로만 만료시간을 설정
       response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, post-check=0, pre-check=0"); // str 로 "" 으로 넣는것보단, 상수형으로 넣어주는게 좋다. 
       response.setHeader("Pragma", "no-cache"); 
    %>
</body>
</html>