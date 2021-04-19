<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c"	uri = "http://java.sun.com/jsp/jstl/core" %>
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
	z-index: 1000;
	}
</style>
</head>
<body>

<script type="text/javascript">

	function openImage(lookImg){
		var img = new Image();
		img.src = lookImg;
		viewImage(img);
	}
	function viewImage(img){
		var W=img.width; 
		var H=img.height; 
		var O="width="+W+",height="+H+",scrollbars=yes"; 
		var imgWin=window.open("","",O); 
		 imgWin.document.write("<html><head><title>:LOOK BOOK �󼼺���:</title></head>");
		 imgWin.document.write("<body topmargin=0 leftmargin=0>");
		 imgWin.document.write("<img src="+img.src+" onclick='self.close()' style='cursor:pointer;' title ='Ŭ���Ͻø� â�� �����ϴ�.'>");
		 imgWin.document.close();
	}
	function updateView(order){
		window.open("/lookbook/update.jsp","��� ����","width=350,height=500,scrollbars=no");
	}
	function YesORno(){
		if(confirm("�����Ͻðڽ��ϱ�?")){
			return true;
		}else{
			return false;
		}
	}
</script>

<div class = "menubar">
<%@ include file="/WEB-INF/jsp/menubar.jsp"%>
</div><br/><br/><br/><br/><br/>
	<div align="center">
	<c:choose>
	<c:when test="${name == 'manager'}">
	<div style="float:right; margin-right: 2%; font-size:80%;"><p style =" position:fixed;  color:blue;"><a href = "#" style ="cursor: pointer;" onclick="window.open('../lookbook/addlookbook.html','��� �߰�','width=500,height=800').focus()">�߰�</a></p>
	</div></c:when>
	</c:choose>
	<br/><br/><br/><br/><br/><br/><br/>
	<table>
	<tr>
	<c:set var = "row" value = "0"/>
	<c:forEach var="LB" items="${lbList }">
	
	<c:if test = "${row%5==0 }">
		<tr>
	</c:if>
	
	<td><div style ="float: left; width: 200px; heigth: 500px;">
		<img alt="" src="${pageContext.request.contextPath}/lbimage/${LB.lb_image}" width = "120%" height ="135%"
		style="cursor:pointer;" onclick="openImage(this.src)"/>
		<p align = "center">${LB.lb_title }</p><br/>
		<c:choose>
		<c:when test="${name == 'manager'}">
			<div style="font-size:80%;" align = "center"><a href ="#" style = "cursor: pointer;" onclick="window.open('../lookbook/updateLB.html?NUM=${LB.lb_order }','��� ����','width=500,height=800').focus();">����</a>&nbsp;&nbsp;<a href="../lookbook/deleteLB.html?NUM=${LB.lb_order }" style = "cursor:pointer;"  onsubmit="YesORno()">����</a></div>
		</c:when>
		</c:choose>
	</div>
	</td>
	
	<c:set var = "row" value = "${row+1 }"/>
	<c:if test = "${row%5==0 }">
		
	</c:if>
	</c:forEach>
	</table>
</div>
<%@ include file ="/WEB-INF/jsp/undertag.jsp"%>
</body>
</html>