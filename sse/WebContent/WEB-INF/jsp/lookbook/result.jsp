<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test = "${SUCCES == null}">
		<h2 align = "center">오류가 발생했습니다.</h2>
	</c:when>
	<c:otherwise>
		<h2 align = "center">성공적으로 완료되었습니다.</h2>
	</c:otherwise>
</c:choose>
<a href="#" 
	onClick="self.close();opener.window.location.reload();">닫기</a>
</body>
</html>