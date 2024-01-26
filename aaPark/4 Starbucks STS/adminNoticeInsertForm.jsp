<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css">
    <script src="./js/jquery-3.7.1.min.js"></script>
    <title>글쓰기</title>
</head>
<body>
    <div class="card">
        <div class="card-header1">
            <h1><a href="./adminNoticeList.jsp">스타벅스 공지사항 등록</a></h1>
        </div>
        <!-- 폼 구현 -->
        <form action="./adminNoticeInsert.jsp" method="post" id="form1" onSubmit="return false">
		        <div class="card-write">
		            <div class="myinfo">
		                이름<input type="text" name="korname" id="korname" placeholder="이름을 입력하세요.">
		                <!-- 
		                비밀번호<input type="password" placeholder="비밀번호를 입력하세요.">
		                -->
		            </div>
		            <div class="title-w">
		                제목<input type="text" name="title" id="title" placeholder="제목을 입력하세요." />
		            </div>
		            <div class="msg">
		                내용<textarea placeholder="내용을 입력하세요." name="content" id="content" ></textarea>
		                <input type="file" name="" id="">
		            </div>
		        </div>
		        <div class="btn-w">
		        	<input type="submit" value="작성" class="btn-w" onclick="javascript: prevCheckTextBox()" />
		        </div>
        </form>
   	</div>
   	
   	<script>
   		function prevCheckTextBox() { //console.log('잘 나와?');  			
   			if(!$('#korname').val()) {		//이름 관련 dom
   				alert('이름을 입력하세요.');		//이름 입력 팝업
   				$('#korname').focus();		//이름 입력칸으로 포커스 이동
   				
   				return;
   			}
   			
   			if($('#korname').val().length > 5) {		//이름 관련 dom
   				alert('이름을 10자 내외로 입력해주세요.');		//이름 입력 팝업
   				$('#korname').focus();		//이름 입력칸으로 포커스 이동
   				
   				return;
   			}
   			
   			if(!$('#title').val()) {		//이름 관련 dom
   				alert('제목을 입력하세요.');		//이름 입력 팝업
   				$('#title').focus();		//이름 입력칸으로 포커스 이동
   				
   				return;
   			}
   			
   			if(!$('#content').val()) {		//이름 관련 dom
   				alert('내용을 입력하세요.');		//이름 입력 팝업
   				$('#content').focus();		//이름 입력칸으로 포커스 이동
   				
   				return;
   			}
   			//실제 form의 action 값으로 전송
   			document.getElementbyId('form1').submit();
   			//빈 텍스트 박스 처리
   	
   		}
   	</script>
   	
   	
   	
</body>
</html>