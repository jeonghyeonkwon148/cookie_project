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

<title>Cookie Employee</title>

<!-- Custom fonts for this template-->
<link href="a00_com/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="a00_com/css/sb-admin-2.min.css" rel="stylesheet">

<style type="text/css">
tbody tr:hover {
	background-color: rgb(245, 245, 245);
}
tbody tr:active {
	background-color: rgb(235, 235, 235);
} 
</style>

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
					<h1 class="h3 mb-2 text-gray-800">사원목록</h1>
					<p class="mb-4">오늘도 열심히</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">직원의 정보</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<form class="form-inline" id="eSFrm">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="사원 이름을 검색하세요" name="ename" id="sEname">
									</div>

									<input type="hidden" name="curPage"/>
									<input type="hidden" name="pageSize"/>

									<div class="input-group">
										<select class="form-control bg-light border-0 small"
											name="deptno" id="sDeptno" onchange="uptPageSize()">
											<option value='%%'>전체부서</option>
										</select>
									</div>
									<div class="input-group">
										<select class="form-control bg-light border-0 small"
											id="pageSize" onchange="uptPageSize()">
											<option>5</option>
											<option>10</option>
											<option>20</option>
											<option>50</option>
										</select>
										<div class="input-group-append">
											<button class="btn btn-primary" type="button" id="eNSchBtn">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>

								<table class="table table-bordered" width="100%" 
									cellspacing="0">
									<col width="25%">
									<col width="25%">
									<col width="25%">
									<col width="25%">
									<thead>
										<tr>
											<th>사원번호</th>
											<th>사원이름</th>
											<th>직급</th>
											<th>부서</th>
										</tr>
									</thead>
									<tbody id="etbody">
									</tbody>
								</table>
							</div>
						</div>
						<div class="card-footer">
							<div class="row">
								<div class="col-sm-5">
									<button type="button" class="btn btn-secondary">
										총 <span class="badge badge-light" id="empCount"></span> 명
									</button>	
									<button type="button" class="btn btn-primary" id="insModalOpenBtn" data-toggle="modal" data-target="#askDeptModal">
										사원등록</button>
								</div>
								<div class="col-sm-7">
									<ul class="pagination justify-content-end center" id="pageBlockUl">
										<li class="page-item"><a class="page-link"
											href="" id="PreviousA">Previous</a></li>
											
										<span id="pageForIn" class="row" style="margin-left: 0px;margin-right: 0px;"></span>
										
										<li class="page-item"><a class="page-link"
											href="" id="NextA">Next</a></li>
										
									</ul>
										
								</div>
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
					<button class="btn btn-primary" type="button" onclick="logout()">예</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 사원등록시, 부서를 묻는 모달 -->
	<div class="modal fade" id="askDeptModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">부서를 고르세요</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<h6>등록할 사원의 부서를 골라주세요</h6>
					<div class="form-group row" id="salInputBox">
						<div class="col-sm-6 mb-5 mb-sm-0">
							<select class="form-control bg-light small"
								id="deptnoM">
								
							</select>
						</div>
						<div class="col-sm-6">
							<select class="form-control bg-light small"
								id="authM">
								<option value='1'>
									사원
								</option>
								<option value='2'>
									관리자
								</option>
							</select>
						</div>
					</div>
					
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">취소</button>
					<button class="btn btn-primary" type="button" onclick="openInsModal()"
						data-dismiss="modal">선택</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 사원정보 모달 띄우는 div -->
	<div id="showModal" data-toggle="modal"
		data-target="#exampleModalCenter"></div>
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalTitle">사원 상세 정보</h5>
					<button type="button" id='clsBtn' class="close"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="cooEDForm" class="user">
						<div class="form-group row" id="empnoInput">
							<div class="col-sm-3 mb-5 mb-sm-0">
								<input style="text-align: center;" type="text"
									class="form-control form-control-user" value="사원번호" readonly>
							</div>
							<div class="col-sm-9">
								<input style="text-align: center;" type="text"
									class="form-control form-control-user" id="dEmpno" readonly>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-3 mb-5 mb-sm-0">
								<input style="text-align: center;" type="text"
									class="form-control form-control-user" value="사원이름" readonly>
							</div>
							<div class="col-sm-9">
								<input style="text-align: center;" type="text"
									class="form-control form-control-user" name="ename" id="dEname">
							</div>
						</div>
						<div class="form-group row" id="pwdInputBox">
							<div class="col-sm-3 mb-5 mb-sm-0">
								<input style="text-align: center;" type="text"
									class="form-control form-control-user" value="비밀번호" readonly>
							</div>
							<div class="col-sm-6">
								<input style="text-align: center;" type="password"
									class="form-control form-control-user" name="pwd">
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
									class="form-control form-control-user" id="dDname" readonly>
							</div>
							<div class="col-sm-3">
								<input style="text-align: center;" type="text"
									class="form-control form-control-user" name="deptno" id="dDeptno" readonly>
							</div>
						</div>
						<div class="form-group row" id="salInputBox">
							<div class="col-sm-3 mb-5 mb-sm-0">
								<input style="text-align: center;" type="text"
									class="form-control form-control-user" value="월급" readonly>
							</div>
							<div class="col-sm-6">
								<input style="text-align: center;" type="text"
									class="form-control form-control-user" name="sal">
							</div>
							<div class="col-sm-3">
								<input style="text-align: center;" type="text"
									class="form-control form-control-user" value="원" readonly>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
						<span id="fixBtnBox">
							<button type="button" class="btn btn-primary" id="insBtn" onclick="insertEmp()">
								사원등록</button>
							<button type="button" class="btn btn-warning" id="udtBtn" onclick="updateEmp()">
								정보수정</button>
							<button type="button" class="btn btn-danger" id="delBtn" onclick="deleteEmp()">
								삭제</button>
						</span>
						<button type="button" class="btn btn-secondary" id="msgBtn" onclick="sendToEmp()">
							메세지</button>
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

	<script type="text/javascript">
		$(document).ready(function() {
			
			
			getDeptAjax()
			$("#showPwd").mousedown(function(){
				$("[name=pwd]").attr("type","text")
			})
			$("#showPwd").mouseup(function(){
				$("[name=pwd]").attr("type","password")
			})
			$("#showPwd").mouseleave(function(){
				$("[name=pwd]").attr("type","password")
			})
			
			$("#insBtn").hide()
			$("#insModalOpenBtn").hide()
			
			if(sesDeptno==10||sesAuth>2){
				$("#insModalOpenBtn").show()
				if(insertNo==5){
					$("#insModalOpenBtn").click()
				}
			}else if(sesAuth==1){
				hideDetail();
			}else if(sesAuth==2&&insertNo==5){
				alert("사원등록 권한이 없습니다")
			}
			// 사원 이름 검색 form의 엔터키 작동(submit) 무효화
			$('form').on('keydown', function(e) {
				if (e.key === 'Enter') {
					e.preventDefault(); // 기본 동작 취소
				}
			});

			// 사원 이름 검색 form의 input에 엔터키를 입력하면 ajax 작동
			$("#sEname").keyup(function() {
				if (event.keyCode == 13) {
					$("[name=curPage]").val(1)
					onAjax()
				}
			})

			// 돋보기 버튼을 누르면 ajax 작동
			$("#eNSchBtn").click(function() {
				$("[name=curPage]").val(1)
				onAjax()
			})
			//console.log("ready"+startBlock)

		})
		
		let curPage = $("[name=curPage]").val(1)
		let pageSize = $("[name=pageSize]").val(5)
		let startBlock = "";
		let sesEmpno = "${sessionScope.empno}"
		let sesDeptno = "${sessionScope.deptno}"
		let sesAuth = "${sessionScope.auth}"
		let insertNo = `${param.insertNo}`
		let goDeptno = `${param.goDeptno}`
			//console.log(goDeptno)
			//console.log(sesDeptno)
			//console.log(sesAuth)

		// 페이지 로드 되면 ajax 작동
		onAjax()
		<% session.setMaxInactiveInterval(60 * 60); %>
		
		function hideDetail(){
			$("#pwdInputBox").hide()
			$("#salInputBox").hide()
			$("#fixBtnBox").hide()
		}

		// ajax 실행하는 함수
		function onAjax() {
			// 사원 이름, 부서번호를 지정
			let sEname = $("#sEname").val()
			let sDeptno = $("#sDeptno").val()
			let pageSize = $("[name=pageSize]").val()
			let curPage = $("[name=curPage]").val()
			//console.log(sEname)
			//console.log(sDeptno)
			//console.log(pageSize)
			//console.log(curPage)
			pageAjax(sEname, sDeptno, pageSize, curPage)
			eLAjax(sEname, sDeptno, pageSize, curPage);
		}

		// 사원정보 검색하는 ajax
		function eLAjax(ename, deptno, pageSize, curPage) {
			$.ajax({
				url : "ajaxsearchCEList",
				type : "post",
				data : "ename=" + ename + "&deptno=" + deptno + "&pageSize="
						+ pageSize + "&curPage=" + curPage,
				dataType : "json",
				success : function(emps) {
					//console.log("리스트 출력")
					let addHTML = ""
					let job = ""
					$(emps).each(
							function(idx, emp) {
								let empno = emp.empno
								let ename = emp.ename
								let dname = emp.dname
								if (emp.auth == 1) {
									job = "사원"
								} else if (emp.auth == 2) {
									job = "관리자"
								} else {
									job = "시스템관리자"
								}
								//console.log(empno)
								//console.log(ename)
								//console.log(job)
								//console.log(dname)
								addHTML += "<tr ondblclick='openDt(" + empno
										+ ")'><td>" + empno + "</td><td>"
										+ ename + "</td><td>" + job
										+ "</td><td>" + dname + "</td></tr>"
							})
					//console.log(addHTML)
					$("#etbody").html(addHTML)
				},
				error : function(err) {
					console.log(err)
				}
			})
		}

		// 사원정보 검색후 페이징처리 ajax
		function pageAjax(ename, deptno, pageSize, curPage) {
			$.ajax({
				url : "ajaxsearchCEListPage",
				type : "post",
				data : "ename=" + ename + "&deptno=" + deptno + "&pageSize="
						+ pageSize + "&curPage=" + curPage,
				dataType : "json",
				success : function(sch) {
					//console.log("ajax작동")
					startBlock = sch.startBlock;
					//console.log(startBlock)
					let endBlock = sch.endBlock;
					//console.log(endBlock)
					let curPage = sch.curPage;
					//console.log(curPage)
					let hrefP = "javascript:goPage(" + (startBlock - 1) + ")"
					//console.log(hrefP)
					let hrefN = "javascript:goPage(" + (endBlock + 1) + ")"
					//console.log(hrefN)
					$("#empCount").text(sch.count);
					let addHTML = ""
					for(let pcnt=startBlock; pcnt<=endBlock; pcnt++){
						let clboo = curPage==pcnt?'active':'';
						addHTML += "<li class=\"page-item "+clboo+"\">"+
				  				   "<a class=\"page-link\" href=\"javascript:goPage("+pcnt+")\">"+pcnt+"</a></li>"
					}
					//console.log(addHTML)
					$("#PreviousA").attr("href",hrefP)
					$("#NextA").attr("href",hrefN)
					$("#pageForIn").html(addHTML)

				},
				error : function(err) {
					console.log(err)
				}
			})
		}

		function openDt(empno) {
			$("#insBtn").hide()
			$("#udtBtn").show()
			$("#delBtn").show()
			$("#msgBtn").show()
			$("#empnoInput").show()
			if(sesDeptno!=10&&sesAuth==1){
				$("#dEname").attr("readonly",true)
				$("[name=pwd]").attr("readonly",true)
				$("[name=sal]").attr("readonly",true)
			}
			eDAjax(empno)
			$("#showModal").click();
		}
		
		function openInsModal(){
			$("#insBtn").show()
			$("#udtBtn").hide()
			$("#delBtn").hide()
			$("#msgBtn").hide()
			
			let insDeptno = $("#deptnoM").val()
			let insDname = $("#deptnoM option:selected").text()

			let insAuth = $("#authM").val()
			let insAuthName = ""
			if (insAuth == 1) {
				insAuthName = "사원"
			} else if (insAuth == 2) {
				insAuthName = "관리자"
			} else {
				insAuthName = "시스템관리자"
			}
					
			$("#empnoInput").hide()
			$("#dEname").val("")
			$("#dEname").attr("readonly",false)
			$("[name=pwd]").val("")
			$("[name=pwd]").attr("readonly",false)
			$("[name=auth]").val(insAuth)
			$("#authName").val(insAuthName)
			$("#dDname").val(insDname)
			$("#dDeptno").val(insDeptno)
			$("[name=sal]").val("")
			$("[name=sal]").attr("readonly",false)
			
			$("#showModal").click();
		}

		//사원 상세정보 검색하는 ajax
		function eDAjax(empno) {
			$.ajax({
				url : "ajaxsearchCEmp",
				type : "post",
				data : "empno=" + empno,
				dataType : "json",
				success : function(emp) {
					let authName = ""
					
					$("#dEmpno").val(emp.empno)
					$("#dEname").val(emp.ename)
					$("[name=pwd]").val(emp.pwd)
					$("[name=auth]").val(emp.auth)
					if (emp.auth == 1) {
						authName = "사원"
					} else if (emp.auth == 2) {
						authName = "관리자"
					} else {
						authName = "시스템관리자"
					}
					$("#authName").val(authName)
					$("#dDname").val(emp.dname)
					$("#dDeptno").val(emp.deptno)
					$("[name=sal]").val(emp.sal)
				},
				error : function(err) {
					console.log(err)
				}
			})
		}
		
		// 부서리스트 호출 ajax
		function getDeptAjax() {
			$.ajax({
				url : "ajaxgetCookieDept",
				type : "post",
				dataType : "json",
				success : function(depts) {
					//console.log("getDeptAjax 안")
					let addHTML = "";
					let defaultHTML = "<option value='%%'>전체부서</option>"
					$(depts).each(
							function(idx, dept) {
								addHTML += "<option value='"+ dept.deptno
										+ "'>" + dept.dname + "</option>"
							})
							//console.log(addHTML)
					$("#sDeptno").html(defaultHTML+addHTML)
					$("#deptnoM").html(addHTML)
					if(insertNo==6){
						$("#deptnoM").val(goDeptno)
						$("#insModalOpenBtn").click()
					}
				},
				error : function(err) {
					console.log(err)
				}
			})
		}

		function goPage(pcnt) {
			$("[name=curPage]").val(pcnt) // 클릭한 번호를 현재 페이지로 설정
			//console.log($("[name=curPage]").val())
			onAjax(); // 요청값으로 전송
		}

		function uptPageSize() {
			$("[name=pageSize]").val($("#pageSize").val())
			//console.log($("[name=pageSize]").val())
			$("[name=curPage]").val(1)
			//console.log($("[name=curPage]").val())
			onAjax();
		}
		
		function insertEmp(){
			let insAjaxEname = $("#dEname").val()
			let insAjaxPwd = $("[name=pwd]").val()
			let insAjaxAuth = $("[name=auth]").val()
			let insAjaxDeptno = $("#dDeptno").val()
			let insAjaxSal = $("[name=sal]").val()
			let salIsNum = /^\d+$/;
			if(salIsNum.test(insAjaxSal)){
				if(confirm("사원을 등록하시겠습니까?")){
					$.ajax({
						url:"ajaxinsertCookieEmp",
						type:"post",
						data:"ename="+insAjaxEname+"&pwd="+insAjaxPwd+
								"&auth="+insAjaxAuth+"&deptno="+insAjaxDeptno+
								"&sal="+insAjaxSal,
						success:function(msg){
							alert(msg);
							onAjax()
							$("#clsBtn").click()
							
						},
						error:function(err){
							console.log(err)
						}
					})
				}
			}else{
				alert("급여값을 수정해주세요")
			}
		}
		
		function updateEmp(){
			let udtAjaxEmpno = $("#dEmpno").val()
			let udtAjaxEname = $("#dEname").val()
			let udtAjaxPwd = $("[name=pwd]").val()
			let udtAjaxSal = $("[name=sal]").val()
			let salIsNum = /^\d+$/;

			if(sesEmpno==udtAjaxEmpno){
				alert("본인의 정보는 수정할 수 없습니다")
			}else{
				if(salIsNum.test(udtAjaxSal)){
					if(confirm("사원 정보를 수정하시겠습니까?")){
						$.ajax({
							url:"ajaxupdateCookieEmp",
							type:"post",
							data:"ename="+udtAjaxEname+
									"&pwd="+udtAjaxPwd+"&sal="+udtAjaxSal+"&empno="+udtAjaxEmpno,
							success:function(msg){
								alert(msg);
								onAjax()
								$("#clsBtn").click()
								
							},
							error:function(err){
								console.log(err)
							}
						})
					}
				}else{
					alert("급여값을 수정해주세요")
				}
			}
		}
		
		function deleteEmp(){
			let delAjaxEmpno = $("#dEmpno").val()

			if(sesEmpno==delAjaxEmpno){
				alert("본인의 정보는 삭제할 수 없습니다")
			}else{
				if(confirm("사원 정보를 삭제하시겠습니까?")){
					$.ajax({
						url:"ajaxdeleteCookieEmp",
						type:"post",
						data:"empno="+delAjaxEmpno,
						success:function(msg){
							alert(msg);
							onAjax()
							$("#clsBtn").click()
							
						},
						error:function(err){
							console.log(err)
						}
					})
				}
			}
		}
		
		function sendToEmp(){
			let empno = $("#dEmpno").val()
			let ename = $("#dEname").val()
			let dname = $("#dDname").val()
			if(confirm(ename+"님에게 메세지를 보내시겠습니까?")){
				location.href = "/yoocookiemessage?insertNo=6&sendToEmpno="
								+ empno + "&sendToEname=" + ename
								+ "&sendToDname=" + dname
			}
		}
	</script>

</body>
</html>