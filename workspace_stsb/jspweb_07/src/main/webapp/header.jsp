<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul {background-color: black;}
li {display: inline-block; padding:10px}
ul > li {color:white;}
a {text-decoration-line:none; pointer-events: none;}
.menu > li> a {color: white; font-size: small;}


</style>
</head>
<body>

    <div id="header">
        <ul class="menu">
            <li><a href="#">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </div>
    
    <script src="js/jquery-3.7.1.min.js"></script>
    
    <script>
    	$(document).ready(function(){
    		
    		$('li').hover(
    				
    				function(){
   					 $(this).css("background-color", "gray");
   					},
   					
   					function(){
   						$(this).css("background-color", "black");
   					}
   					
   					
   				);
    		 
    				
    	});
    
    
    </script>
</body>
</html>