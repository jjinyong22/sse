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
			alert("타입을 선택해 주세요.");
			return false;
		}
		if(document.getElementByName("NAME").value == null){
			alert("상품명을 입력해 주세요.");
			return false;
		}
		if(document.ADDITEM.PRICE.value == null){
			alert("가격을 입력해 주세요.");
			return false;
		}
		if(document.ADDITEM.IMAGE.value == null){
			alert("이미지를 선택해 주세요.");
			return false;
		}
		if(document.ADDITEM.INFO == null){
			alert("상품정보를 입력해 주세요.");
			return false;
		}
		if(document.ADDITEM.GENDER == null){
			alert("성별을 선택해 주세요.");
			return false;
		}
		if(document.ADDITEM.COLOR == null){
			alert("색상를 입력해 주세요.");
			return false;
		}
		if(document.ADDITEM.COUNT == null){
			alert("수량을 입력해 주세요.");
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
상품 이미지
<img id = "preview"  alt="" src="" style="width:400px; heigth: 550px;">
</div>
<div style=" width: 400px; height: 550px; background-color: gray; margin-left: 25%;">
추가 이미지
<img id = "preview2"  alt="" src="" style="width:400px; heigth: 550px;">	
</div>

<div style="position:relative;">
	<form action="../item/addItem.html" method ="post" enctype="multipart/form-data" onsubmit="return checking();">
		<table id = "ADDITEM">
			<tr>
				<td>상품타입 : </td>
				<td><select name="TYPE">
					<option value="outer">아우터</option>
					<option value="shirts">상의</option>
					<option value="jean">하의</option>
					<option value="shose">신발</option>
				</select></td>
			</tr>
			<tr>
				<td>상품이름 : </td>
				<td><input type = "text" name ="NAME"></td>
			</tr>
			<tr>
				<td>상품가격 : </td>
				<td><input type= "text" name ="PRICE"></td>
			</tr>
			<tr>
				<td>상품이미지 :</td>
				<td><input type = "file" name = "IMAGE" onchange="readurl(this)"></td>
			</tr>
			<tr>
				<td>상품 추가 이미지:</td>
				<td><input type = "file" name ="IMAGE2" onchange="readurl2(this)"></td>
			</tr>
			<tr>
				<td>상품정보 : </td>
				<td><input type = "text" name = "INFO"></td>
			</tr>
			<tr>
				<td>성별 :</td>
				<td><input type="radio" name="GENDER" value="남">남성&nbsp;<input type = "radio" name="GENDER" value="여">여성</td>
			</tr>
			<tr>
				<td>크기 : </td>
				<td><select name = "SIZE">
					<option>F</option>
					<option>S</option>
					<option>M</option>
					<option>L</option>
				</select></td>
			</tr>
			<tr>
				<td>색상 :</td>
				<td><input type ="text" name = "COLOR">[색상이 복수일 경우 ","로 구별해주세요.]
			<tr>
			<tr>
				<td>수량 :</td>
				<td><input type = "text" name ="COUNT"></td>
			</tr>
		</table>
		<input type ="hidden" value = "${itemType }" name = "itemType">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type ="submit" value = "추가하기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = "reset" value = "초기화">
	</form>
</div>

</div>

<hr/>
<%@ include file ="/WEB-INF/jsp/undertag.jsp"%>
</body>
</html>







