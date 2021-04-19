<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
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
</style>
<body>
<script type="text/javascript">
function idCheck(){
	if(document.frm.user_id.value.length < 6){
	alert("ID는 6자 이상 설정해 주셔야 합니다");
	document.frm.id.focus();
	return
}
	var url="../idcheck/idcheck.html?ID="+document.frm.user_id.value;
	window.open(url,"_blank","width=450,height=200");
	}	
function validate(form){
	if(form.idChecked.value == ""){
		alert("ID 중복 검사를 해주세요."); return false;
	}
	if(document.frm.user_id.value.length < 6){
		alert("ID는 6자 이상 설정해 주셔야 합니다"); form.user_id.focus(); return false;
	}
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
<div class="menubar">
<%@ include file="/WEB-INF/jsp/menubar.jsp"%></div>
<div align="center" class="body">
	<form:form name="frm" modelAttribute="customer" method="post" action="../entry/entry.html"
	  onSubmit="return validate(this)">
	  
	  
<input type="hidden" name="idChecked" id="idChecked"/>
<br/><br/><br/><br/>
<table>
	<tr height="40px">
		<td>아이디*</td>
		<td><form:input path="user_id" maxLength="30" id="box"
			cssClass="user_id"/>
		<input type="button" value="중복검사" onClick="idCheck()"/>
		</td>
	</tr>
	<tr height="40px">
		<td>비밀번호*</td>
		<td><form:password path="user_password" maxLength="20" id="box"
			cssClass="user_password"/>
		</td>
	</tr>
	<tr height="40px">
		<td>비밀번호 확인*</td>
		<td><input type="password" name="password_check" id="box"/>
		</td>
	</tr>
	<tr height="40px">
		<td>이름*</td>
		<td><form:input path="user_name" maxLength="20" id="box"
			cssClass="user_name"/>
		</td>
	</tr>
	<tr height="40px">
		<td>주소*</td>
		<td><form:input path="user_address" maxLength="50" id="box"
			cssClass="user_address"/>
		</td>
	</tr>
	<tr height="40px">
		<td>생년월일*</td>
		<td><form:input path="user_rn" maxLength="8" id="box"
			cssClass="user_rn"
			onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
		</td>
	</tr>
	<tr height="40px">
		<td>성별*</td>
		<td >남 <form:radiobutton path="user_gender" value="M"/>
		여 <form:radiobutton path="user_gender" value="F"/><br/>
		</td>
	</tr>
	<tr height="40px">
		<td>핸드폰번호*</td>
		<td><form:input path="user_phone" maxLength="11" id="box"
			cssClass="user_phone"
			onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
		</td>
	</tr>
	<tr height="40px">
		<td>이메일*</td>
		<td><form:input path="user_email" maxLength="20" id="box"
			cssClass="user_email"/>
		</td>
	</tr>
	<tr height="40px">
		<td>비번찾기 질문*</td>
		<td><form:select path="user_question" cssClass="user_question" id="box">
			<form:option value="" label="----선택해 주세요----"/>
			<form:option value="집" label="어릴적 살던곳은?"/>
			<form:option value="고향" label="부모님 고향은?"/>
			<form:option value="친구" label="초등학생때 제일 친했던 친구 이름은?"/>
			<form:option value="크리스마스" label="첫 크리스마스 선물은?"/>
			<form:option value="시간" label="태어난 시간은?"/>
		</form:select>
		</td>
	</tr>
	<tr height="40px">
		<td>질문 답변*</td> 
		<td><form:input path="user_answer" maxLength="20" id="box"
			cssClass="user_answer"/>
		</td>
	</tr>
</table>
<table><br/>
	<tr>
		<td height="40px" align="center">
		<input type="submit" value="회원가입">
		</td>
	</tr>
</table>
</form:form>
</div>
<%@ include file ="/WEB-INF/jsp/undertag.jsp"%>
</body>
</html>