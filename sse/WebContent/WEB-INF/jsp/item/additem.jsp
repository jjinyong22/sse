<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="spring" 
		uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 
		uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function readurl(url){
		if(url.files && url.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			$("#preview").attr('src',e.target.result);
			}
		reader.readAsDataURL(url.files[0]);
		}
	}
	function readurl2(url){
		if(url.files && url.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				$("#preview2").attr('src',e.target.result);
				}
			reader.readAsDataURL(url.files[0]);
			}
	}
	
	function checking(){
		if(document.ADDITEM.TYPE == null){
			alert("Ÿ���� ������ �ּ���.");
			return false;
		}
		if(document.getElementByName("NAME").value == null){
			alert("��ǰ���� �Է��� �ּ���.");
			return false;
		}
		if(document.ADDITEM.PRICE.value == null){
			alert("������ �Է��� �ּ���.");
			return false;
		}
		if(document.ADDITEM.IMAGE.value == null){
			alert("�̹����� ������ �ּ���.");
			return false;
		}
		if(document.ADDITEM.INFO == null){
			alert("��ǰ������ �Է��� �ּ���.");
			return false;
		}
		if(document.ADDITEM.GENDER == null){
			alert("������ ������ �ּ���.");
			return false;
		}
		if(document.ADDITEM.COLOR == null){
			alert("���� �Է��� �ּ���.");
			return false;
		}
		if(document.ADDITEM.COUNT == null){
			alert("������ �Է��� �ּ���.");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<div class="menubar">
<%@ include file="/WEB-INF/jsp/menubar.jsp"%></div>

<div align="center">
<div style=" width: 400px; height: 550px; background-color: gray; float: left; margin-right: 20px; margin-left: 20%;">
��ǰ �̹���
<img id = "preview"  alt="" src="" style="width:400px; heigth: 550px;">
</div>
<div style=" width: 400px; height: 550px; background-color: gray; margin-left: 25%;">
�߰� �̹���
<img id = "preview2"  alt="" src="" style="width:400px; heigth: 550px;">	
</div>

<div style="position:relative;">
	<form action="../item/addItem.html" method ="post" enctype="multipart/form-data" onsubmit="return checking();">
		<table id = "ADDITEM">
			<tr>
				<td>��ǰŸ�� : </td>
				<td><select name="TYPE">
					<option value="outer">�ƿ���</option>
					<option value="shirts">����</option>
					<option value="jean">����</option>
					<option value="shose">�Ź�</option>
				</select></td>
			</tr>
			<tr>
				<td>��ǰ�̸� : </td>
				<td><input type = "text" name ="NAME"></td>
			</tr>
			<tr>
				<td>��ǰ���� : </td>
				<td><input type= "text" name ="PRICE"></td>
			</tr>
			<tr>
				<td>��ǰ�̹��� :</td>
				<td><input type = "file" name = "IMAGE" onchange="readurl(this)"></td>
			</tr>
			<tr>
				<td>��ǰ �߰� �̹���:</td>
				<td><input type = "file" name ="IMAGE2" onchange="readurl2(this)"></td>
			</tr>
			<tr>
				<td>��ǰ���� : </td>
				<td><input type = "text" name = "INFO"></td>
			</tr>
			<tr>
				<td>���� :</td>
				<td><input type="radio" name="GENDER" value="��">����&nbsp;<input type = "radio" name="GENDER" value="��">����</td>
			</tr>
			<tr>
				<td>ũ�� : </td>
				<td><select name = "SIZE">
					<option>F</option>
					<option>S</option>
					<option>M</option>
					<option>L</option>
				</select></td>
			</tr>
			<tr>
				<td>���� :</td>
				<td><input type ="text" name = "COLOR">[������ ������ ��� ","�� �������ּ���.]
			<tr>
			<tr>
				<td>���� :</td>
				<td><input type = "text" name ="COUNT"></td>
			</tr>
		</table>
		<input type ="hidden" value = "${itemType }" name = "itemType">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type ="submit" value = "�߰��ϱ�">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = "reset" value = "�ʱ�ȭ">
	</form>
</div>

</div>

<hr/>
<%@ include file ="/WEB-INF/jsp/undertag.jsp"%>
</body>
</html>







