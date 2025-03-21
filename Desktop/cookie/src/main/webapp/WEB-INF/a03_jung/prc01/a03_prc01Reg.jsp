<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    // 세션에서 사용자 권한 및 부서 번호 가져오기 (null이면 기본값 0)
    Integer userRole = (session.getAttribute("auth") != null) ? (Integer) session.getAttribute("auth") : 0;
    Integer deptRole = (session.getAttribute("deptno") != null) ? (Integer) session.getAttribute("deptno") : 0;

    // userRole이 9이면 deptRole 관계없이 접근 가능
    if (userRole != 9) { 
        // 권한이 2 이상(관리자)이 아니거나 deptRole이 40이 아닌 경우 접근 차단
        if (userRole < 2 || deptRole != 40) { 
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/a02_yoo/cookiemain.jsp");
            dispatcher.forward(request, response);
            return; // 이후 코드 실행 방지
        }
    }

    // 이후 접근 허용 코드 실행
%>
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
		var msg = "${msg}"
		if(msg!=""){
			if(confirm(msg+"\n메인화면 이동하시겠습니까?")){
				location.href='Prc01List?lang=${param.lang}'
			}
		}
	});
	 function validateForm() {
         // Get the values from the input fields         
         var mchId = document.getElementsByName("mch_id")[0].value;
         var mnum = document.getElementsByName("mnum")[0].value;
         var prcNm = document.getElementsByName("prc_nm")[0].value.trim();
         var prcDtl = document.getElementsByName("prc_dtl")[0].value.trim();
         var prcBslnQntt = document.getElementsByName("prc_bsln_qntt")[0].value.trim();
         var prcStndQntt = document.getElementsByName("prc_stnd_qntt")[0].value.trim();
         var ptime = document.getElementsByName("ptime")[0].value.trim();

         // Check if required fields are filled         
         if (mchId === "0") {
             alert("기계명을 선택하세요."); // Alert if machine name is not selected
             return false; // Prevent form submission
         }
         if (mnum === "0") {
             alert("재료명을 선택하세요."); // Alert if material name is not selected
             return false; // Prevent form submission
         }
         if (prcNm === "") {
             alert("공정명을 입력하세요."); // Alert if process name is empty
             return false; // Prevent form submission
         }
         if (prcDtl === "") {
             alert("공정내용을 입력하세요."); // Alert if process detail is empty
             return false; // Prevent form submission
         }
         if (prcBslnQntt === "") {
             alert("기준 생산량을 입력하세요."); // Alert if baseline quantity is empty
             return false; // Prevent form submission
         }
         if (prcStndQntt === "") {
             alert("기준원재료량을 입력하세요."); // Alert if standard material quantity is empty
             return false; // Prevent form submission
         }
         if (ptime === "") {
             alert("공정 시간을 입력하세요."); // Alert if processing time is empty
             return false; // Prevent form submission
         }

         return true; // Allow form submission
     }
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
	<%-- 
		
--%>


<div class="container">
	<h2 class="text-center">생산공정 등록</h2>
	<form method="post" onsubmit="return validateForm()">	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">기계명</span>
		</div>
		<select  name="mch_id" class="form-control" >
			<option value="0">선택하세요</option>
			<c:forEach var="mc" items="${mclist}">		
			<option value="${mc.mch_id}">${mc.mch_nm}(${mc.mch_id})</option>
			</c:forEach>		
		</select>	
	</div>		
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">재료명</span>
		</div>
		<select  name="mnum" class="form-control" >
			<option value="0">선택하세요</option>
			<c:forEach var="m" items="${mlist}">		
			<option value="${m.mnum}">${m.mname}(${m.mnum})</option>
			</c:forEach>		
		</select>	
	</div>		
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">공정명</span>
		</div>
		<input name="prc_nm" type="text" class="form-control" />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">공정내용</span>
		</div>
		<input  name="prc_dtl" type="text" class="form-control" />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">기준 생산량</span>
		</div>
		<input  name="prc_bsln_qntt" type="text" class="form-control" />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">기준원재료량</span>
		</div>
		<input  name="prc_stnd_qntt" type="text" class="form-control" />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">공정 시간</span>
		</div>
		<input  name="ptime" type="text" class="form-control" />	
	</div>	

	
	<div style="text-align:right;">
			<input type="submit" class="btn btn-success" 
				value="등록" id="insBtn"/>
			<input type="button" class="btn btn-info" 
				onclick="location.href='Prc01List?lang=${param.lang}'" 
				value="조회리스트" id="mainBtn"/>
	</div>	
	</form>	
	
</div>
</div><!-- Scroll to Top Button-->
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
				</div>
			</div>
</body>
</html>