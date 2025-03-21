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
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<!-- Custom fonts for this template-->
<link href="a00_com/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="a00_com/css/sb-admin-2.min.css" rel="stylesheet">
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var msg = "${msg}"
		if(msg!=""){
			if(confirm(msg+"\n메인화면 이동하시겠습니까?")){
				location.href='Work_orderList?lang=${param.lang}'
			}
		}
	});
	 function validateForm() {
	        // Get the values from the input fields
	        var orderNo = document.getElementsByName("order_no")[0].value;
	        var dayPro = document.getElementsByName("day_pro")[0].value.trim();
	        var finalSchdlStr = document.getElementsByName("final_schdlStr")[0].value;

	        // Check if required fields are filled
	        if (orderNo === "0") {
	            alert("제품명을 선택하세요."); // Alert if product name is not selected
	            return false; // Prevent form submission
	        }
	        if (dayPro === "") {
	            alert("일일생산량(목표)을 입력하세요."); // Alert if daily production target is empty
	            return false; // Prevent form submission
	        }
	        if (finalSchdlStr === "") {
	            alert("최종작업예정일을 선택하세요."); // Alert if final schedule date is empty
	            return false; // Prevent form submission
	        }

	        return true; // Allow form submission
	    }
</script>
</head>
<body>
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
	<h2 class="text-center">작업지시서 등록</h2>
	<form method="post" onsubmit="return validateForm()">
		
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">제품명</span>
		</div>
		<select  name="order_no" class="form-control" >
			<option value="0">선택하세요</option>
			<c:forEach var="o" items="${wolist}">		
			<option value="${o.order_no}">${o.pname}(납기일:${o.due_dte})-(주문수량:${o.order_cnt})(${o.order_no})</option>
			</c:forEach>		
		</select>	
	</div>				
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">일일생산량(목표)</span>
		</div>
		<input name="day_pro" type="text" class="form-control" />	
	</div>	
	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">최종작업예정일</span>
		</div>
		<input type="date" name="final_schdlStr" class="form-control"  />	
	</div>	
	
	<div style="text-align:right;">
			<input type="submit" class="btn btn-success" 
				value="등록" id="insBtn"/>
			<input type="button" class="btn btn-info" 
				onclick="location.href='Work_orderList?lang=${param.lang}'" 
				value="조회리스트" id="mainBtn"/>
	</div>	
	</form>	
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
</div>
</body>
</html>