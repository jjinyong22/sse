<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<%@ include file="/WEB-INF/jsp/menubar.jsp"%></div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<div style="position:absolute;font-size:80%; left:3%;">${QNA_LIST.qna_title }</div><br/>
<c:choose>
		<c:when test="${name == 'manager' }">
		
		
		<div style="position:absolute;font-size:60%; left:3%;">   <c:out value="${QNA_LIST.qna_id}"/></div>
		
		</c:when>

           <c:when test="${QNA_LIST.qna_id != 'manager'}">
         <div style="position:absolute;font-size:60%; left:3%;">   <c:out value="${fn:substring(QNA_LIST.qna_id,0,3)}"/>****</div>
           </c:when>
           <c:otherwise>
         <div style="position:absolute;font-size:60%; left:3%;">   <c:out value="${QNA_LIST.qna_id}"/></div>
           </c:otherwise> 
          </c:choose><div style="position:absolute;font-size:60%; left:6.5%;"> &nbsp;&nbsp;| ${QNA_LIST.qna_date }</div><br/>
<hr width="95%" size="2" color="black">
<br/>
<div style="position:absolute;font-size:80%; left:3%;">${QNA_LIST.qna_content }</div>
<br/><br/><br/>
<br/><br/><br/>
<br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/>
<hr width="95%" size="2" color="black">

<c:choose>
	<c:when test="${QNA_LIST.qna_image == 'normal' && name != 'manager'}">
	
	</c:when>
	<c:when test="">
	
	
	</c:when>
	
	
	<c:otherwise>
	<div style="position:absolute;font-size:80%; left:3%;">  <a href="javascript:goReply()" style="text-decoration:none">답글</a>
  <a href="javascript:goModify()" style="text-decoration:none">수정</a>
  <a href="javascript:goDelete()" style="text-decoration:none">삭제</a></div>
	
	</c:otherwise>
</c:choose>


<div style="position:relative; left:92%; font-size:90%;"><a href="<c:url value = '../question/question.html?notice_id=manager'></c:url>" style="text-decoration:none">돌아가기</a></div>
<script type="text/javascript">
function goReply() {
	if(document.idc.ik.value == "" ){
		alert("로그인 후 이용 가능합니다.");
	}else{
  		 document.idc.action="../question/questionReply.html";
  		 document.idc.submit();
	}
	}
function goDelete() {
	if(document.idc.ik.value == document.idc.ik_check.value || document.idc.ik.value == "manager"){
  		  if(confirm('삭제 하시겠습니까?')){
  			document.idc.action="../question/questiondelete.html";
  			  document.idc.submit();
  		  }else{return false;}
	}else{
		alert("권한이 없습니다.")
	}
}
function goModify() {
	if(document.idc.ik.value == document.idc.ik_check.value || document.idc.ik.value == "manager"){
		 document.idc.action="../question/questionupdateForm.html";
		   document.idc.submit();
	}else{
		alert("접근권한이 없습니다.")
	}
}
</script>
<form name="idc" method="post">
	<input type="hidden" name="ik" value="${name }"/>
	<input type="hidden" name="ik_check" value="${QNA_LIST.qna_id }"/>
	<input type="hidden" name="number" value="${QNA_LIST.qna_number }"/>
	<input type="hidden" name="parent_id" value="${QNA_LIST.parent_id }"/>
	<input type="hidden" name="group_id" value="${QNA_LIST.group_id }"/>
	<input type="hidden" name="order_no" value="${QNA_LIST.order_no }"/>
	</form>

<%@ include file ="/WEB-INF/jsp/undertag.jsp"%>
</body>
</html>