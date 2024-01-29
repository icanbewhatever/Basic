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
	/* 직원 목록 */
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
	   .employee-list {
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
			Connection connection = null; //
		    
		       // 접속하기 
		      try {
		       //connection = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);???
		       connection = DBConfig.getConnection();
		       System.out.println("jsp계정 접속성공");
		      }catch(Exception e) {
		    	System.out.println("jsp계정 접속실패");
		      }  
		       
		    //직원 정보 목록을 가져오는 쿼리 실행
		    PreparedStatement pstmt = null;//쿼리를 실행하기 위한 객체 > sql
		    ResultSet resultSet = null; // 디비에서 select 된 결과를 저장하는 배열 - 여기서 나온데이터가 배열로 나온다
		    
		    ArrayList<EmpVo> emplist =  new ArrayList<>(); //import java.util.*
		    // <>안에 들어가는 타입이 String이 아니라 EmpVo
		    //int count = 0;
		    try{
		    	String sql = "SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, PHONE_NUMBER FROM EMPLOYEES";
		    	pstmt = connection.prepareStatement(sql); // ? 물음표가 없는경우에 statement 쓰는게 좋다 > pstmt = connection.createStatement();
		    	resultSet = pstmt.executeQuery();
		    	while(resultSet.next()){
		    		EmpVo empvo = new EmpVo(); // @ page import = "vo.*"
		    		empvo.setEmployee_id(resultSet.getString("EMPLOYEE_ID"));
		    		empvo.setLast_name(resultSet.getString("LAST_NAME"));
		    		empvo.setJob_id(resultSet.getString("JOB_ID"));
		    		empvo.setPhone_number(resultSet.getString("PHONE_NUMBER"));
		    		
		    		emplist.add(empvo);
		    		//count++;
		    	}
		    	System.out.println("총갯수: " + emplist.size()); //System.out.println 콘솔에 찍기 out.println웹에 나오기
		    }catch(SQLException se){
		    	
		    }
		%>

	 <div class="employee-list">
	        <h2>직원 목록</h2>
	        <button onclick="handleAddButtonClick()">직원 등록</button> <!-- 등록 버튼 추가 -->
	        <table>
	            <thead>
	            <tr>
	            <th>사원번호</th>
	                <th>이름</th>
	                <th>직급</th>
	                <th>연락처</th>
	                <th>동작</th> <!-- 새로운 열 추가, 수정과 삭제처리 어디있지?-->
	                
	            </tr>
	            </thead>
	            <tbody>
	            <%
	            	for(int i=0; i<emplist.size(); i++){ //왜 size 써주지?
	            		EmpVo temp = emplist.get(i);
	            			         
	            %>
	            <tr>
	            	<td><%= temp.getEmployee_id() %></td>   <!-- 1000 -->
	                <td><%= temp.getLast_name() %></td> 	<!--John Doe -->
	                <td><%= temp.getJob_id() %></td>		<!-- 매니저 -->
	                <td><%= temp.getPhone_number() %></td>	<!-- 010-1234-5678 -->
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
	    
	    <script>
	      function handleAddButtonClick() {
	           location.href="empform.jsp";
	       }
	   </script>
   
   
</body>
</html>