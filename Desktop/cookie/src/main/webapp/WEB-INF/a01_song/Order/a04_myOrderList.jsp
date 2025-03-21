<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	td{text-align:center;}
	#logout{
            text-align:right; }
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>


<script type="text/javascript">

	
	$(document).ready(function(){
		//alert("${customer.manager}")
		
	});
	
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>${customer.manager}님의 주문리스트</h2>

</div>
<%-- 
		
--%>
<div class="container">
	
	
	<div  id="logout">
		<a href="ctmrLogout">로그아웃</a>
	</div>
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <button class="btn btn-success" onclick="location.href='insertOrder'" type="button">주문</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="10%">
   	<col width="20%">
   	<col width="20%">
   	<col width="10%">
   	<col width="20%">
   	<col width="10%">
   	
   

    <thead>
    
      <tr class="table-success text-center">
      	<th>주문코드</th>
        <th>고객코드</th>
        <th>제품코드</th>
        <th>주문날짜</th>
        <th>주문수량</th>
        <th>총계</th>
        <th>납기일</th>
      </tr>
    </thead>	
    <tbody>
    	<c:forEach var="order" items="${orderList}">
    	<tr ondblclick="goDetail('${order.order_no}')"><td>${order.order_no}</td><td>${order.num}</td><td>${order.num}</td>
    	<td>${order.order_dte}</td><td>${order.order_cnt}</td><td>${order.tot}</td><td>${order.due_dte}</td></tr>
    	</c:forEach>
    </tbody>
	</table> 
		<script type="text/javascript">
		function goDetail(order_no){
			location.href="orderDetail?order_no="+order_no
		}
	
	</script>       
</div>

</body>
</html>