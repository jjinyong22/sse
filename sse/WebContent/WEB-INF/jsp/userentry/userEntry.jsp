<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
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
	alert("ID�� 6�� �̻� ������ �ּž� �մϴ�");
	document.frm.id.focus();
	return
}
	var url="../idcheck/idcheck.html?ID="+document.frm.user_id.value;
	window.open(url,"_blank","width=450,height=200");
	}	
function validate(form){
	if(form.idChecked.value == ""){
		alert("ID �ߺ� �˻縦 ���ּ���."); return false;
	}
	if(document.frm.user_id.value.length < 6){
		alert("ID�� 6�� �̻� ������ �ּž� �մϴ�"); form.user_id.focus(); return false;
	}
	if(form.user_password.value.length < 6){
		alert("��ȣ�� 6�� �̻��� ������ Ư�����ڷ� �Ǿ�� �մϴ�"); form.user_password.focus(); return false;
	}
	if(form.user_password.value != form.password_check.value){
		alert("��ȣ�� ��ġ���� �ʽ��ϴ�.");
		form.user_password.focus(); return false;
	}
	if(form.user_name.value == ""){
		alert("�̸��� �Է��ϼ���."); form.user_name.focus(); return false;
	}
	if(form.user_address.value == ""){
		alert("�ּҸ� �Է��ϼ���."); form.address.focus(); return false;
	}
	if(form.user_rn.value.length < 8 ){
		alert("��������� ��)20141228 �������� �����ּ���."); form.user_rn.focus(); return false;
	}
	if( !form.user_gender[0].checked && !form.user_gender[1].checked){
		alert("������ �����ϼ���."); form.user_gender[0].focus(); return false;
	}
	if(form.user_phone.value == ""){
		alert("�ڵ��� ��ȣ�� �Է��ϼ���."); form.user_phone.focus(); return false;
	}
	if(form.user_email.value == ""){
		alert("�̸����� �Է��ϼ���."); form.user_email.focus(); return false;
	}
	if(form.user_question.selectedIndex < 1){
		alert("������ �����ϼ���."); form.user_question.focus(); return false;
	}
	if(form.user_answer.value == ""){
		alert("������ ���� ����� �Է��ϼ���."); form.user_answer.focus(); return false;
	}
	if(confirm("�Է��� ������ �½��ϱ�?")){
		
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
		<td>���̵�*</td>
		<td><form:input path="user_id" maxLength="30" id="box"
			cssClass="user_id"/>
		<input type="button" value="�ߺ��˻�" onClick="idCheck()"/>
		</td>
	</tr>
	<tr height="40px">
		<td>��й�ȣ*</td>
		<td><form:password path="user_password" maxLength="20" id="box"
			cssClass="user_password"/>
		</td>
	</tr>
	<tr height="40px">
		<td>��й�ȣ Ȯ��*</td>
		<td><input type="password" name="password_check" id="box"/>
		</td>
	</tr>
	<tr height="40px">
		<td>�̸�*</td>
		<td><form:input path="user_name" maxLength="20" id="box"
			cssClass="user_name"/>
		</td>
	</tr>
	<tr height="40px">
		<td>�ּ�*</td>
		<td><form:input path="user_address" maxLength="50" id="box"
			cssClass="user_address"/>
		</td>
	</tr>
	<tr height="40px">
		<td>�������*</td>
		<td><form:input path="user_rn" maxLength="8" id="box"
			cssClass="user_rn"
			onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
		</td>
	</tr>
	<tr height="40px">
		<td>����*</td>
		<td >�� <form:radiobutton path="user_gender" value="M"/>
		�� <form:radiobutton path="user_gender" value="F"/><br/>
		</td>
	</tr>
	<tr height="40px">
		<td>�ڵ�����ȣ*</td>
		<td><form:input path="user_phone" maxLength="11" id="box"
			cssClass="user_phone"
			onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
		</td>
	</tr>
	<tr height="40px">
		<td>�̸���*</td>
		<td><form:input path="user_email" maxLength="20" id="box"
			cssClass="user_email"/>
		</td>
	</tr>
	<tr height="40px">
		<td>���ã�� ����*</td>
		<td><form:select path="user_question" cssClass="user_question" id="box">
			<form:option value="" label="----������ �ּ���----"/>
			<form:option value="��" label="��� �������?"/>
			<form:option value="����" label="�θ�� ������?"/>
			<form:option value="ģ��" label="�ʵ��л��� ���� ģ�ߴ� ģ�� �̸���?"/>
			<form:option value="ũ��������" label="ù ũ�������� ������?"/>
			<form:option value="�ð�" label="�¾ �ð���?"/>
		</form:select>
		</td>
	</tr>
	<tr height="40px">
		<td>���� �亯*</td> 
		<td><form:input path="user_answer" maxLength="20" id="box"
			cssClass="user_answer"/>
		</td>
	</tr>
</table>
<table><br/>
	<tr>
		<td height="40px" align="center">
		<input type="submit" value="ȸ������">
		</td>
	</tr>
</table>
</form:form>
</div>
<%@ include file ="/WEB-INF/jsp/undertag.jsp"%>
</body>
</html>