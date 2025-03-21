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
<style type="text/css">
	.input-group-text{width:100%;background-color:linen;
		color:black;font-weight:bolder;}
	.input-group-prepend{width:20%;}
	#chatArea{
		width:80%;height:200px;overflow-y:auto;text-align:left;
		border:1px solid green;
	}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<!-- Custom fonts for this template-->
<link href="a00_com/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="a00_com/css/sb-admin-2.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#regBtn").click(function(){
			if(confirm("등록하시겠습니까?")){
				$("form").submit()
			}
		})
		$("#mainBtn").click(function(){
			location.href="joboardList"
		})
		var msg = "${msg}"
		if(msg!="")
			alert(msg)
			if(msg.indexOf("등록")>=0){
				location.href="joboardList"	
			}
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
				<jsp:include page="/header" />
				<!-- End of Topbar -->
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">게시판 등록</h1>
					<p class="mb-4">News Registration</p>
</div>
<div class="container">
	<form method="post" action="joboardInsert" enctype="multipart/form-data">
		    
		<input type="hidden" name="refno" value="${empty re.refno?0:re.refno}"/>
		
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">제목</span>
		</div>
		<input name="subject" class="form-control" value="${re.subject}" />
		
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">카테고리</span>
		</div>
			<select  name="category" class="form-control" value="${re.category}">
				<option value="0">선택하세요.</option>
				<option value="공지"> [ 공 지 사 항 ]</option>
				<option value="복지"> [ 복 지 사 항 ]</option>
				<option value="협찬"> [ 협 찬 ]</option>
				<option value="기사"> [ 기 사 ]</option>	
				<option value="이벤트">[ 이 벤 트 ]</option>			
			</select>	
		</div>
		
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">작성자</span>
		</div>
		<input name="writer" class="form-control" value="${sessionScope.ename}" readonly />
		
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">부서번호</span>
		</div>
		<input name="deptno" class="form-control" value="${sessionScope.deptno}" readonly/>	
			
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">내용</span>
		</div>
		<textarea name="content" class="form-control"  rows="10" cols="20">${re.content}</textarea>
	</div>		
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">첨부파일</span>
		</div>
		<input type="file" multiple="multiple" name="reports" class="form-control" value="" />
	</div>		
	<div style="text-align:right;">
			<input type="button" class="btn btn-success" value="등록" id="regBtn"/>
			<input type="button" class="btn btn-info"
				value="조회리스트" id="mainBtn"/>
	</div>	
	</form>		
	
    
</div>
<!-- End of Main Content -->

				<!-- Footer -->
				<div id="footerBox">
					<jsp:include page="/yoofooterCookie" />
				</div>
				<!-- End of Footer -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

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
		</div>
		

		<!-- Bootstrap core JavaScript-->
		<script src="a00_com/vendor/jquery/jquery.min.js"></script>
		<script src="a00_com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script src="a00_com/vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="a00_com/js/sb-admin-2.min.js"></script>

		<!-- Page level plugins -->
		<script src="a00_com/vendor/datatables/jquery.dataTables.min.js"></script>
		<script src="a00_com/vendor/datatables/dataTables.bootstrap4.min.js"></script>

		<!-- Page level custom scripts -->
		<script src="a00_com/js/demo/datatables-demo.js"></script>
</body>
</html>