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
		<h2 align = "center">������ �߻��߽��ϴ�.</h2>
	</c:when>
	<c:otherwise>
		<h2 align = "center">���������� �Ϸ�Ǿ����ϴ�.</h2>
	</c:otherwise>
</c:choose>
<a href="#" 
	onClick="self.close();opener.window.location.reload();">�ݱ�</a>
</body>
</html>