<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- DB 접속! -->
<%@ page import = "java.sql.*" %>
<%@ page import = "utils.DBConfig" %>
<%@ page import = "java.util.*" %>

<%@ page import = "vo.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 부서 목록 */
	   body {
	      font-family: Arial, sans-serif;
	      background-color: #f2f2f2;
	      margin: 0;
	      padding: 0;
	      display: flex;
	      justify-content: center;
	      align-items: center;
	      height: 100vh;
	   }
	   .department-list {
	      background-color: #fff;
	      padding: 20px;
	      border-radius: 5px;
	      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	   }
	
	   table {
	      width: 100%;
	      border-collapse: collapse;
	      margin-top: 20px;
	   }
	
	   th, td {
	      border: 1px solid #ddd;
	      padding: 10px;
	      text-align: left;
	   }
	
	   th {
	      background-color: #3498db;
	      color: #fff;
	   }

</style>
</head>
<body>
	<%	//넣는이유? 가짜 웹을 디비랑 연동시켜서 값을 넣어준다 
			//오라클 DB와 접속
			Connection connection = null;
		    
		       // 접속하기 
		      try {
		       //connection = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);???
		       connection = DBConfig.getConnection();
		       System.out.println("jsp계정 접속성공");
		      }catch(Exception e) {
		    	System.out.println("jsp계정 접속실패");
		      }  
		       
		    //직원 정보 목록을 가져오는 쿼리 실행
		    PreparedStatement pstmt = null;
		    ResultSet resultSet = null; // select 된 결과를 저장하는 배열 - 여기서 나온데이터가 배열로 나온다
		    
		    ArrayList<DepVo> deplist =  new ArrayList<>(); //import java.util.*
		    // <>안에 들어가는 타입이 String이 아니라 EmpVo
		    //int count = 0;
		    try{
		    	String sql = "SELECT DEPART_ID, DEPART_NAME, LOCATION, PHONE_NUMBER FROM DEPARTMENTS";
		    	pstmt = connection.prepareStatement(sql); // ? 물음표가 없는경우에 statement 쓰는게 좋다 > pstmt = connection.createStatement();
		    	resultSet = pstmt.executeQuery();
		    	while(resultSet.next()){
		    		DepVo depvo = new DepVo(); // @ page import = "vo.*"
		    		
		    		depvo.setDepart_id(resultSet.getInt("DEPART_ID"));
		    		depvo.setDepart_name(resultSet.getString("DEPART_NAME"));
		    		depvo.setLocation(resultSet.getString("LOCATION"));
		    		depvo.setPhone_number(resultSet.getString("PHONE_NUMBER"));
		    		
		    		deplist.add(depvo);
		    		//count++;
		    	}
		    	System.out.println("총갯수: " + deplist.size()); //System.out.println 콘솔에 찍기 out.println웹에 나오기
		    }catch(SQLException se){
		    	
		    }
		%>
		<div class="department-list">
	        <h2>부서 목록</h2>
	        <button onclick="handleAddButtonClick()">부서 등록</button> <!-- 등록 버튼 추가 -->
	        <table>
	            <thead>
	            <tr>
	            <th>부서번호</th>
	                <th>이름</th>
	                <th>지역</th>
	                <th>연락처</th>
	                <th>동작</th> <!-- 새로운 열 추가, 수정과 삭제처리 어디있지?-->
	                
	            </tr>
	            </thead>
	            <tbody>
	           
	            <%
	            	for(int i=0; i<deplist.size(); i++){ //왜 size 써주지?
	            		DepVo temp = deplist.get(i);
	            			         
	            %>
	            <tr>
	            	<td><%= temp.getDepart_id() %></td>   
	                <td><%= temp.getDepart_name() %></td> 	
	                <td><%= temp.getLocation() %></td>		
	                <td><%= temp.getPhone_number() %></td>	
	                <td><button onclick="handleButtonClick(0)">수정 처리</button> <!-- 버튼 추가 -->
	                <button onclick="handleButtonClick(0)">삭제 처리</button><!-- 버튼 추가 -->
	                
	                </td> <!-- 상세보기 버튼 추가 ???-->
	            </tr>
	            <%
	            	}
	            %>
	            	   <!-- 다른 직원들의 정보도 추가할 수 있습니다.?? -->
	            </tbody>
	        </table>
	    </div>
</body>
</html>