<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>Welcome</title>
		<style>
		
		img{
		
		style="cursor:pointer;"
		}
		
		div.bener > img{
		 position : relative
         max-width:100%; max-height:100%;
         width:auto; height:auto;
         margin:auto;
         top:0; bottom:0; left:0; right:0;
         inline-block;
		}
		
		div.label1 > img{
		position : relative;
         max-width:100%; max-height:100%;
         width:auto; height:auto;
         margin:auto;
         top:0; bottom:0; left:0; right:0;
         
		}
		
		label2 > img{
		position : relative;
         max-width:100%; max-height:100%;
         width:auto; height:auto;
         margin:auto;
         top:0; bottom:0; left:0; right:0;
		}
		
		label3 > img{
		position : relative;
         max-width:100%; max-height:100%;s
         width:auto; height:auto;
         margin:auto;
         top:0; bottom:0; left:; right:0;
		}
		</style>
		
		<!-- <script type="text/javascript">
		
			
			function forMain(){
				var url = ${messageUrl};
				locaton.href = url;
				
			}
		</script> -->
		
	</head> 
	<c:url value="/main/main.html" var="messageUrl" />
		
		
	<body>
		<div class = "bener" align = "center" onclick="forMain();">
			<img src ="<c:url value = 'img/bener.jpg'></c:url>" alt =""  style="cursor:pointer;" onclick="location.href='${messageUrl}'"/>
		</div>
		
		<div class = "label1" align = "center">
			<img src = "<c:url value = 'img/label1.jpg'></c:url>"alt="" style="cursor:pointer;" onclick="location.href='${messageUrl}'"/>
		</div>
	
		<div class = "label2" align = "center">
			<img src = "<c:url value = 'img/label2.jpg'></c:url>"alt="" style="cursor:pointer;" onclick="location.href='${messageUrl}'"/>
		</div>
	
		<div class = "label3" align = "center">
			<img src = "<c:url value = 'img/label3.jpg'></c:url>"alt="" style="cursor:pointer;" onclick="location.href='${messageUrl}'"/>
		</div>
		
		<div class = "label4" align = "center">
		
		</div>
		
		
		<%-- <c:url value="/test/test.html" var="messageUrl" />
		<a href= "${messageUrl }">Click to enter</a> --%>
	</body>
</html>











