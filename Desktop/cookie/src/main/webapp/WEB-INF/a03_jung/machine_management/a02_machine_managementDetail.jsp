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
	var msg = "${msg}"
	if(msg!=""){
		alert(msg)
		if(msg.indexOf("삭제성공")>=0){
			location.href='Machine_managementList?lang=${param.lang}'
		}
		
	}

	$(document).ready(function(){
		$("#uptBtn").click(function(){
			if(confirm("수정하시겠습니까")){
				$("form").attr("action","updateMachine_management");
				$("form").submit();
			}
		})
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까")){
				$("form").attr("action","deleteMachine_management");
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
	<%-- 
		
--%>


<div class="container">
	<h2 class="text-center">기계관리 상세</h2>
	<form method="post">
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">기계아이디</span>
		</div>
		<input name="mch_id" class="form-control"  value="${mlist.mch_id}" readonly/>	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">기계명</span>
		</div>
		<input name="mch_nm" class="form-control"   value="${mlist.mch_nm}"   />	
	</div>		
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">기계입고일</span>
		</div>
		<input name="mchn_dateStr" type="date" class="form-control" 
		  value="<fmt:formatDate 
			value='${mlist.mchn_date}' pattern='yyyy-MM-dd'/>"   />	
	</div>		
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">기계 최종 보수일</span>
		</div>
		<input name="mchn_mntnStr" type="date" class="form-control" 
		  value="<fmt:formatDate 
			value='${mlist.mchn_mntn}' pattern='yyyy-MM-dd'/>"   />	
		
	</div>		
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">기계 사용기간(달단위)</span>
		</div>
		
		<input name="mchn_usg_prd" class="form-control"  value="${mlist.mchn_usg_prd}" />	
	</div>			
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">오작동 횟수</span>
		</div>
		<input name="mchn_nmb_mlf" type="text" class="form-control"   value="${mlist.mchn_nmb_mlf}" />	
	</div>			
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">기계상태</span>
		</div>
		<input name="mchn_cndt" type="text" class="form-control"   value="${mlist.mchn_cndt}" />	
	</div>			
	<div style="text-align:right;">
			<input type="button" id="uptBtn" class="btn btn-primary" value="수정" />
			<input type="button" id="delBtn"  class="btn btn-warning" value="삭제" />
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