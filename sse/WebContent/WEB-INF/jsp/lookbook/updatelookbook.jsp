<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" 
	prefix = "c"%>
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
	
	function selfGo(){
		document.addLB.submit();
		
	}

</script>
</head>
<body>
<h2 align = "center">룩북 수정</h2>
<form:form modelAttribute="LB" method="post" action = "../lookbook/updateLB.html" enctype="multipart/form-data">
<table>
<form:hidden path="lb_order"/>
<tr><td align = "center">타이틀 : <form:input path="lb_title"/></td></tr>
<tr><td align = "center"><img id = "preview" alt="" src="${pageContext.request.contextPath}/lbimage/${LB.lb_image}" width="500px" height = "800px"></td></tr>
<tr><td align = "center"><input type = "file" name = "imageUrl" onchange = "readurl(this);"></td></tr>
<tr align="center"><td align="center"><input type = "submit" value = "수정"></td></tr>
</table>
</form:form>
</body>
</html>




