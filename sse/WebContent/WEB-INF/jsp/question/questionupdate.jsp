<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
	.menubar{
	position: fixed;
	float: auto;
	width: 99.4%;
	z-index: 1000;
	}
	#box{
		padding: 1px;
		border: 1px none green;
		border-bottom: 1px solid black;
	}
	#boxx{
		padding: 1px;
		border: 1px none green;
		border-bottom: 1px solid black;
		border-top: 1px solid black;
	}
</style>
<script type="text/javascript">
function updateCheck(){
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
<form:form name="frm" modelAttribute="qna" action="../question/questionupdate.html"
		method="post" enctype="multipart/form-data"
		onSubmit="return validate(this)">
		<form:hidden path="qna_number" value="${qna.qna_number }"/>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<div style="position:absolute;font-size:80%; left:4%;"><form:input id="box" path="qna_title" size="20" cssClass="qna_title"
		value="${qna.qna_title }"/><br/>
		
<form:input id="box" path="qna_id" size="20" 
		value="${qna.qna_id }" readonly="true"/>
		<form:input id="box" path="qna_date" size="30"
		value="${qna.qna_date }" readonly="true"/><br/><br/>
<form:textarea path="qna_content" 
	cssClass="qna_content" cols="173.5%" rows="30%" id="boxx" value="${qna.qna_content }"></form:textarea><br/>
	 <div align="center"><br/>
	 <a href="javascript:updateCheck();">수정하기</a>
	 </div>
</form:form>
<p align="right"><a href="<c:url value = '../question/question.html?notice_id=manager'></c:url>" style="text-decoration:none"><br/>돌아가기</a></p>
<%@ include file ="/WEB-INF/jsp/undertag.jsp"%>
</body>
</html>