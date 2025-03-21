<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<!-- Custom fonts for this template-->
<link href="a00_com/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="a00_com/css/sb-admin-2.min.css" rel="stylesheet">
<style>
td {
	text-align: center;
}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script
	src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api"
	type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {

});
</script>
</head>
<body id="page-top">
	<!-- Page Wrapper -->
<div id="wrapper">

	<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
<a
	class="sidebar-brand d-flex align-items-center justify-content-center"
	href="/cookiemain">
	<div class="sidebar-brand-icon rotate-n-15">
		<i class="fas fa-cookie"></i>
	</div>
	<div class="sidebar-brand-text mx-3">쿠키공장</div>
</a>

<!-- Divider -->
<hr class="sidebar-divider my-0">

<!-- Nav Item - Dashboard -->
<li class="nav-item"><a class="nav-link" href="/cookiemain">
		<i class="fas fa-fw fa-cookie-bite"></i> <span>메인화면</span>
</a></li>

<!-- Divider -->
<hr class="sidebar-divider">

<!-- Heading -->
<div class="sidebar-heading">시스템</div>

<!-- 회원정보 -->
<li class="nav-item"><a class="nav-link collapsed" href="#"
	data-toggle="collapse" data-target="#collapseComm"
	aria-expanded="true" aria-controls="collapseComm"> <i
		class="fas fa-fw fa-business-time"></i> <span>내 정보</span>
</a>
	<div id="collapseComm" class="collapse"
		aria-labelledby="headingComm" data-parent="#accordionSidebar">
		<div class="bg-white py-2 collapse-inner rounded">
			<a class="collapse-item" href="">내 정보</a>
				<!-- 로그인 상태에 따른 조건부 렌더링 -->
				<c:choose>
					<c:when test="${not empty sessionScope.customer}">
						<!-- 로그인 상태인 경우 -->
						<a class="collapse-item" href="/ctmrLogout">로그아웃</a>
					</c:when>
					<c:otherwise>
						<!-- 로그인 상태가 아닌 경우 -->
						<a class="collapse-item" href="/ctmrlogin2">로그인</a>
					</c:otherwise>
				</c:choose>
			<div class="collapse-divider"></div>
			
		</div>
	</div></li>

<!-- 회원서비스 -->
<li class="nav-item"><a class="nav-link collapsed" href="#"
	data-toggle="collapse" data-target="#collapseEmployee"
	aria-expanded="true" aria-controls="collapseEmployee"> <i
		class="fas fa-fw fa-building"></i> <span>채팅</span>
</a>
	<div id="collapseEmployee" class="collapse"
		aria-labelledby="headingEmployee" data-parent="#accordionSidebar">
		<div class="bg-white py-2 collapse-inner rounded">
			<a class="collapse-item" href="chatting">채팅</a> 
		</div>
	</div></li>
<!-- Nav Item - Pages Collapse Menu -->
<div id="collapsePages" class="collapse"
		aria-labelledby="headingPages" data-parent="#accordionSidebar">
</div>
<div id="collapsePage2s" class="collapse"
		aria-labelledby="headingPages" data-parent="#accordionSidebar">
</div>

<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

</ul>
<!-- end Sidebar -->
<div class="container">
<h2 class="text-center">제품리스트</h2>
	<form id="frm01" class="form" method="post">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<input placeholder="제품명" name="pname" value="${param.pname}"
			class="form-control mr-sm-2" />
		<button class="btn btn-info" type="submit">Search</button>
		<button class="btn btn-success"
			onclick="location.href='/ctmrlogin2'" type="button">로그인</button>
	</nav>
</form>
<table class="table table-hover table-striped">
	<col width="25%">
	<col width="25%">
	<col width="25%">
	<col width="25%">

	<thead>

		<tr class="table-success text-center">
			<th>제품코드</th>
			<th>제품명</th>
			<th>단위</th>
			<th>가격</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="product" items="${productList}">
			<tr ondblclick="goDetail('${product.pname}')">
				<td>${product.no}</td>
				<td>${product.pname}</td>
				<td>${product.unit}</td>
				<td><fmt:formatNumber value="${product.price}"
						pattern="###,###.#원" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<!-- Bootstrap core JavaScript-->
<script src="a00_com/vendor/jquery/jquery.min.js"></script>
<script src="a00_com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="a00_com/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="a00_com/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="a00_com/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="a00_com/js/demo/chart-area-demo.js"></script>
<script src="a00_com/js/demo/chart-pie-demo.js"></script>
<script type="text/javascript">
function goDetail(pname) {
	location.href = "productDetail?pname=" + pname
}
</script>
		</div>
</body>
</html>