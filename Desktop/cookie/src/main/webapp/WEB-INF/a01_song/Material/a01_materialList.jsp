<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<!-- Custom fonts for this template-->
<link href="a00_com/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom styles for this template-->
<link href="a00_com/css/sb-admin-2.min.css" rel="stylesheet">
<style>
	td{text-align:center;}
</style>
<script src="a00_com/vendor/jquery/jquery.min.js"></script>
<script src="a00_com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="a00_com/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="a00_com/js/sb-admin-2.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#frm01").on('keydown',function(e){
			if (e.key === 'Enter') {
				 e.preventDefault(); // 기본 동작 취소
			}
		});
		$("[name=mname]").keyup(function(){
        	if(event.keyCode==13){
        		$("form").submit();
        	}
        })
	});
</script>
</head>
<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">
	<!-- Sidebar -->
<jsp:include page="/sidebar" />
<!-- End of Sidebar -->

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

	<!-- Main Content -->
<div id="content">
	<!-- Topbar -->
<jsp:include page="/headerCookie" />
<!-- End of Topbar -->
<!-- Begin Page Content -->
<div class="container-fluid">
<div class="container">
	<h2 class="text-center">원재료 리스트</h2>
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input placeholder="원재료명" name="mname" value="${param.mname}" class="form-control mr-sm-2" />
	    <button class="btn btn-info" type="submit">Search</button>
	    <c:if test="${sessionScope.auth == 2 && sessionScope.deptno == 30}">
			<button class="btn btn-success" onclick="location.href='insertMaterial'" type="button">등록</button>
      </c:if>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="25%">
   	<col width="25%">
   	<col width="25%">
   	<col width="25%">

    <thead>
    
      <tr class="table-success text-center">
        <th>원재료코드</th>
        <th>원재료명</th>
        <th>단위</th>
        <th>가격</th>
      </tr>
    </thead>	
    <tbody>
    	<c:forEach var="material" items="${materialList}">
    	<tr ondblclick="goDetail('${material.mnum}')"><td>${material.mnum}</td><td>${material.mname}</td><td>${material.unit}</td>
    	<td><fmt:formatNumber value="${material.mprice}" pattern="###,###.#원" /></td></tr>
    	</c:forEach>
    </tbody>
	</table> 
</div></div></div></div>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">로그인 화면으로 돌아갑니다.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">아니오</button>
					<button class="btn btn-primary" type="button" onclick="logout()">예</button>
				</div>
			</div>
		</div>
	</div>


<script type="text/javascript">
	function goDetail(mnum){
		location.href="materialDetail?mnum="+mnum
	}

</script>       
</div>

</body>
</html>