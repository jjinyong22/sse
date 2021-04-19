<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
	function sendCart(){
		
		var checkArr = document.getElementsByName("addCheck");
		var countArr = document.getElementsByName("reNum");
		var colorArr = document.getElementsByName("reCOLOR");
		var codeArr = document.getElementsByName("reCODE");
		var checking = false;
		
		var countList = new String(); var colorList=new String(); var codeList = new String();
		
		for(var i = 0; i < checkArr.length; i++){
			if(checkArr[i].checked == true){
				checking = true;
				countList += countArr[i].value+",";
				colorList += colorArr[i].value+",";
				codeList += codeArr[i].value+",";
			}else{	
			}
		}
		if(checking == true){
			location.href = "../cache/cartPayment.html?COUNT="+countList+"&COLOR="+colorList+"&CODE="+codeList;
		}else{
			alert("üũ�� ����Ʈ�� �����ϴ�.");
		}
	}
	function checkResult(){
		var result = document.getElementById("RESULT").value;
		alert(result+"��° īƮ��ǰ ��� �����մϴ�.");
	}
</script>
</head>
<body>
<input type = "hidden" id = "RESULT" value = "${RESULT }">
<c:choose>
	<c:when test="${RESULT != null}">
		<script>checkResult();</script>
	</c:when>
</c:choose>
<div class = "menubar">
<%@ include file="/WEB-INF/jsp/menubar.jsp"%>
</div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<c:choose>
	<c:when test = "${CARTLIST == null }">
	<div align = "center">
	<h2 align ="center">īƮ�� ����ֽ��ϴ�.</h2>
	</div>
	</c:when>
	<c:otherwise>
	<div align = "center">
		<table style = "border: none;">
		<c:forEach var = "CART" items = "${CARTLIST }">
			<tr>
				<td width="50"><input type = "checkbox" name = "addCheck" value="üũ"></td>
				<td width="200" align ="center"><img alt="" src="${pageContext.request.contextPath}/itemimage/${CART.cart_image}" width = "60" height ="80"></td>
				<td width="250" align="center">${CART.cart_name }[${CART.cart_color }]</td>
				<td width="200" align ="center">${CART.cart_price } ��</td>
				<td><form name = "ACT" action ="../cart/updateCart.html?ID=${CART.cart_id }&CODE=${CART.cart_code}&COLOR=${CART.cart_color}" method = "post">
				<table>
						<tr>
							<td><input type ="text" value = "${CART.cart_count }" name="reNum" size="1"></td>
						</tr>
						<tr>
							<td><input type = "hidden" value = "${CART.cart_color }" name = "reCOLOR"></td>
						</tr>
						<tr>
							<td><input type = "hidden" value = "${CART.cart_code }" name = "reCODE"></td>
						</tr>
						<tr>
							<td align ="center"><input type = "submit" value = "����"></td>
						</tr>
					</table></form></td>
				<td><table>
					<tr>
						<td><a href = "../item/detailItem.html?itemId=${CART.cart_code }"><input type = "button" value = "��������"></a></td>
					</tr>
					<tr>
						<td><a href ="../cart/deleteCart.html?ID=${CART.cart_id }&CODE=${CART.cart_code}&COLOR=${CART.cart_color}"><input type = "button" value ="�����ϱ�"></a></td>
					</tr>
				</table>
			</tr>
		</c:forEach>
		</table>
		<hr width="95%" size="1" color="black"><br/><br/><br/><br/><br/>
		<input type = "button" value="�����ϱ�" onclick ="sendCart();">
	</div>
	
	</c:otherwise>
</c:choose>


<%@ include file ="/WEB-INF/jsp/undertag.jsp"%>
</body>
</html>