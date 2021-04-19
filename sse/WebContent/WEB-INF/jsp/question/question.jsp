<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
</head>
<body>
<div class="menubar">
<%@ include file="/WEB-INF/jsp/menubar.jsp"%>
</div>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<c:forEach var="qna" items="${note }">
	<input type="hidden" name="number"  value="${qna.qna_number }"/>
	<hr width="95%" size="1" color="black">
	<div style="position:absolute;font-size:70%; left:4%;">공지</div>
	<div align="center" style="position:relative;font-size:70%; ">
	<a href="../question/questiondetail.html?number=${qna.qna_number}&order=${qna.order_no}&group=${qna.group_id}&parent=${qna.parent_id}">
	${qna.qna_title }</a></div>
	</c:forEach>
<c:choose>
<c:when test="${empty qna_id }">
	<c:set var = "count" value  = "${COUNT}"></c:set>
	<c:forEach var="qna" items="${QnA_LIST }">
	<input type="hidden" name="number"  value="${qna.qna_number }"/>
	<hr width="95%" size="1" color="black"><div style="position:absolute;font-size:70%; left:4%;">${count }</div>
	<div style="position:absolute; left:15%;font-size:70%;">
	<a href="../question/questiondetail.html?number=${qna.qna_number}&order=${qna.order_no}&group=${qna.group_id}&parent=${qna.parent_id}">
	${qna.qna_title }</a></div>
	<br/>
	<c:choose>
           <c:when test="${qna.qna_id != 'manager'}">
         <div style="position:absolute;font-size:60%; left:17%;">   <c:out value="${fn:substring(qna.qna_id,0,3)}"/>****</div>
           </c:when>
           <c:otherwise>
            <div style="position:absolute; left:17%; font-size:60%;"><c:out value="${qna.qna_id}"/></div>
           </c:otherwise> 
          </c:choose>
	<div style="position:relative;font-size:60%; left:22%;">| ${qna.qna_date }</div>
	<c:set var = "count" value = "${count-1 }"></c:set>
	</c:forEach>
</c:when>
	
	<c:when test="${name != 'manager' }">
	
			<c:set var = "count" value  = "${COUNT }"></c:set>
	<c:forEach var="myqna" items="${MYQnA_LIST }">
	<input type="hidden" name="number"  value="${myqna.qna_number }"/>
	<hr width="95%" size="1" color="black"><div style="position:absolute;font-size:70%; left:4%;">${count }</div>
	<div style="position:absolute; left:15%;font-size:70%;">
	<a href="../question/questiondetail.html?number=${myqna.qna_number}&order=${myqna.order_no}&group=${myqna.group_id}&parent=${myqna.parent_id}">
	${myqna.qna_title }</a></div>
	<br/><c:choose>
           <c:when test="${fn:length(myqna.qna_id) > 2}">
         <div style="position:absolute;font-size:60%; left:17%;">   <c:out value="${fn:substring(myqna.qna_id,0,3)}"/>****</div>
           </c:when>
           <c:otherwise>
            <div style="position:absolute; left:17%; font-size:60%;"><c:out value="${myqna.qna_id}"/></div>
           </c:otherwise> 
          </c:choose>
	<div style="position:relative;font-size:60%; left:22%;">| ${myqna.qna_date }</div>
	<c:set var = "count" value = "${count-1 }"></c:set>
	</c:forEach>
	</c:when>
	<c:otherwise>
</c:otherwise>
		</c:choose>
	<c:choose>
	<c:when test="${name != 'manager' }">
<hr width="95%" size="1" color="black">
<div align="center">
<c:set var="startPage" value=
"${currentPage-(currentPage % 10 == 0 ? 10:(currentPage%10))+1}"/>

<c:if test="${startPage > 10 }">
	<a href="javascript:goPage(${startPage - 10 })">[이전]</a>
	</c:if>

<c:if test="${(startPage + 10) < pageCount }">
<c:forEach var="pageNo" begin="${(startPage )}" end="${(startPage + 9) }">
	<font size="4"><c:if test="${currentPage == pageNo }"></c:if>
	<a href="javascript:goPage(${pageNo })">${pageNo }$</a>
	<c:if test="${currentPage == pageNo }"></c:if></font>
</c:forEach>
</c:if>

<c:if test="${(startPage + 10) > pageCount }">
<c:forEach var="pageNo" begin="${(startPage)}" end="${pageCount}">
	<font size="4"><c:if test="${currentPage == pageNo }"></c:if>
	<a href="javascript:goPage(${pageNo })">${pageNo }</a>
	<c:if test="${currentPage == pageNo }"></c:if></font>
</c:forEach>
</c:if>

<c:if test="${(startPage + 10) < pageCount}">
	<a href="javascript:goPage(${startPage + 10 })">[다음]</a>
	</c:if>

	</div>
	<form name="move" method="post">
	<input type="hidden" name="PAGE_NUM" value="${currentPage }"/>
	<input type ="hidden" name="id"/>
	</form>
	<script type="text/javascript">

	function goPage(page){
		document.move.action = "../question/question.html?notice_id=manager";
		document.move.PAGE_NUM.value = page;
		document.move.submit();
	}
	</script>
	</c:when>
	</c:choose>
	
	
	<form name="idc" method="post">
	<input type="hidden" name="ik" value="${name }"/>
	</form>	
	<c:choose>
	<c:when test="${name == 'manager' }">
	<div style="position:relative; left:92%; font-size:80%;"><a href="#" style="text-decoration:none" onClick="javascript:loginCheck()">
	 공지등록</a></div>
	</c:when>
	<c:otherwise>
	<div style="position:relative; left:92%; font-size:80%;"><a href="#" style="text-decoration:none" onClick="javascript:loginCheck()">
	문의하기</a></div>
	</c:otherwise>
	
	</c:choose>
	
	<script type="text/javascript">
	function loginCheck(){
		if(document.idc.ik.value == ""){
		alert("로그인 후 이용 가능합니다.");
		}else{
			location.href = "../question/questioninsert.html"
		}
	}
	</script>
	
<%@ include file ="/WEB-INF/jsp/undertag.jsp"%>
</body>