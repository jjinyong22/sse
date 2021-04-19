<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>

</head>
<style>
	#box{
		padding: 1px;
		border: 1px none green;
		border-bottom: 1px solid gray;
	}
	#boxx{
		padding: 1px;
		border: 1px none green;
		border-bottom: 1px solid black;
		border-top: 1px solid black;
	}
	.menubar{
	position: fixed;
	float: auto;
	width: 99.4%;
	z-index: 1000;
	}
</style>
<script type="text/javascript">
function insertCheck(){
	if(document.frm.qna_title.value ==""){
		alert("제목을 입력 해 주세요."); 
		form.qna_title.focus(); return false;
	}
	if(document.frm.qna_content.value == ""){
		alert("내용을 입력 해 주세요."); 
		form.qna_content.focus(); return false;
	}
	if(confirm("입력한 내용이 맞습니까?")){
		document.frm.submit();
	}else { return false; }
	
}
</script>
<body>
<div class="menubar">
<%@ include file="/WEB-INF/jsp/menubar.jsp"%></div>
<form:form name="frm" modelAttribute="qnA" action="../question/questioninsert.html"
		 onSubmit="return validate(this)" method="post">
	<form:hidden path="order_no" value="${qnA.order_no}"/>
	<input type="hidden" name="abc" value="${name }"/>
	<c:if test="${ ! empty param.group_id }">
	<input type="hidden" name="group_id" value="${param.group_id }"/>
	</c:if>
	<c:if test="${ ! empty param.parent_id }">
	<input type="hidden" name="parent_id" value="${param.parent_id }"/>
	</c:if><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<div align="center" class="body">
		<table>
			<tr height="40px"><td><div style="font-size:80%;">제목</div></td>
				<td><form:input size = "70%" id="box" path="qna_title" cssClass="qna_title"
						maxLength="50"/>
						<font color="red"><form:errors path="qna_title"/></font>
						</td>
			</tr>
			<tr height="40px"><td><div style="font-size:80%;">id</div></td>
				<td><form:input  size = "70%" id="box" path="qna_id" cssClass="qna_id"
				 value="${name }"	maxLength="50" readonly="true"/></td>
			</tr><br/><br/>
			<form:hidden path="qna_number" value = "${qnA.qna_number }"/>
			<tr height="40px"><td></td>
				<td><form:textarea id="boxx" cols="170%" rows="30%" path="qna_content" cssClass="qna_content"/>
				<font color="red"><form:errors path="qna_content"/></font></td>
			</tr>
			<tr height="40px"><td></td>
				<td><input type="hidden" name="qna_image"/></td>
				<td></td>
			</tr>
		</table>
		<div style="font-size:80%;"><a href="javascript:insertCheck();">등록</a></div>
	</div>
</form:form>
<div style="position:relative; left:92%; font-size:80%;"><a href="<c:url value = '../question/question.html?notice_id=manager'></c:url>" style="text-decoration:none"><br/>돌아가기</a>
	</div>
<%@ include file ="/WEB-INF/jsp/undertag.jsp"%>
</body>
</html>