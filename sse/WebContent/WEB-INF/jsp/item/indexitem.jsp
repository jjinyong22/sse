<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ page import="java.text.*"%> 
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<title>상품 목록 화면</title>
<style>
	@import url(https://fonts.googleapis.com/css?family=Raleway:500,900);
figure.snip1432 {
  font-family: 'Raleway', Arial, sans-serif;
  color: #fff;
  position: relative;
  overflow: hidden;
  min-width: 97%;
  max-width: 97%;
  margin-left:2%;
  width: 100%;
  background: #000000;
  color: #ffffff;
  text-align: left;
}
figure.snip1432 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.6s ease;
  transition: all 0.6s ease;
}
figure.snip1432 img {
  width: 100%;
  -webkit-transition: opacity 0.35s;
  transition: opacity 0.35s;
}
figure.snip1432 figcaption {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
figure.snip1432 figcaption > div {
  height: 50%;
  overflow: hidden;
  width: 100%;
  position: relative;
}
figure.snip1432 h2,
figure.snip1432 h3 {
  margin: 0;
  position: absolute;
  left: 0;
  padding: 0 30px;
  text-transform: uppercase;
}
figure.snip1432 h2 {
  font-weight: 900;
  top: 0;
}
figure.snip1432 h3 {
  font-size: 1em;
  bottom: 0;
  font-weight: 500;
}
figure.snip1432 h3:nth-of-type(2) {
  opacity: 0;
  -webkit-transform: translateY(150%);
  transform: translateY(150%);
}
figure.snip1432 a {
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  position: absolute;
}
figure.snip1432:hover img,
figure.snip1432.hover img {
  opacity: 0.3;
  -webkit-filter: grayscale(100%);
  filter: grayscale(100%);
}
figure.snip1432:hover figcaption h3:first-of-type,
figure.snip1432.hover figcaption h3:first-of-type {
  -webkit-transform: translateY(150%);
  transform: translateY(150%);
  opacity: 0;
}
figure.snip1432:hover figcaption h3:nth-of-type(2),
figure.snip1432.hover figcaption h3:nth-of-type(2) {
  opacity: 1;
  -webkit-transform: translateY(0%);
  transform: translateY(0%);
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
<div class="menubar" style="z-index: 1000;">
<%@ include file="/WEB-INF/jsp/menubar.jsp"%></div>
<br/><br/><br/>
<c:set var = "row" value = "0"/>
<c:choose>
<c:when test="${name == 'manager'}">
<p style ="float:right; color:blue;"><a href = "../item/addItem.html?itemType=${itemType }" style ="cursor: pointer;">추가</a></p>
<br/><br/><br/><br/><br/><br/>
	</c:when>
</c:choose>
		<c:forEach items="${itemList }" var="item">
	
		<c:if test = "${row%5==0 }">
		</c:if>
		<div style="width:100%; height:100%; z-index: 500;">
		<div style="width:25%; height:50%; float:left; z-index: 500">
		
		<figure class="snip1432">
		<img hspace="3" alt="" src="${pageContext.request.contextPath}/itemimage/${item.item_image }" width="99%" height="650" >
				<figcaption>
		    <div>
		      <h3></h3>
		      <h3>${item.item_name }<hr/>
		     <c:choose>
			<c:when test="${item.item_sale > 0}">
				<font style="text-decoration:line-through">${item.item_price } won</font><br/></br>
				${item.item_price - ((item.item_price * item.item_sale) / 100) } won<br/>
			</c:when>
			<c:otherwise>
				${item.item_price } won<br/>
			</c:otherwise>
			</c:choose></h3>
		    </div>
		  </figcaption>
		  <a href="../item/detailItem.html?itemId=${item.item_code }&itemType=${itemType}"></a>
			</figure>
		
		
		
			</div>
			</div>
	<c:set var = "row" value = "${row+1 }"/>
	
	<c:if test = "${row%6==0 }">
		<br/>	
	</c:if>	
</c:forEach>
<br/>
<%@ include file ="/WEB-INF/jsp/undertag.jsp"%>
</body>
</html>




