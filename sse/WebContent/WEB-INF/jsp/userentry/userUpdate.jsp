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
		<td>���̵�</td>
		<td><form:input path="user_id" size="20" cssClass="user_id"
			value="${CUSTOMER.user_id }" id="box" readonly="true"/></td>
		</tr>
		<tr height="40px">
		<td>��й�ȣ</td>
		<td><form:password path="user_password" id="box" maxLength="30" 
			value="" cssClass="user_password"/></td>
			
		<tr height="40px">	
		<td>��� Ȯ��</td>
		<td><input type="password" size="20" id="box" name="password_check"
			value=""/></td>
		<tr height="40px">
		<td>�̸�</td>
		<td><form:input path="user_name" maxLength="30" id="box" cssClass="user_name"
			value="${CUSTOMER.user_name}"/></td>
			<tr height="40px">
		<td>�ּ�</td>
		<td><form:input path="user_address" maxLength="30" id="box" cssClass="user_address"
			value="${CUSTOMER.user_address}"/></td>
			<tr height="40px">
		<td>�������</td>
		<td><form:input path="user_rn" maxLength="30" id="box" cssClass="user_rn"
			onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
			value="${CUSTOMER.user_rn}"/></td>
			<tr height="40px">
		<td>����</td>
		<td>
		<c:choose>
		<c:when test="${CUSTOMER.user_gender eq 'M ' }">
		�� <form:radiobutton path="user_gender" value="M" checked="checked"/>
			�� <form:radiobutton path="user_gender" value="F"/><br/>
		</c:when>
		<c:otherwise>
		�� <form:radiobutton path="user_gender" value="M"/>
			�� <form:radiobutton path="user_gender" value="F" checked="checked"/><br/>
		</c:otherwise>
		</c:choose>
		</td>

		<tr height="40px">
		<td>����ȣ</td>
		<td><form:input path="user_phone" maxLength="30" id="box"
			value="${CUSTOMER.user_phone}"/></td>
			<tr height="40px">
		<td>�̸���</td>
		<td><form:input path="user_email" maxLength="30" id="box"
			value="${CUSTOMER.user_email}"/></td>
			<tr height="40px">
		<td>���ϸ���</td>
		<td><form:input path="user_mileage" maxLength="30" id="box"
			value="${CUSTOMER.user_mileage}" readonly="true"/>��</td>
			<tr height="40px">
		<td>����</td>
		<td><form:select path="user_question" cssClass="user_question" id="box">
			<form:option value="" label="----������ �ּ���----"/>
			<form:option value="��" label="��� �������?"/>
			<form:option value="����" label="�θ�� ������?"/>
			<form:option value="ģ��" label="�ʵ��л��� ���� ģ�ߴ� ģ�� �̸���?"/>
			<form:option value="ũ��������" label="ù ũ�������� ������?"/>
			<form:option value="�ð�" label="�¾ �ð���?"/>
		</form:select>
		</td>
			<tr height="40px">
		<td>�亯</td>
		<td><form:input path="user_answer" maxLength="30" id="box"
			value="${CUSTOMER.user_answer}"/></td>				
	</table>
	<br/><br/>
<input type="submit" value="�� ��"/>
	</div>
</form:form>
<%@ include file ="/WEB-INF/jsp/undertag.jsp"%>
</body>
</html>