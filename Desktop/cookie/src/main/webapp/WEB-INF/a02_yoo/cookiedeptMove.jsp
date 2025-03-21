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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Cookie Department Update</title>

<!-- Custom fonts for this template-->
<link href="a00_com/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom styles for this template-->
<link href="a00_com/css/sb-admin-2.min.css" rel="stylesheet">

<style type="text/css">
div.card:hover {
	background-color: rgb(245, 245, 245);
}
div.card:active {
	background-color: rgb(235, 235, 235);
} 
</style>

</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Sidebar -->
    	<jsp:include page="/sidebar"/>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
                <!-- Topbar -->
    			<jsp:include page="/header"/>
                <!-- End of Topbar -->
				<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    	<div>
		                    <h1 class="h3 mb-2 text-gray-800">부서변경</h1>
							<p class="mb-4">사원을 선택하세요</p>
						</div>
					</div>
					<div class="row">
						<div class="col-6">
						
		                    <c:forEach var="dept" items="${dList}">
		                    	<c:choose>
		                    		<c:when test="${(dept.deptno/10)%5==1}">
			                    		<c:set var="cardColor" value="primary"/>
			                    		<c:set var="icon" value="address-book"/>
		                    		</c:when>
		                    		<c:when test="${(dept.deptno/10)%5==2}">
			                    		<c:set var="cardColor" value="success"/>
			                    		<c:set var="icon" value="cookie"/>
		                    		</c:when>
		                    		<c:when test="${(dept.deptno/10)%5==3}">
			                    		<c:set var="cardColor" value="info"/>
			                    		<c:set var="icon" value="truck"/>
		                    		</c:when>
		                    		<c:when test="${(dept.deptno/10)%5==4}">
			                    		<c:set var="cardColor" value="warning"/>
			                    		<c:set var="icon" value="box"/>
		                    		</c:when>
		                    		<c:when test="${(dept.deptno/10)%5==0}">
			                    		<c:set var="cardColor" value="danger"/>
			                    		<c:set var="icon" value="ghost"/>
		                    		</c:when>
		                    	</c:choose>
		                    		
			                    <div class="card border-left-${cardColor} shadow py-2 mb-2"
			                    	onclick="showDeptByEmps('${dept.deptno}')">
			                        <div class="card-body">
			                            <div class="row no-gutters align-items-center">
			                                <div class="col-sm-4">
			                    				<h4 class="font-weight-bold text-${cardColor} text-uppercase mb-2">
			                    					${dept.dname}
			                    				</h4>
			                                    <div class="h6 mb-0 font-weight-bold text-gray-800">
													부서번호 : ${dept.deptno}
												</div>
			                                </div>
			                                <div class="col">
			                       				<c:forEach var="emp" items="${eList}">
			                       					<c:if test="${emp.deptno==dept.deptno}">
					                                    <div class="font-weight-bold text-gray-800 mb-2">
															<i class="fas fa-user-tie"></i> ${emp.dname}팀 ${emp.ename} 관리자
														</div>
													</c:if>
												</c:forEach>
			                                </div>
			                                <div class="col-auto">
			                                	<c:if test="${not empty icon}">
		                    						<i class="fas fa-${icon} fa-3x text-gray-300"></i>
		                    					</c:if>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
		                    </c:forEach>
		                </div>
		                <div class="col-6" id="deptByEmps">
				                
		                </div>
					</div>
                </div>
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <div id="footerBox">
				<jsp:include page="/yoofooterCookie"/>
            </div>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top" id="goTop">
        <i class="fas fa-angle-up"></i>
    </a>

	<!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그인 화면으로 돌아갑니다.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
                    <button class="btn btn-primary" type="button" onclick="logout()">예</button>
                </div>
            </div>
        </div>
    </div>
    
	<!-- 부서 정보 모달 띄우는 div -->
	<div id="showModal" data-toggle="modal"
		data-target="#exampleModalCenter"></div>
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalTitle">사원 정보</h5>
					<button type="button" id='clsBtn' class="close"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="cooEDForm" class="user" method="post">
						<div class="form-group row">
							<div class="col-sm-3 mb-5 mb-sm-0">
								<input style="text-align: center;" type="text"
									class="form-control bg-light" value="사원이름" readonly>
							</div>
							<div class="col-sm-6">
								<input style="text-align: center;" type="text"
									class="form-control bg-light" id="ename" readonly>
							</div>
							<div class="col-sm-3">
								<input style="text-align: center;" type="text" 
									class="form-control bg-light" name="empno" readonly>
							</div>
						</div>
						<div class="form-group row" id="uDeptno">
							<div class="col-sm-3 mb-5 mb-sm-0">
								<input style="text-align: center;" type="text"
									class="form-control bg-light" value="부서" readonly>
							</div>
							<div class="col-sm-6">
								<select style="text-align: center;" class="form-control bg-light"
									id="dname" onchange="selectDept()">
									
								</select>
							</div>
							<div class="col-sm-3">
								<input style="text-align: center;" type="text" 
									class="form-control bg-light" name="deptno" readonly>
							</div>
						</div>
						<div class="form-group row" id="uDeptno">
							<div class="col-sm-3 mb-5 mb-sm-0">
								<input style="text-align: center;" type="text"
									class="form-control bg-light" value="직급" readonly>
							</div>
							<div class="col-sm-9">
								<select style="text-align: center;" class="form-control bg-light"
									id="authName" onchange="selectAuth()">
									<option value='1'>
										사원
									</option>
									<option value='2'>
										관리자
									</option>
								</select>
								<input type="hidden" name="auth" readonly>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" id="delBtn" onclick="deleteEmp()">
						삭제</button>
					<button type="button" class="btn btn-secondary" onclick="clsBtnClick()">
						취소</button>
					<button type="button" class="btn btn-primary" id="udtBtn" onclick="udtDept()">
						정보수정</button>
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
		if(sesDeptno!=10&&sesAuth!=9){
			alert("부서변경 권한이 없습니다")
			location.href="/cookiemain"
		}
		getDeptAjax()
	})
	let sesEmpno = "${sessionScope.empno}"
	let sesDeptno = "${sessionScope.deptno}"
	let sesAuth = "${sessionScope.auth}"
	let insertNo = `${param.insertNo}`
	<% session.setMaxInactiveInterval(60 * 60); %>
	
            	
	let card1 = "<div class='card border-left-"
	let cardColor = ""
	let card2 = " shadow py-2 mb-2 animated--grow-in' ";
	let openModalF = "onclick='openModal("
	let card3 = ")'><div class='card-body'><div class='row no-gutters align-items-center'>";
	let card4 = "<div class='col-sm-7 font-weight-bold text-gray-800'>"
	let tieManIcon = "<i class='fas fa-user-tie'></i> ";
	let job = ""
	let card5 = "</div><div class='col-auto font-weight-bold text-gray-800'>"
	let card6 = "</div></div></div></div>"
	
	function showDeptByEmps(deptno){
		$.ajax({
			url : "ajaxgetCookieEmpsByDeptno",
			type : "post",
			data : "deptno="+deptno,
			success : function(emps) {
				if((deptno/10)%5==1){
            		cardColor = "primary"
				}else if((deptno/10)%5==2){
            		cardColor = "success"
				}else if((deptno/10)%5==3){
            		cardColor = "info"
				}else if((deptno/10)%5==4){
            		cardColor = "warning"
				}else if((deptno/10)%5==0){
            		cardColor = "danger"
				}
				let addHTML = "";
				$(emps).each(function(idx, emp){
					if (emp.auth == 1) {
						job = "사원"
					} else if (emp.auth == 2) {
						job = "관리자"
					} else {
						job = "시스템관리자"
					}
					addHTML += card1+cardColor+card2+openModalF+emp.empno+card3+card4+tieManIcon+
								emp.dname+"팀 "+emp.ename+" "+job+card5+
								"사원번호 "+emp.empno+card6
				})
				$("#deptByEmps").html(addHTML)
			},
			error : function(err) {
				console.log(err)
			}
		})
		$("#goTop").click()
	}
	function openModal(empno) {
		$.ajax({
			url : "ajaxsearchCEmp",
			type : "post",
			data : "empno="+empno,
			success : function(emp) {
				if (emp.auth == 1) {
					job = "사원"
				} else if (emp.auth == 2) {
					job = "관리자"
				} else {
					job = "시스템관리자"
				}
				$("#ename").val(emp.ename)
				$("[name=empno]").val(emp.empno)
				$("#dname").val(emp.deptno)
				$("#authName").val(emp.auth)
				$("[name=deptno]").val(emp.deptno)
				$("[name=auth]").val(emp.auth)
			},
			error : function(err) {
				console.log(err)
			}
		})
		$("#showModal").click()
	}
	function getDeptAjax() {
		$.ajax({
			url : "ajaxgetCookieDept",
			type : "post",
			dataType : "json",
			success : function(depts) {
				let addHTML = "";
				$(depts).each(
						function(idx, dept) {
							addHTML += "<option value='"+ dept.deptno
									+ "'>" + dept.dname + "</option>"
						})
				$("#dname").html(addHTML)
			},
			error : function(err) {
				console.log(err)
			}
		})
	}
	function selectDept() {
		$("[name=deptno]").val($("#dname").val())
	}
	function selectAuth() {
		$("[name=auth]").val($("#authName").val())
	}
	function clsBtnClick() {
		$("#clsBtn").click()
	}
	function udtDept(){
		let udtAjaxEmpno = $("[name=empno]").val()
		if(sesEmpno==udtAjaxEmpno){
			alert("본인의 정보는 수정할 수 없습니다")
		}else{
			$.ajax({
				url : "ajaxupdateDeptNAuth",
				type : "post",
				data : $("#cooEDForm").serialize(),
				success : function(msg) {
					alert(msg)
					if(msg.indexOf('정상적')>=0){
						location.reload();
					}
				},
				error : function(err) {
					console.log(err)
				}
			})
		}
	}
	function deleteEmp(){
		let delAjaxEmpno = $("[name=empno]").val()
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
						if(msg.indexOf('정상적')>=0){
							location.reload();
						}
					},
					error:function(err){
						console.log(err)
					}
				})
			}
		}
	}
	
</script>
    
</body>
</html>