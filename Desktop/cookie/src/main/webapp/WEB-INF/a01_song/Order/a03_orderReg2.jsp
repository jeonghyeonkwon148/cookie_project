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
	.input-group-text{width:100%;background-color:linen;
		color:black;font-weight:bolder;}
	.input-group-prepend{width:20%;}	
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
	$(document).ready(function() {
		$("#insBtn").click(function(){
			if(confirm("주문하시겠습니까?")){
				$("form").attr("action","insertOrder");
				$("form").submit();
			}
		})
	});
	
</script>
</head>
				
<body>
<div class="jumbotron text-center">
  <h2>주문</h2>
</div>
<div class="container">
	<h6 align="right">${customer.manager}님 로그인되었습니다.</h6>
	<div  id="logout">
		<a href="ctmrLogout">로그아웃</a>
	</div>
	<form method="post">	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">고객코드</span>
		</div>
		<select  name="num" class="form-control" >
			<option value="0">선택하세요</option>
			<c:forEach var="c" items="${clist}">		
			<option value="${c.num}">${c.cname}(${c.num})</option>
			</c:forEach>		
		</select>	
	</div>		
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">제품코드</span>
		</div>
		<select  name="no" class="form-control" >
			<option value="0">선택하세요</option>
			<c:forEach var="p" items="${plist}">		
			<option value="${p.no}">${p.pname}(${p.no})</option>
			</c:forEach>		
		</select>
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">주문수량</span>
		</div>
		<input name="order_cnt" class="form-control"  />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">총계</span>
		</div>
		<input name="tot" class="form-control"  />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">납기일</span>
		</div>
		<input type="text" name="due_dte" class="form-control"  />	
	</div>	
	
	<div style="text-align:right;">
			<input type="button" class="btn btn-success" 
				value="주문" id="insBtn"/>
			<input type="button" class="btn btn-info" 
				onclick="location.href='/myOrder'" 
				value="조회리스트" id="mainBtn"/>
	</div>	
	</form>	
	
</div>

    

</body>
</html>