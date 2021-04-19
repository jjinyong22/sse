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
function validate(form){
	if(form.user_password.value.length < 6){
		alert("암호는 6자 이상의 영문과 특수문자로 되어야 합니다"); form.user_password.focus(); return false;
	}
	if(form.user_password.value != form.password_check.value){
		alert("암호가 일치하지 않습니다.");
		form.user_password.focus(); return false;
	}
	if(form.user_name.value == ""){
		alert("이름을 입력하세요."); form.user_name.focus(); return false;
	}
	if(form.user_address.value == ""){
		alert("주소를 입력하세요."); form.address.focus(); return false;
	}
	if(form.user_rn.value.length < 8 ){
		alert("생년월일은 예)20141228 형식으로 적어주세요."); form.user_rn.focus(); return false;
	}
	if( !form.user_gender[0].checked && !form.user_gender[1].checked){
		alert("성별을 선택하세요."); form.user_gender[0].focus(); return false;
	}
	if(form.user_phone.value == ""){
		alert("핸드폰 번호를 입력하세요."); form.user_phone.focus(); return false;
	}
	if(form.user_email.value == ""){
		alert("이메일을 입력하세요."); form.user_email.focus(); return false;
	}
	if(form.user_question.selectedIndex < 1){
		alert("질문을 선택하세요."); form.user_question.focus(); return false;
	}
	if(form.user_answer.value == ""){
		alert("질문에 대한 대답을 입력하세요."); form.user_answer.focus(); return false;
	}
	if(confirm("입력한 내용이 맞습니까?")){
		
	}else { return false; }
}
</script>
<body>
<div class="menubar">
<%@ include file="/WEB-INF/jsp/menubar.jsp"%></div>
<form:form name="frm" modelAttribute="CUSTOMER" action="../entry/userUpdate.html?user_id=${CUSTOMER.user_id }"
		method="post" enctype="multipart/form-data"
		onSubmit="return validate(this)">
		<div class="body" align="center">
		<form:hidden path="user_date" value="${CUSTOMER.user_date }"/>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<table>
		<tr height="40px">
		<td>아이디</td>
		<td><form:input path="user_id" size="20" cssClass="user_id"
			value="${CUSTOMER.user_id }" id="box" readonly="true"/></td>
		</tr>
		<tr height="40px">
		<td>비밀번호</td>
		<td><form:password path="user_password" id="box" maxLength="30" 
			value="" cssClass="user_password"/></td>
			
		<tr height="40px">	
		<td>비번 확인</td>
		<td><input type="password" size="20" id="box" name="password_check"
			value=""/></td>
		<tr height="40px">
		<td>이름</td>
		<td><form:input path="user_name" maxLength="30" id="box" cssClass="user_name"
			value="${CUSTOMER.user_name}"/></td>
			<tr height="40px">
		<td>주소</td>
		<td><form:input path="user_address" maxLength="30" id="box" cssClass="user_address"
			value="${CUSTOMER.user_address}"/></td>
			<tr height="40px">
		<td>생년월일</td>
		<td><form:input path="user_rn" maxLength="30" id="box" cssClass="user_rn"
			onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
			value="${CUSTOMER.user_rn}"/></td>
			<tr height="40px">
		<td>성별</td>
		<td>
		<c:choose>
		<c:when test="${CUSTOMER.user_gender eq 'M ' }">
		남 <form:radiobutton path="user_gender" value="M" checked="checked"/>
			여 <form:radiobutton path="user_gender" value="F"/><br/>
		</c:when>
		<c:otherwise>
		남 <form:radiobutton path="user_gender" value="M"/>
			여 <form:radiobutton path="user_gender" value="F" checked="checked"/><br/>
		</c:otherwise>
		</c:choose>
		</td>

		<tr height="40px">
		<td>폰번호</td>
		<td><form:input path="user_phone" maxLength="30" id="box"
			value="${CUSTOMER.user_phone}"/></td>
			<tr height="40px">
		<td>이메일</td>
		<td><form:input path="user_email" maxLength="30" id="box"
			value="${CUSTOMER.user_email}"/></td>
			<tr height="40px">
		<td>마일리지</td>
		<td><form:input path="user_mileage" maxLength="30" id="box"
			value="${CUSTOMER.user_mileage}" readonly="true"/>원</td>
			<tr height="40px">
		<td>질문</td>
		<td><form:select path="user_question" cssClass="user_question" id="box">
			<form:option value="" label="----선택해 주세요----"/>
			<form:option value="집" label="어릴적 살던곳은?"/>
			<form:option value="고향" label="부모님 고향은?"/>
			<form:option value="친구" label="초등학생때 제일 친했던 친구 이름은?"/>
			<form:option value="크리스마스" label="첫 크리스마스 선물은?"/>
			<form:option value="시간" label="태어난 시간은?"/>
		</form:select>
		</td>
			<tr height="40px">
		<td>답변</td>
		<td><form:input path="user_answer" maxLength="30" id="box"
			value="${CUSTOMER.user_answer}"/></td>				
	</table>
	<br/><br/>
<input type="submit" value="수 정"/>
	</div>
</form:form>
<%@ include file ="/WEB-INF/jsp/undertag.jsp"%>
</body>
</html>