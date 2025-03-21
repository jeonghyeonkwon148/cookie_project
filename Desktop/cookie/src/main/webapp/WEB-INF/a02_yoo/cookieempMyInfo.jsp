<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Cookie My Information</title>

<!-- Custom fonts for this template-->
<link href="a00_com/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="a00_com/css/sb-admin-2.min.css" rel="stylesheet">


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
					<h1 class="h3 mb-2 text-gray-800">내 정보</h1>
					<p class="mb-4">오늘도 열심히</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">내 사원 정보</h6>
						</div>
						<div class="card-body row justify-content-center">
							<div class="col-xl-7">
							<form id="myInfoForm" class="user" method="post">
								<div class="form-group row" id="empnoInput">
									<div class="col-sm-3 mb-5 mb-sm-0">
										<input style="text-align: center;" type="text"
											class="form-control form-control-user" value="사원번호" readonly>
									</div>
									<div class="col-sm-9">
										<input style="text-align: center;" type="text"
											class="form-control form-control-user" name="empno" maxlength="10" readonly>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-3 mb-5 mb-sm-0">
										<input style="text-align: center;" type="text"
											class="form-control form-control-user" value="사원이름" readonly>
									</div>
									<div class="col-sm-9">
										<input style="text-align: center;" type="text"
											class="form-control form-control-user" name="ename">
									</div>
								</div>
								<div class="form-group row" id="pwdInputBox">
									<div class="col-sm-3 mb-5 mb-sm-0">
										<input style="text-align: center;" type="text"
											class="form-control form-control-user" value="비밀번호" readonly>
									</div>
									<div class="col-sm-6">
										<input style="text-align: center;" type="password"
											class="form-control form-control-user" name="pwd" maxlength="15">
									</div>
									<div class="col-sm-3">
										<button type="button"
											class="btn btn-secondary btn-user btn-block" id="showPwd">
											보이기</button>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-3 mb-5 mb-sm-0">
										<input style="text-align: center;" type="text"
											class="form-control form-control-user" value="직급" readonly>
									</div>
									<div class="col-sm-9">
										<input style="text-align: center;" type="text"
											class="form-control form-control-user" readonly id="authName">
										<input type="hidden" name="auth" readonly>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-3 mb-5 mb-sm-0">
										<input style="text-align: center;" type="text"
											class="form-control form-control-user" value="부서이름" readonly>
									</div>
									<div class="col-sm-6">
										<input style="text-align: center;" type="text"
											class="form-control form-control-user" id="dname" readonly>
									</div>
									<div class="col-sm-3">
										<input style="text-align: center;" type="text"
											class="form-control form-control-user" id="deptno" readonly>
									</div>
								</div>
								<div class="form-group row" id="salInputBox">
									<div class="col-sm-3 mb-5 mb-sm-0">
										<input style="text-align: center;" type="text"
											class="form-control form-control-user" value="월급" readonly>
									</div>
									<div class="col-sm-6">
										<input style="text-align: center;" type="text"
											class="form-control form-control-user" name="sal" readonly>
									</div>
									<div class="col-sm-3">
										<input style="text-align: center;" type="text"
											class="form-control form-control-user" value="원" readonly>
									</div>
								</div>
							</form>
							</div>
						</div>
						<div class="card-footer row justify-content-center">
							<div class="col-xl-4">
								<button type="button" class="btn btn-secondary btn-user btn-block"
									data-toggle="modal" data-target="#updateModal">
									정보수정</button>
							</div>
						</div>
					</div>
				</div>
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
					<button class="btn btn-primary" type="button" id="logoutBtn" onclick="logout()">예</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 수정여부를 묻는 Modal-->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
		aria-labelledby="updateModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="updateModalLabel">내 정보를 수정하시겠습니까?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<h6>수정을 원하시면 기존 비밀번호를 입력하세요</h6>
					<div class="form-group row">
						<div class="col-sm-3 mb-5 mb-sm-0">
							<input style="text-align: center;" type="text"
								class="form-control" value="비밀번호" readonly>
						</div>
						<div class="col-sm-6">
							<input style="text-align: center;" type="password"
								class="form-control" id="pwdChk">
						</div>
						<div class="col-sm-3">
							<button type="button"
								class="btn btn-secondary btn-block" id="showPwdChk">
								보이기</button>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">아니오</button>
					<button class="btn btn-warning" type="button" onclick="checkPassword()">수정</button>
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


	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#showPwd").mousedown(function(){
				$("[name=pwd]").attr("type","text")
			})
			$("#showPwd").mouseup(function(){
				$("[name=pwd]").attr("type","password")
			})
			$("#showPwd").mouseleave(function(){
				$("[name=pwd]").attr("type","password")
			})
			
			$("#showPwdChk").mousedown(function(){
				$("#pwdChk").attr("type","text")
			})
			$("#showPwdChk").mouseup(function(){
				$("#pwdChk").attr("type","password")
			})
			$("#showPwdChk").mouseleave(function(){
				$("#pwdChk").attr("type","password")
			})
			
			// 사원 이름 검색 form의 엔터키 작동(submit) 무효화
			$('form').on('keydown', function(e) {
				if (e.key === 'Enter') {
					e.preventDefault(); // 기본 동작 취소
				}
			});
			
			myEmpInfo(sesEmpno)
			
		})
		let sesEmpno = "${sessionScope.empno}"
		let sesDeptno = "${sessionScope.deptno}"
		let sesAuth = "${sessionScope.auth}"
		
		<% session.setMaxInactiveInterval(60 * 60); %>
		
		function myEmpInfo(empno){
			$.ajax({
				url : "ajaxsearchCEmp",
				type : "post",
				data : "empno=" + empno,
				dataType : "json",
				success : function(emp) {
					let authName = ""
					$("[name=empno]").val(emp.empno)
					$("[name=ename]").val(emp.ename)
					$("[name=pwd]").val(emp.pwd)
					if (emp.auth == 1) {
						authName = "사원"
					} else if (emp.auth == 2) {
						authName = "관리자"
					} else {
						authName = "시스템관리자"
					}
					$("#authName").val(authName)
					$("#dname").val(emp.dname)
					$("#deptno").val(emp.deptno)
					$("[name=sal]").val(emp.sal)
				},
				error : function(err) {
					console.log(err)
				}
			})
		}
		
		function checkPassword(){
			let chkPwd = $("#pwdChk").val()
			$.ajax({
				url:"/ajaxCheckCEPassword",
				type:"post",
				data:"empno="+sesEmpno+"&pwd="+chkPwd,
				success:function(emp){
					if(emp.pwd==chkPwd){
						updateEmp()
					}else{
						alert("비밀번호가 올바르지 않습니다");
					}
				},
				error:function(err){
					console.log(err)
				}
			})
		}
		
		function updateEmp(){
			let udtEname = $("[name=ename]").val()
			let udtPwd = $("[name=pwd]").val()
			let udtSal = $("[name=sal]").val()
			$.ajax({
				url:"ajaxupdateCookieEmp",
				type:"post",
				data:"empno="+sesEmpno+"&pwd="+udtPwd
					+"&ename="+udtEname+"&sal="+udtSal,
				success:function(msg){
					alert(msg+"\n변경된 비밀번호로 다시 로그인 하십시오");
					$("#logoutBtn").click()
				},
				error:function(err){
					console.log(err)
					console.log(sesEmpno)
					console.log(udtPwd)
					console.log(udtEname)
					console.log(udtSal)
				}
			})
		}
		
	</script>

</body>
</html>