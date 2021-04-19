<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

	<style>
	.menubar{
	position: fixed;
	float: auto;
	width: 99.4%;
	}
	</style>
	
</head>

<body>


<div class = "menubar">
<%@ include file="/WEB-INF/jsp/menubar.jsp"%>
</div>

<div id = "mainimg" align = "center">
<img alt="" src="<c:url value = '/img/look5.jpg'></c:url>" width="100%" height="100%">
<img alt="" src="<c:url value = '/img/look2.jpg'></c:url>" width="100%" height="100%">
<img alt="" src="<c:url value = '/img/look6.jpg'></c:url>" width="100%" height="100%">
<img alt="" src="<c:url value = '/img/look4.jpg'></c:url>" width="100%" height="100%">
<img alt="" src="<c:url value = '/img/gilo1.jpg'></c:url>" width="100%" height="100%">
<img alt="" src="<c:url value = '/img/look.jpg'></c:url>" width="100%" height="100%">
</div>

<%@ include file ="/WEB-INF/jsp/undertag.jsp"%>
</body>
</html>








