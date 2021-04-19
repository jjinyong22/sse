<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring" 
		uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 
		uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	function readurl(url){
		if(url.files && url.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			$("#preview").attr('src',e.target.result);
			}
		reader.readAsDataURL(url.files[0]);
		}
	}
	function selfClose(){
		window.self.close();
	}

</script>

</head>
<body>
	<h2 align = "center"><font color="gray">룩북 이미지 추가</font></h2>
	<form:form id = "addLB" modelAttribute="LB" method="POST" 
	action="../lookbook/insertLB.html" enctype="multipart/form-data">
	<table>
	<tr align="center"><td>
	타이틀 : <form:input path="lb_title"/>
	</td></tr>
	<tr align="center"><td><img id = "preview" alt="" src="" width="500px" height = "800px">
	</td></tr>
	<tr><td>
	<input type = "file"name ="imageUrl" onchange="readurl(this);">
	</td></tr>
	</table>
	<input type="submit" value = "추가하기">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value ="닫기" onclick="selfClose()">
	</form:form>
</body>
</html>



