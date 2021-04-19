<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" 
				prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" 
				prefix="form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>
	#box{
		padding: 1px;
		border: 1px none green;
		border-bottom: 1px solid black;
	}
	.menu{
	float: left;
	}
	
	.mypage{
	float: right;
	}
	
	a{text-decoration:none;color:black;}
   label, #toggle{display:none;}
/*    �̰� üũ�ڽ����� �����ִ°� */
   #nav{ padding:0; margin:0;display:inline;}
/*    �̰� ���Ʒ� �����̶� ������ */
   #nav li{display:inline;}
/*    li �������°� ���� */
    #nav{display:none;}
/*    �̰��ؾ� ������ �ؿ� �޴� ���� */
   #toggle:checked + #nav{display:block;} 
/*    �̰Ŵ� ���콺 �׼� �߰����ִ°� */
   label {display:block; 
   font-size:15px; padding:4px 3%;
   }
	
</style>

<script type="text/javascript">
	

	function textCheck(){
		if(document.loginn.searchh.value.length < 1){
			alert("�α��� �̻� �Է����ּ���.");
			return false;
		}
		document.loginn.submit();
		return true;
	}
	
	function loginCheck(){
		alert("������ �ٽ� Ȯ�����ּ���.");
	}

	function loginCheck(){
		alert("������ �ٽ� Ȯ�����ּ���.");
	}
	
	
	function typeCheck(){	
		if(document.logining.ID.value == ""){
		alert("���̵� �Է��ϼ���.");
		return false;
		}
		if(document.logining.PW.value == ""){
		alert("��й�ȣ�� �Է��ϼ���.");
		return false;
		}
		document.logining.submit();
		return true;
	}
	
	
	function slidemenu(id){
		if(id == "mypage"){
		var mypage = document.getElementById(id);
		if (parseInt(mypage.style.right) < -8) {
		      mypage.style.right = parseInt(mypage.style.right) + 10 + "px";
		      setTimeout("slidemenu('" + id + "')", 5);
		     }
		}else if(id == "back"){
			var stat = 'mypage';
			var menu = document.getElementById(stat);
			if(parseInt(menu.style.right) > -450){
				menu.style.right = parseInt(menu.style.right) -10 + "px";
				setTimeout("slidemenu('" + id +"')",5);
			}
		}else if(id == "menu"){
			var mypage = document.getElementById(id);
			if (parseInt(mypage.style.left) < -5) {
			      mypage.style.left = parseInt(mypage.style.left) + 10 + "px";
			      setTimeout("slidemenu('" + id + "')", 5);
			}
		}else if(id == "back2"){
			var stat = 'menu';
			var menu = document.getElementById(stat);
			if(parseInt(menu.style.left) > -550){
				menu.style.left = parseInt(menu.style.left) -10 + "px";
				setTimeout("slidemenu('" + id +"')",5);	
			}
		}
	}
	
	
	
</script>

</head>


<body>
<c:url value="/main/remain.html" var="messageUrl" />
<c:choose>
		<c:when test ="${not empty userNotLogin }">
			<script>loginCheck();</script>
		</c:when>
</c:choose>
<img src ="../img/menuicon.png" alt = "����" class = "menu" width = "2%" height = "2%" style="cursor:pointer;" onclick = "slidemenu('menu')"/>
<img src ="../img/mypageico.png"  alt = "����" class = "mypage" width = "2%" height = "2%" style="cursor:pointer;" onclick = "slidemenu('mypage')"/>



<div id="mypage" style = "position:absolute;  width:250px; height: 1000px; right:-350px; border:0.1em solid #cccccc; background-color:white;"> 
<img alt ="" src = "<c:url value = '/img/xicon.png'></c:url>" id = "back" width = "20" height = "20" style="cursor:pointer;" onclick = "slidemenu('back')"/>
<br/>
<br/>
<br/>
	<c:choose>
		<c:when test="${empty ID }">
		<form action="../login/login.html" method = "post" onsubmit="return typeCheck();" name = "logining">
			���̵� : <input type="text" size = "20" name="ID" id="box"/><br/>
			��  &nbsp;&nbsp;�� : <input type = "password" size = "20" name="PW" id="box"/><br/><br/><br/>
			<div align="center"><a href="javascript:typeCheck();">�α���</a></div><br/><br/>
		<div align="right"><a href="<c:url value='../entry/userEntry.html'></c:url>">ȸ������</a></div>	
		</form>
		</c:when>
		<c:when test = "${name != 'manager' }">
			&nbsp;&nbsp;ȯ���մϴ�  ${ID } ��<br/>
				<p align="right"><a href = "../logout/logout.html">&nbsp;&nbsp;�α׾ƿ�</a><br/><br/><br/></p><br/>
			<div id="body" style = "position:relative; background: white;">
			<label for="">
			 <a href="javascript:myModify()" style="font-size:90%; text-decoration:none">�� ���� ����</a><br/><hr>
			 <a href="../cache/purchase.html?cache_id=${name }" style="font-size:90%;text-decoration:none">�ֹ�������ȸ</a><br/><hr>
			 <a href="" style="font-size:90%;text-decoration:none">�����Ǳ� ����</a><br/><hr>
			 <a href="../question/question.html?qna_id=${name }&notice_id=manager" style="font-size:90%;text-decoration:none">��Q&A ����</a><br/><hr></label>
			</div>
		</c:when>
		<c:when test = "${name == 'manager' }">
			&nbsp;&nbsp;ȯ���մϴ�  ${ID } ��<br/>
				<p align="right"><a href = "../logout/logout.html">&nbsp;&nbsp;�α׾ƿ�</a><br/><br/><br/></p><br/>
			<div id="body" style = "position:relative; background: white;">
			<label for="">
			 <a href="../cache/purchase.html?cache_id=${name }&itemId=${item.item_code }" style="font-size:90%;text-decoration:none">�ֹ���������</a><br/><hr>
			 <a href="" style="font-size:90%;text-decoration:none">�����Ǳ� ����</a><br/><hr>
			 <a href="../question/question.html?qna_id=${name }&notice_id=manager" style="font-size:90%;text-decoration:none">���� ����</a><br/><hr></label>
			</div>
		</c:when>
	</c:choose>
</div>

<script type="text/javascript">
function myModify() {
		 document.up.action="../entry/userUpdateForm.html";
		   document.up.submit();
}
</script>
<form name="up" method="post">
	<input type="hidden" name="user_id" value="${name }"/>
</form>
<div id = "menu" style = "position:absolute; width:250px; height: 1000px; left:-550px; border:0.1em solid #cccccc; background-color:white;">
<img alt ="" src = "<c:url value = '/img/xicon.png'></c:url>" id = "back2" width = "20" height = "20" style="cursor:pointer;" onclick = "slidemenu('back2')" align = "right"/>

<form:form method="post" action="../item/search.html" id="loginn"><br/>
		<div id = "logo" align = "center">
<img alt="" src="<c:url value = '/img/kiki.png'></c:url>" width = "190px" height = "70px" onclick = "location.href='${messageUrl}'" style="cursor:pointer;">
<br/><br/></div> <div style = "padding: 0px 20px 0px 0px;">
<%-- 		<input type="hidden" value="${item.item_code }&itemType=${itemType}"/> --%>
&nbsp;<input type="text"name="search"  style="height:25px;" id="box"  placeholder="�α���  �̻� �̿� �� �ּ���."/>
		<a href="#" onclick="document.getElementById('loginn').submit();">
		<img src ="../img/search.png"  alt = "����" class = "mypage" width = "40" height = "40"/></a></form:form><br/><br/><br/><br/></div>
<label for="toggle"><hr>store<hr></label>
	<input type="checkbox" id="toggle"/>
	<ul id="nav">
	<label><label>
	<li><a href="<c:url value='../item/indexItem2.html'></c:url>"style="text-decoration:none">��ü����</a><hr></li>
	<li><a href="<c:url value='../item/indexItem.html?TYPE=outer'></c:url>"style="text-decoration:none">�ƿ��� </a><hr></li>
	<li><a href="<c:url value='../item/indexItem.html?TYPE=shirts'></c:url>"style="text-decoration:none">���� </a><hr></li>
	<li><a href="<c:url value='../item/indexItem.html?TYPE=jean'></c:url>"style="text-decoration:none">���� </a><hr></li>
	<li><a href="<c:url value='../item/indexItem.html?TYPE=shose'></c:url>"style="text-decoration:none">�Ź�</a></li></label></label>
	</ul>
	<div id="body" style = "position:relative; background: white;">
	<label for="">
 <a href="<c:url value = '../lookbook/allView.html'></c:url>" style="text-decoration:none">Look book</a><br/><hr>
 <a href="<c:url value = '../question/question.html?notice_id=manager'></c:url>" style="text-decoration:none">Q&A</a><br/><hr>
 <a href="../cart/cartList.html" style="text-decoration:none">Cart</a><br/><hr></label>
	</div>
</div>
<div align="center">
<img alt="" src="<c:url value = '/img/kiki.png'></c:url>" width = "20%" height = "15%" onclick = "location.href='${messageUrl}'" style="cursor:pointer;"/>
</div>
</body>
</html>







