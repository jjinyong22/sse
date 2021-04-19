<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
    div.all {
        width: 100%;
    }
    div.left {
        width: 50%;
        float: left;
        
    }
    div.right {
        width: 50%;
        float: right;
    }
    div.botton{
    	width:100%;
    	float: bottom;
    }
	.menubar{
	position: fixed;
	float: auto;
	width: 99.4%;
	z-index: 1000;
	}
	</style>
</head>
<body>
<script type="text/javascript">

function reply(){
	if(document.REPLY.loginid.value == ""){
		alert("로그인 후 이용 가능합니다.")
		return false;
	}else if(document.REPLY.INFO.value == ""){
		alert("내용을 입력 해 주세요.")
		REPLY.INFO.focus(); return false;
	}document.REPLY.submit();
		REPLY.INFO.focus();
}

function goCart(){
	document.move.action = "../cart/insertCart.html?success=성공";
	document.move.method = "get";
	document.move.submit();
	if(confirm("장바구니에 담겼습니다 장바구니로 이동하시겠습니까?")){
		location.href="../cart/cartList.html";
		
	}else{
		return false;
	}
}
function returned(){
	if(result != null){
	var result = document.getElementById('Popup').value;
	alert(result);
	}
}

function buy(){
if(document.move.login.value == null){
	alert("로그인 후 이용가능합니다.");
	return false;
}else {
	document.move.submit();
}

}



</script>
<div class="menubar">
<%@ include file="/WEB-INF/jsp/menubar.jsp"%></div>
<br/><br/><br/><br/><br/><br/><br/>
<c:set var = "NUM" value ="1"/>
<c:choose>
	<c:when test="${name == 'manager'}">
	<div align="right" style="position:fixed; margin-left:93.5%;">
<a href = "../item/updateItem.html?code=${ITEM.item_code }&TYPE=${ITEM.item_type}">수정</a> / <a href = "../item/deleteItem.html?code=${ITEM.item_code }&TYPE=${itemType}">삭제</a>
	</div><br/><br/><br/><br/><br/></c:when>
</c:choose>
<input type = "hidden" value ="${RESULT }" id="Popup">
	<c:choose>
		<c:when test="${not empty RESULT }">
			<script>returned();</script>
		</c:when>
	</c:choose>
	
	
	<div class="all">
	<div class="left">
<img alt="" src="${pageContext.request.contextPath}/itemimage/${ITEM.item_image}" width="100%">
<h3 align = "center"><font color="gray">  </font></h3>
	<c:forEach var = "IMAGE" items="${ADD }">
		<img alt = "" src ="${pageContext.request.contextPath}/addimage/${IMAGE.item_add_image}" width = "100%">
	</c:forEach>
	
	
<form name="REPLY" action ="../item/addReply.html" method="POST">
<input type = "hidden" value="${ITEM.item_code }" name = "CODE">
<input type="hidden" value="${LOGIN_KEY }" name="loginid">
Review<br/><br/>
<textarea rows ="10px;" style="padding: 1px;
		border: 1px none green;
		border-bottom: 1px solid black;
		border-top: 1px solid black;width:100%;" name = "INFO"></textarea><br/>
		<a href="javascript:reply();" style="float:right;" >Write</a><br/>
		
</form>
<c:forEach var = "Reply" items="${REPLYLIST }">
<table>
	<tr>
		<td>${Reply.reply_id } : </td>
		<td>${Reply.reply_content }</td>
		<td>${Reply.reply_date }</td>
		<c:choose>
			<c:when test="${Reply.reply_id == RC}">
				<td ><a href="">수정</a> / <a href="../item/deleteReply.html?code=${ITEM.item_code }&number=${Reply.reply_number}">삭제</a>
			</c:when>
		</c:choose>
	</tr>
</table>
</c:forEach>
</div>
<div class="right">
<form name = "move" action="../cache/payment.html" method = "get">
<div align="left" style="position:fixed; margin-left: 8%; margin-top:5%;">
		<div style="font-size:100%">${ITEM.item_name }<br/><br/>
	</div>
	<div style="font-size:80%">
	<c:choose>
	<c:when test="${ITEM.item_sale > 0}">
		<font style="text-decoration:line-through">${ITEM.item_price } won</font> &nbsp;${ITEM.item_sale }%<br/></br>
		${ITEM.item_price - (ITEM.item_price * (ITEM.item_sale / 100) )} won<br/>
	</c:when>
	<c:otherwise>
		${ITEM.item_price } won<br/>
	</c:otherwise>
	</c:choose>
</div>

	<br/><br/><br/><br/><br/>
	Color &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<select style="border-width: 0;" name = "COLOR">
			<c:forEach var = "color" items="${COUNT }">
				<c:choose>
				<c:when test="${color.item_count_count != 0 }">
					<option>${color.item_count_color }</option>
				</c:when>
				<c:otherwise>
					<option>[품절]${color.item_count_color }</option>
				</c:otherwise>
				</c:choose>
			</c:forEach>
		</select>
		
		<br/><br/>
		Size&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${ITEM.item_size }<br/><br/>
	
	수량 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<select style="border-width: 0;" name = "COUNT">
					<c:forEach var = "SUM" begin = "1" end = "5">
					<option>${SUM }</option>
					</c:forEach>
		</select><br/><br/><br/>
		<input name="SEX" type="hidden" value="${ITEM.item_gender }">
		<input name ="CODE" type = "hidden" value="${ITEM.item_code }">
		<input name="login" type="hidden" value="${sessionScope.LOGIM_KEY }">
	<a href="javascript:buy();">Buy Now</a>&nbsp; &nbsp;
	<a href="javascript:goCart();" >Add To Cart</a>	
	</div>
</form>
</div>
</div>
<br/>
<%@ include file ="/WEB-INF/jsp/undertag.jsp"%>
</body>
</html>








