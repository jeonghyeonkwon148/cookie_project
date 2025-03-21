<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    // 세션에서 사용자 권한 가져오기
    Integer userRole = (Integer) session.getAttribute("auth"); // 세션에서 권한 값 가져오기
    Integer deptRole = (Integer) session.getAttribute("deptno"); // 세션에서 권한 값 가져오기

 // 세션 값이 없을 경우 기본값 설정 (NullPointerException 방지)
    if (userRole == null) {
        userRole = 0;
    }

 // userRole이 9이면 deptRole 관계없이 접근 가능
    if (userRole != 9) { 
        // 권한이 2 이상(관리자)이 아니면서 deptRole이 40인 경우 접근 차단
        if (userRole < 2 && deptRole == 40) {
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
				location.href='Machine_managementList?lang=${param.lang}'
			}
		}
	});
	function validateForm() {
	    // Get values from input fields
	    var mchNm = document.getElementsByName("mch_nm")[0].value.trim();
	    var mchnDateStr = document.getElementsByName("mchn_dateStr")[0].value;
	    var mchnMntnStr = document.getElementsByName("mchn_mntnStr")[0].value;
	    var mchnUsgPrd = document.getElementsByName("mchn_usg_prd")[0].value.trim();
	    var mchnNmbMlf = document.getElementsByName("mchn_nmb_mlf")[0].value.trim();
	    var mchnCndt = document.getElementsByName("mchn_cndt")[0].value.trim();

	    // Check if any of the required fields are empty
	    if (mchNm === "" || mchnDateStr === "" || mchnMntnStr === "" || mchnUsgPrd === "" || mchnNmbMlf === "" || mchnCndt === "") {
	        alert("모든 필드를 입력하세요."); // Alert message for empty fields
	        return false; // Prevent form submission
	    }

	    // 날짜 비교 로직 추가
	    var mchnDate = new Date(mchnDateStr);  // 입고일
	    var mchnMntn = new Date(mchnMntnStr);  // 보수일

	    if (mchnMntn < mchnDate) {
	        alert("보수일은 입고일보다 이후여야 합니다."); // Alert message for invalid date selection
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
	<h2 class="text-center">기계 등록</h2>
    <form method="post" onsubmit="return validateForm()">
		
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">기계명</span>
		</div>
		<input name="mch_nm" class="form-control"  />	
	</div>		
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">기계입고일</span>
		</div>
		<input type="date" name="mchn_dateStr" type="text" class="form-control" />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">기계 최종 보수일</span>
		</div>
		<input type="date" name="mchn_mntnStr" class="form-control"  />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">기계 사용기간(달단위)</span>
		</div>
		<input  name="mchn_usg_prd" class="form-control"  />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">오작동 횟수</span>
		</div>
		<input name="mchn_nmb_mlf" class="form-control"  />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">기계상태</span>
		</div>
		<input name="mchn_cndt" class="form-control"  />	
	</div>	
	
	<div style="text-align:right;">
			<input type="submit" class="btn btn-success" 
				value="등록" id="insBtn"/>
			<input type="button" class="btn btn-info" 
				onclick="location.href='Machine_managementList?lang=${param.lang}'" 
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