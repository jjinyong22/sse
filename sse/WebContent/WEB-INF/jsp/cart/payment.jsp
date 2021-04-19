<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c"
	uri = "http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript">
	function paysolution(way){
		if(way.value == "card"){
			document.getElementById("card").style.display="";
			document.getElementById("payco").style.display="none";
			document.getElementById("kakao").stlye.disply="none";
		}else if( way.value == "payco"){
			document.getElementById("payco").style.display="";
			document.getElementById("card").style.display="none";
			document.getElementById("kakao").style.display="none";
		}else if( way.value == "kakao"){
			document.getElementById("kakao").style.display="";
			document.getElementById("card").style.display="none";
			document.getElementById("payco").style.display="none";
		}
	}
	function emailValue(email){
		if(email.value == "naver"){
			document.getElementById("emailUrl").value = email.value+".com";
		}else if(email.value == "daum"){
			document.getElementById("emailUrl").value = email.value+".com";
		}else if(email.value == "google"){
			document.getElementById("emailUrl").value = email.value+".com";
		}else{
			document.getElementById("emailUrl").value = "";
		}
	}
	var beginTime = "1:00";
	var runningTime = 59;
	var checking = 1;
	var timer;
	
	function startTime(){
		if(checking == 1){
			document.getElementById("AUTHEN").style.display="";
			document.getElementById("viewTime").innerHTML = beginTime;
			checking--;
			timer=setTimeout("startTime()",1000);
		}else{
			document.getElementById("viewTime").innerHTML = runningTime;
			runningTime--;
			timer=setTimeout("startTime()",1000);
		}
		
		if(runningTime == 0){
			clearTimeout(startTime());
			document.getElementById("AUTHEN").style.display="none";
		}
	}
	
	function moveCache(){
		document.addCache.submit();
		if(confirm("������ �Ϸ�Ǿ����ϴ� ���ų������� �̵��Ͻðڽ��ϱ�?")){
			location.href="../cache/purchase.html?cache_id=${name }&itemId=${item.item_code }";
		}else{
			return false;
			
		}
	}
</script>
</head>
<body>
<div class = "menubar">
<%@ include file="/WEB-INF/jsp/menubar.jsp"%>
</div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<div align = "center">
<table>
	<tr bgcolor="gray">
		<td align="center">��ǰ�̸�</td>
		<td align="center">��ǰ����</td>
		<td align="center">��ǰ����</td>
		<td align="center">��ǰ����</td>
	</tr>
<c:forEach var = "ITEM" items = "${LIST }">
	<tr align="center">
		<td width="250" align="center">${ITEM.cart_name }</td>
		<td width="250" align="center">${ITEM.cart_color }</td>
		<td width="250" align="center">${ITEM.cart_count }</td>
		<td width="250" align="center">${ITEM.cart_price * ITEM.cart_count }</td>
	</tr>
	<form name ="addCache" action ="../cache/addCache.html">
	<input type= "hidden" value = "${ITEM.cart_code }" name = "CODE">
	<input type = "hidden" value = "${ITEM.cart_color }" name = "COLOR">
	<input type = "hidden" value = "${ITEM.cart_count }" name = "COUNT">
	</form>
</c:forEach>
</table>
<br/><br/><br/><br/>
<p style="float:right; margin-right:13%;">���� �ݾ� : ${TOTAL }won</p>
</div>
<br/>
<br/>
<br/>
<br/>
<div align = "center">
������� :<select id="box" name = "pay" onchange="paysolution(this)">
	<option value = "null">������� ����</option>
	<option value = "card">�ſ�ī��</option>
	<option value = "payco">������</option>
	<option value = "kakao">īī������</option>
</select>
<br/>
<br/>
<div id = "card" align = "left"  style ="margin-left: 600px; display: none;" >
�������<select>
	<option>��������</option>
	<option>��������</option>
	<option>�ϳ�����</option>
	<option>��������</option>
	<option>��Ƽ����</option>
</select>
<br/>
<br/>
ī���ȣ<input type ="text" style ="width: 50px;">/<input type = "text" style ="width: 50px;">/<input type = "text" style ="width: 50px;">/<input type = "text" style ="width: 50px;"><br/><br/>
<input type = "radio" name = "checkCard">����ī��<input type = "radio" name="checkCard">����ī��
<br/><br/><br/><a href="javascript:moveCache();">����</a>
</div>

<div id = "payco" align = "left" style="margin-left: 600px; display: none;">
ī���ȣ  <input type ="text" style ="width: 50px;">-<input type = "text" style ="width: 50px;">-<input type = "text" style ="width: 50px;">-<input type = "text" style ="width: 50px;"><br/>
��ȿ�ⰣCVC<br/>
<input type= "text" style = "width: 25px;"><input type ="text" style="width: 25px;"><input type ="text" style="width:25px;"><br/>
��й�ȣ(�� ���ڸ�)<br/>
<input type = "text" style = "width: 35px;"><input type = "text" style = "width: 35px;">
<br/><br/><br/><a href="javascript:moveCache();">����</a>
</div>
<div id = "kakao" align = "left"style = "margin-left: 600px; display: none;">
īī���� �̸��� <input type = "text" style = "width: 70px;">@<input type = "text" id = "emailUrl" value = "" style ="width: 70px;"><select  onchange="emailValue(this)"><option>�����Է�</option><option value ="naver">���̹�</option><option value="daum">����</option><option value="google">����</option></select>
<input type = "button" value = "������ȣ �ޱ�" onclick ="startTime()">
<br/><br/><br/>
<div id = "AUTHEN" style = "display: none;">
���ѽð�<span id ="viewTime"></span><input type = "text"><input type = "button" value = "Ȯ��">
<br/><br/><br/><a href="javascript:moveCache();">����</a>
</div>
</div>
</div>


<%@ include file ="/WEB-INF/jsp/undertag.jsp"%>
</body>
</html>








