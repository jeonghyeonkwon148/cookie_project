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

<title>Cookie Department</title>

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
		                    <h1 class="h3 mb-2 text-gray-800">부서목록</h1>
							<p class="mb-4">소개합니다</p>
						</div>
						<button type="button" class="btn btn-primary"
							id="insModalOpenBtn" onclick="insertDept()">
							부서등록</button>
					</div>
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
	                    	ondblclick="showDeptDetail('${dept.dname}','${dept.deptno}')">
	                        <div class="card-body">
	                            <div class="row no-gutters align-items-center">
	                                <div class="col-sm-5">
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
    <a class="scroll-to-top rounded" href="#page-top">
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
					<h5 class="modal-title" id="modalTitle">부서 정보</h5>
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
									class="form-control form-control-user" value="부서이름" readonly>
							</div>
							<div class="col-sm-9">
								<input style="text-align: center;" type="text"
									class="form-control form-control-user" name="dname" readonly>
							</div>
						</div>
						<div class="form-group row" id="uDeptno">
							<div class="col-sm-3 mb-5 mb-sm-0">
								<input style="text-align: center;" type="text"
									class="form-control form-control-user" value="부서번호" readonly>
							</div>
							<div class="col-sm-9">
								<input style="text-align: center;" type="text" pattern="[1-9][0-9]" maxlength="2"
									class="form-control form-control-user" name="deptno" readonly>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer" id="deptFixBtns">
						<button type="button" class="btn btn-primary" id="insBtn" onclick="insDept()">
							부서등록</button>
						<button type="button" class="btn btn-primary" id="insEmpBtn" onclick="goInsEmp()">
							사원등록</button>
						<button type="button" class="btn btn-warning" id="udtAskBtn" onclick="openUdtModal()">
							정보수정</button>
						<button type="button" class="btn btn-danger" id="delAskBtn" onclick="openDelModal()">
							삭제</button>
				</div>
			</div>
		</div>
	</div>
	
	
    
    <!-- 수정/삭제 처리 여부 질문 modal -->
    <div id="showAskModal" data-toggle="modal"
		data-target="#askAgainModal"></div>
    <div class="modal fade" id="askAgainModal" tabindex="-1" role="dialog" aria-labelledby="askAgainModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="askAgainModalLabel"></h5>
                    <button class="close" type="button" data-dismiss="modal" id="clsAMBtn" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" id="askAgainModalBody"></div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
					<button type="button" class="btn btn-warning" id="udtBtn" onclick="udtDept()">
						정보수정</button>
					<button type="button" class="btn btn-danger" id="delBtn" onclick="delDept()">
						삭제</button>
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
		if(sesDeptno==10||sesAuth>2){
			$("#deptFixBtns").show()
			$("#insModalOpenBtn").show()
			$("[name=dname]").attr("readonly",false)
			if(insertNo==5){
				$("#insModalOpenBtn").click()
			}
		}else{
			$("#deptFixBtns").hide()
			$("#insModalOpenBtn").hide()
			$("[name=dname]").attr("readonly",true)
			if(sesAuth==2&&insertNo==5){
				alert("사원등록 권한이 없습니다")
			}
		}
		
	})
	let sesEmpno = "${sessionScope.empno}"
	let sesDeptno = "${sessionScope.deptno}"
	let sesAuth = "${sessionScope.auth}"
	let insertNo = `${param.insertNo}`
	<% session.setMaxInactiveInterval(60 * 60); %>
	
	function insDept(){
		let insAjaxDname = $("[name=dname]").val()
		let insAjaxDnum = $("[name=deptno]").val()
		let dnIsNum = /^\d+$/;
		if(dnIsNum.test(insAjaxDnum)){
			if(insAjaxDname!=""){
				$.ajax({
					url : "ajaxinsertCookieDept",
					type : "post",
					data : $("#cooEDForm").serialize(),
					success : function(msg) {
						alert(msg)
						if(msg.indexOf("정상적")>0){
							location.href="/yoocookiedeptList";
						}
					},
					error : function(err) {
						console.log(err)
					}
				})
			}else{
				alert("부서이름을 입력하세요")
			}
		}else{
			alert("부서번호는 두자리 숫자만 가능합니다")
		}
	}
	function udtDept(){
		$.ajax({
			url : "ajaxupdateCookieDept",
			type : "post",
			data : $("#cooEDForm").serialize(),
			success : function(msg) {
				alert(msg)
				if(msg.indexOf("정상적")>0){
					location.href="/yoocookiedeptList";
				}else{
					$("#clsAMBtn").click()
				}
			},
			error : function(err) {
				console.log(err)
			}
		})
	}
	function delDept(){
		$.ajax({
			url : "ajaxdeleteCookieDept",
			type : "post",
			data : $("#cooEDForm").serialize(),
			success : function(msg) {
				alert(msg)
				if(msg.indexOf("정상적")>0){
					location.href="/yoocookiedeptList";
				}else{
					$("#clsAMBtn").click()
				}
			},
			error : function(err) {
				console.log(err)
			}
		})
	}
	function showDeptDetail(dname,deptno) {
		$("[name=deptno]").attr("readonly",true)
		$("[name=dname]").val(dname)
		$("[name=deptno]").val(deptno)
		$("#insBtn").hide()
		$("#udtAskBtn").show()
		$("#delAskBtn").show()
		$("#insEmpBtn").show()
		$("#showModal").click()
	}
	function insertDept() {
		$("[name=deptno]").attr("readonly",false)
		$("[name=dname]").val("")
		$("[name=deptno]").val("")
		$("#insBtn").show()
		$("#udtAskBtn").hide()
		$("#delAskBtn").hide()
		$("#insEmpBtn").hide()
		$("#showModal").click()
	}
	function openUdtModal() {
		$("#askAgainModalLabel").text("부서정보를 수정하시겠습니까?")
		$("#askAgainModalBody").text("부서정보가 수정됩니다")
		$("#udtBtn").show()
		$("#delBtn").hide()
		$("#showAskModal").click()
	}
	function openDelModal(){
		$("#askAgainModalLabel").text("부서정보를 삭제하시겠습니까?")
		$("#askAgainModalBody").text("부서정보가 삭제됩니다")
		$("#udtBtn").hide()
		$("#delBtn").show()
		$("#showAskModal").click()
	}
	function goInsEmp(){
		let goDeptno = $("[name=deptno]").val()
		location.href="/cookieempListInsert?insertNo=6&goDeptno="+goDeptno
	}
	
</script>
    
</body>
</html>