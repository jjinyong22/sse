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
		var countArr = document.getElementsByName("COUNT");
		var colorArr = document.getElementsByName("COLOR");
		var codeArr = document.getElementsByName("CODE");
		var user_id = document.getElementsByName("USER_ID");
		var countList = new String(); var colorList=new String(); var codeList = new String();
		for(var i = 0; i < countArr.length; i++){
			countList += countArr[i].value+",";
			colorList += colorArr[i].value+",";
			codeList += codeArr[i].value+",";
		}
		alert("결제가 완료되었습니다.");
		location.href = "../cache/arrayAddCache.html?COUNT="+countList+"&COLOR="+colorList+"&CODE="+codeList;
		
	}
</script>
</head>
<body>
<div class = "menubar">
<%@ include file="/WEB-INF/jsp/menubar.jsp"%>
</div>
<br/><br/><br/><br/><br/><br/>
<div align = "center">
<table>
	<tr bgcolor="gray">
		<td align="center">상품이름</td>
		<td align="center">상품색상</td>
		<td align="center">상품수량</td>
		<td align="center">상품가격</td>
	</tr>
	<hr/>
<c:forEach var = "ITEM" items = "${LIST }">
	<tr align="center">
		<td width="250" align="center">${ITEM.cart_name }</td>
		<td width="250" align="center">${ITEM.cart_color }</td>
		<td width="250" align="center">${ITEM.cart_count }</td>
		<td width="250" align="center">${ITEM.cart_price * ITEM.cart_count }</td>
		<td><input type= "hidden" value = "${ITEM.cart_code }" name = "CODE"></td>
		<td><input type = "hidden" value = "${ITEM.cart_color }" name = "COLOR"></td>
		<td><input type = "hidden" value = "${ITEM.cart_count }" name = "COUNT"></td>
	</tr>
</c:forEach>
</table>
<br/>
<br/>
<hr/>
<p>결제 금액 : ${TOTAL }won</p>
</div>
<br/>
<br/>
<br/>
<br/>
<div align = "center">
결제방법 :<select name = "pay" onchange="paysolution(this)">
	<option value = "null">결제방법 선택</option>
	<option value = "card">신용카드</option>
	<option value = "payco">페이코</option>
	<option value = "kakao">카카오페이</option>
</select>
<br/>
<br/>
<div id = "card" align = "left" style ="margin-left: 600px; display: none;" >
결제방법&nbsp;&nbsp;&nbsp;&nbsp; <select>
	<option>국민은행</option>
	<option>신한은행</option>
	<option>하나은행</option>
	<option>농협은행</option>
	<option>시티은행</option>
</select>
<br/>
<br/>
카드번호&nbsp;&nbsp;&nbsp;&nbsp;<input type ="text" style ="width: 50px;">/<input type = "text" style ="width: 50px;">/<input type = "text" style ="width: 50px;"><br/><br/>
<input type = "radio" name = "checkCard">개인카드<input type = "radio" name="checkCard">법인카드
<br/><br/><br/><input type= "button" value = "결제하기" onclick="moveCache()">
</div>

<div id = "payco" align = "left" style="margin-left: 600px; display: none;">
카드번호  <input type ="text" style ="width: 50px;">-<input type = "text" style ="width: 50px;">-<input type = "text" style ="width: 50px;"><br/>
유효기간 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CVC<br/>
<input type= "text" style = "width: 25px;">/<input type ="text" style="width: 25px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type ="text" style="width:25px;"><br/>
비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;카드별칭(선택)<br/>
<input type = "text" style = "width: 35px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = "text" style = "width: 35px;">
<br/><br/><br/><input type= "button" value = "결제하기" onclick="moveCache()">
</div>
<div id = "kakao" align = "left"style = "margin-left: 600px; display: none;">
카카오톡 이메일 <input type = "text" style = "width: 70px;">@<input type = "text" id = "emailUrl" value = "" style ="width: 70px;">&nbsp;&nbsp;<select  onchange="emailValue(this)"><option>직접입력</option><option value ="naver">네이버</option><option value="daum">다음</option><option value="google">구글</option></select>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = "button" value = "인증번호 받기" onclick ="startTime()">
<br/><br/><br/>
<div id = "AUTHEN" style = "display: none;">
제한시간&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id ="viewTime"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = "text" style = "width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;<input type = "button" value = "확인">
<br/><br/><br/><input type= "button" value = "결제하기" onclick="moveCache()">
</div>
</div>
</div>


<%@ include file ="/WEB-INF/jsp/undertag.jsp"%>
</body>
</html>


