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
            location.href='Prd_mng_prc01List?lang=${param.lang}'
        }
    }

    var prdcDateInput = document.getElementsByName("prdc_dateStr")[0];

    // 현재 입력된 prvprd_id_prc 값 가져오기
    var prvPrdIdPrc = document.getElementsByName("prvprd_id_prc")[0].value;
    console.log("prvprd_id_prc 값:", prvPrdIdPrc);

    // 서버에서 가져온 같은 prd_id_prc의 기존 날짜 (예제에서는 JSP 변수를 사용하여 전달)
    var existingPrdcDateStr = "${empty re.prv_prd_dateStr ? '' : re.prv_prd_dateStr}"; // 기존 저장된 날짜

    // 기존 날짜가 있을 경우 선택 가능한 최소 날짜 설정
    if (existingPrdcDateStr) {
        prdcDateInput.min = existingPrdcDateStr;
        console.log("기존 공정 날짜:", existingPrdcDateStr);
    }

    // 사용자가 기존 날짜보다 이전 날짜를 선택하지 못하도록 제한
    prdcDateInput.addEventListener("change", function() {
        if (existingPrdcDateStr && this.value < existingPrdcDateStr) {
            alert("해당 공정의 기존 날짜 이후만 선택 가능합니다.\n기존 날짜: " + existingPrdcDateStr);
            this.value = existingPrdcDateStr; // 최소 날짜로 강제 변경
        }
    });
});

function validateForm() {
    // Get the values from the input fields
    var prcId = document.getElementsByName("prc_id")[0].value;
    var prdYld = document.getElementsByName("prd_yld")[0].value.trim();
    var prdRwmtUsg = document.getElementsByName("prd_rwmt_usg")[0].value.trim();
    var prdcDateStr = document.getElementsByName("prdc_dateStr")[0].value;

    // 이전 공정 ID 및 저장된 날짜 가져오기
    var prvPrdIdPrc = document.getElementsByName("prvprd_id_prc")[0].value;
    var existingPrdcDateStr = "${empty re.prv_prd_dateStr ? '' : re.prv_prd_dateStr}";

    // 필수 입력 필드 검증
    if (prcId === "0") {
        alert("공정명을 선택하세요."); 
        return false;
    }
    if (prdYld === "") {
        alert("공정생산량을 입력하세요.");
        return false;
    }
    if (prdRwmtUsg === "") {
        alert("원재료 사용량을 입력하세요.");
        return false;
    }
    if (prdcDateStr === "") {
        alert("생산 날짜를 선택하세요.");
        return false;
    }

    // 이전 날짜 검증 (저장된 날짜보다 이전 날짜 선택 불가)
    if (existingPrdcDateStr && prdcDateStr < existingPrdcDateStr) {
        alert("해당 공정의 기존 날짜 이후만 선택 가능합니다.\n기존 날짜: " + existingPrdcDateStr);
        return false;
    }

    return true;
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
	<h2 class="text-center">공정별 생산 관리 등록</h2>
	<!--insertPrd_mng_prc01_02로 처리되는 것을 방지..-->
	<form method="post" action="insertPrd_mng_prc01" enctype="multipart/form-data" onsubmit="return validateForm()">
		<input type="hidden" name="prvprd_id_prc" value="${empty re.prvprd_id_prc?0:re.prvprd_id_prc}"/>
		<input type="hidden" name="prv_prd_yld" value="${empty re.prv_prd_yld?0:re.prv_prd_yld}"/>
		
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">공정명</span>
		</div>
		<select  name="prc_id" class="form-control" >
			<option value="0">선택하세요</option>
			<c:forEach var="p" items="${plist}">		
			<option value="${p.prc_id}">${p.prc_nm}(${p.prc_id})</option>
			</c:forEach>		
		</select>	
	</div>			
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">공정생산량</span>
		</div>
		<input name="prd_yld" type="text" class="form-control" />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">원재료 사용량</span>
		</div>
		<input  name="prd_rwmt_usg" type="text" class="form-control" />	
	</div>		
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">생산 날짜</span>
		</div>
		<input type="date" name="prdc_dateStr" class="form-control"  />	
	</div>	
	
	<div style="text-align:right;">
			<input type="submit" class="btn btn-success" 
				value="등록" id="insBtn"/>
			<input type="button" class="btn btn-info" 
				onclick="location.href='Prd_mng_prc01List?lang=${param.lang}'" 
				value="조회리스트" id="mainBtn"/>
	</div>	
	</form>	
	
</div>
		
						</div>
					</div>
				</div>
			</div>
</body>
</html>