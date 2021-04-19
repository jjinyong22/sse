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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function updatestate(){
		document.upst.submit();
	}
	
	function checkstate(){
		var select = document.getElementsByName("cache_state");
		var selection = null;
		
		var state = document.getElementsByName("STATE");
		var station = null;
		
		if(state.length == 1){
			station = state[0].value;
		}else{
			station = state[state.length-1].value;
		}
		
		if(select.length == 1){
			selection = select[0];	
		}else{
			selection = select[select.length-1];	
		}
		for(var i = 0; i < selection.options.length; i++){
			
			if(selection.options[i].value == station){
				selection.options[i].selected = true;
				break;
			}
		}
	}
	
	function cancle(){
		alert("주문이 취소 되었습니다.");
		document.cancle.submit();
		document.cancle.action="../cache/removeCache.html";
		
	}
</script>
</head>
<body>
<div class = "menubar">
<%@ include file="/WEB-INF/jsp/menubar.jsp"%>
</div>

<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<c:choose>
	<c:when test = "${cache_list == null }">
	<div align = "center">
	<h2 align ="center">구매 한 상품이 없습니다.</h2>
	</div>
	</c:when>
	
	
	<c:when test="${name == 'manager' }">
	<div align="left" style="margin-left:5%;">
		<form:form method="post" action="../cache/searchcache.html" id="searchca"><br/>
		<select name="fake" id="box">
						<option value="jyunnbi">주문자</option>
						<option value="syuupatu">주문 일자</option>
						<option value="kannryou">주문상태</option>
					</select>
		<input type="text"name="search"  style="height:25px;" id="box" placeholder="두글자  이상 이용 해 주세요."/>
		<a href="#" onclick="document.getElementById('searchca').submit();">
		<img src ="../img/search.png"  alt = "오류" class = "mypage" width = "40" height = "40"/></a></form:form>
		
		
		</div><br/>
		<div align = "left">
		<table style = "border:none;">
			<tr>
				<td width="280" align="center"><hr align="right" width="84%" size="1" color="black"><br/></td>
				<td width="250" align ="center">주문자<hr width="80%" size="1" color="black">	<br/><br/></td>
				<td width="250" align ="center">상품정보<hr width="80%" size="1" color="black">	<br/><br/></td>
				<td width="250" align="center">주문일자<hr width="80%" size="1" color="black">	<br/><br/></td>
				<td width="250" align ="center">주문번호<hr width="80%" size="1" color="black">	<br/><br/></td>
				<td width="250" align ="center">주문금액<hr width="80%" size="1" color="black">	<br/><br/></td>
				<td width="250" align ="center">주문상태<hr width="80%" size="1" color="black">	<br/><br/></td>
				<td width="200" align="center"><hr align="left" width="79%" size="1" color="black"><br/></td>
			</tr>
		<hr align="center" width="94%" size="1" color="black">			
		
		<c:set var = "numcode" value="1"/>
		<c:forEach var = "cali" items = "${cache_list }">
			<tr>
				<td width="150" height="80" align ="center"><a href="../item/detailItem.html?itemId=${cali.cache_code }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="${pageContext.request.contextPath}/itemimage/${cali.cache_image}" width = "150" height ="150"></a></td>
				<td width="100" align="center">${cali.cache_id }<br/>
				<td width="100" align="center">${cali.cache_name }<br/>
				${cali.cache_size }</td>
				<td width="100" align="center">${cali.cache_date }</td>
				<td width="100" align="center">${cali.cache_code }</td>
				<td width="150" align ="center">${cali.cache_price }won</td>
					<td width="150" align ="center">
					${cali.cache_state }<br/><br/>
						<form name="upst" id="upset" action="../cache/updatestate.html">
				<input type="hidden" name="cache_id" value="${cali.cache_id }"/>
				<input type = "hidden" name="STATE" value="${cali.cache_state }">
				<input type="hidden" name="code" value="${cali.cache_code }">
				
					<select id="selectState" name="cache_state" id="box">
						<option value="jyunnbi">배송 준비</option>
						<option value="syuupatu">배송 출발</option>
						<option value="kannryou">배송 완료</option>
						<option value="yousei">반품요청</option>
					</select><br/>
					<c:choose>
					<c:when test="${not empty cali.cache_state }">
						<script>checkstate()</script>
					</c:when>
				</c:choose>
				<a href="../cache/removeCache.html?num=${cali.cache_num }&id=${cali.cache_id}&price=${cali.cache_price}">환불하기</a><br/>
				<a href="../cache/removeCache.html?num=${cali.cache_num }">교환하기</a><br/>
				</td>
				<td width="300" align="center"><a href="#" onclick="document.getElementById('upset').submit();">수정</a></td>
				</form>
					
			</tr>
			<c:set var ="numcode" value = "${numcode+1 }"/>
		</c:forEach>
		</table>
	</div>
	</c:when>
	
	
	
	
	<c:otherwise>
	<div align = "left">
		<table style = "border:none;">
			<tr>
				<td width="280" align="center"><hr align="right" width="81%" size="1" color="black"><br/></td>
				<td width="250" align ="center">상품정보<hr width="80%" size="1" color="black">	<br/><br/></td>
				<td width="250" align="center">주문일자<hr width="80%" size="1" color="black">	<br/><br/></td>
				<td width="250" align ="center">주문번호<hr width="80%" size="1" color="black">	<br/><br/></td>
				<td width="250" align ="center">주문금액<hr width="80%" size="1" color="black">	<br/><br/></td>
				<td width="250" align ="center">주문상태<hr width="80%" size="1" color="black">	<br/><br/></td>
				<td width="200" align="center"><hr align="left" width="88.8%" size="1" color="black"><br/></td>
			</tr>
		<hr align="center" width="94%" size="1" color="black">		
		<c:forEach var = "cali" items = "${cache_list }">
			<tr>
				<td width="150" align ="center"><a href="../item/detailItem.html?itemId=${cali.cache_code }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="${pageContext.request.contextPath}/itemimage/${cali.cache_image}" width = "180" height ="120"></a></td>
				<td width="100" align="center">${cali.cache_name }<br/>
				${cali.cache_size }</td>
				<td width="100" align="center">${cali.cache_date }</td>
				<td width="100" align="center">${cali.cache_code }</td>
				<td width="150" align ="center">${cali.cache_price }won</td>
				
					
					<td width="150" align ="center">
					${cali.cache_state }<br/><br/>
					<c:choose>
					<c:when test="${cali.cache_state == '결제 완료' }">
					<form name="cancle" id="cancle" action="../cache/removeCache.html?num=${cali.cache_num }&id=${cali.cache_id}&price=${cali.cache_price}">
					<input type="hidden" name="num" value="${cali.cache_num }"/>
				<input type = "hidden" name="id" value="${cali.cache_id }">
				<input type="hidden" name="price" value="${cali.cache_price }">
					</form>
					<a href="../cache/removeCache.html?num=${cali.cache_num }&id=${cali.cache_id}&price=${cali.cache_price}" >[주문취소]</a><br/>
					
					</c:when>
					<c:otherwise>
					<a href="../cache/removeCache.html?num=${cali.cache_num }&id=${cali.cache_id}&price=${cali.cache_price}">반품신청</a><br/>
					<a href="../cache/removeCache.html?num=${cali.cache_num }">교환하기</a><br/>
					</c:otherwise>
					</c:choose>
				</td>
				<td width="300" align="center"><a href="../item/detailItem.html?itemId=${cali.cache_code }">후기작성</a></td>
			</tr>
		</c:forEach>
		
		</table>
	</div>
	
	</c:otherwise>
</c:choose>


<%@ include file ="/WEB-INF/jsp/undertag.jsp"%>
</body>
</html>