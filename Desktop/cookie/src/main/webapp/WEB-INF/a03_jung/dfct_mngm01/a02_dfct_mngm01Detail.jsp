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
	var msg = "${msg}"
	if(msg!=""){
		alert(msg)
		if(msg.indexOf("삭제성공")>=0){
			location.href='Dfct_mngm01List?lang=${param.lang}'
		}
		if(msg.indexOf("캘린더 등록성공")>=0){
			location.href='Dfct_calendar'
		}
	}
	
	$(document).ready(function(){
		$("[name=dfc_prd_id]").val("${flist.dfc_prd_id}")
		$("#uptBtn").click(function(){
			if(confirm("수정하시겠습니까")){
				$("form").attr("action","updateDfct_mngm01");
				$("form").submit();
			}
		})
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까")){
				$("form").attr("action","deleteDfct_mngm01");
				$("form").submit();
			}
		})
			$("#insBtn").click(function(){
			if(confirm("캘린더에 불량결과를 등록하시겠습니까?")){
				$("form").attr("action","insertDfct_mngm01_2");
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
	<h2 class="text-center">불량관리 상세</h2>
	<form method="post">
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">불량관리 아이디</span>
		</div>
		<input name="dfct_id" class="form-control"  value="${flist.dfct_id}" readonly/>	
	</div>			
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">담당자명</span>
		</div>
		<input name="dfct_pic_nm" class="form-control"   value="${flist.dfct_pic_nm}"   />	
	</div>		
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">불량처리유형</span>
		</div>
		<input name="dfct_hndl_type" class="form-control"   value="${flist.dfct_hndl_type}"   />	
	</div>		
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">불량처리결과</span>
		</div>
		<input name="dfct_prcs_rslt" class="form-control"   value="${flist.dfct_prcs_rslt}"   />	
	</div>		
		
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">불량 처리 날짜</span>
		</div>
		<input name="dfct_dsps_dateStr" type="date" class="form-control" 
		  value="<fmt:formatDate 
			value='${flist.dfct_dsps_date}' pattern='yyyy-MM-dd'/>"   />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">공정번호</span>
		</div>
		<select  name="dfc_prd_id" class="form-control" >
			<option value="0">선택하세요</option>
			<c:forEach var="d" items="${dlist}">		
			<option value="${d.dfc_prd_id}">${d.prc_nm}(${d.dfc_prd_id})</option>
			</c:forEach>		
		</select>	
	</div>		
		
	<div style="text-align:right;">
			<input type="button" id="insBtn" class="btn btn-primary" value="캘린더 등록" />
			<input type="button" id="uptBtn" class="btn btn-primary" value="수정" />
			<input type="button" id="delBtn"  class="btn btn-warning" value="삭제" />
			<input type="button" class="btn btn-info" 
				onclick="location.href='Dfct_mngm01List?lang=${param.lang}'" 
				value="조회리스트" id="mainBtn"/>
	</div>	
	</form>	
</div>
</div>
					</div>
				</div>
			</div>
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
					</div>
				</div>
			</div>
</body>
</html>