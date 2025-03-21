<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="userRole" value="${sessionScope.auth != null ? sessionScope.auth : 0}" />
<c:set var="deptRole" value="${sessionScope.deptno != null ? sessionScope.deptno : 0}" />
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<!-- Custom fonts for this template-->
<link href="a00_com/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="a00_com/css/sb-admin-2.min.css" rel="stylesheet">
<style>
	td{text-align:center;}
	
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>


<script type="text/javascript">
	
	
	$(document).ready(function(){
		
		
		
		$("#pageSize").val("${sch.pageSize}")	
		$("#schBtn").click(function(){
			$("[name=curPage]").val(1)
			$("form").submit();			
		})
		
	});
	function goPage(pcnt){
		$("[name=curPage]").val(pcnt) // 클릭한 번호를 현재 페이지로 설정하고..
		$("form").submit()  // 요청값으로 전송 처리..
	}
  	function uptPageSize(){
		$("[name=pageSize]").val($("#pageSize").val())
		$("[name=curPage]").val(1)
		$("form").submit();
  	}
  	function checkPermissionAndRegister() {
  		var userRole = ${userRole}; // JSP에서 사용자 권한을 가져옵니다.
		var deptRole = ${deptRole}; // JSP에서 사용자 권한을 가져옵니다.
		 if (userRole == 9) { 
	  	        // userRole이 9이면 deptRole 관계없이 접근 가능
	  	        location.href = 'insertPrc01?lang=${param.lang}';
	  	    } else
		if (userRole < 2) { // 관리자 권한이 아닐 경우
			alert("권한이 없습니다. 등록할 수 없습니다.");
			return false; // 클릭 이벤트 방지
		}
		else if (deptRole != 40) { // 관리자 권한이 아닐 경우
			alert("권한이 없습니다. 등록할 수 없습니다.");
			return false; // 클릭 이벤트 방지
		}
		else {
			location.href = 'insertPrc01?lang=${param.lang}'; // 권한이 있을 경우 등록 페이지로 이동
		}
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
	<h2 class="text-center">공정관리</h2>
	<form id="frm01" class="form"  method="post">
		<input type="hidden" name="curPage" value="${sch.curPage}"/>
		<input type="hidden" name="pageSize" value="${sch.pageSize}"/>
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input placeholder="공정명" name="prc_nm" value="${param.prc_nm}" class="form-control mr-sm-2" />    
	    <button class="btn btn-info" type="submit">Search</button>
	     <button class="btn btn-success" onclick="checkPermissionAndRegister()" type="button">등록</button>
 	</nav>
	</form>
	<div class="container-fluid">
			<div class="row">
				<div class="col-sm-1" style="padding-left: 0;">

					<select class="form-control" id="pageSize" onchange="uptPageSize()"
						style="padding-right: 0;">
						<option value="3">[ 3 ]</option>
						<option value="5">[ 5 ]</option>
						<option value="10">[ 10 ]</option>
						<option value="20">[ 20 ]</option>
						<option value="50">[ 50 ]</option>
					</select>
				</div>
				<div class="col-sm-11"></div>
			</div>
		</div>
<table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="10%">
   	<col width="30%">
   	<col width="10%">
   	<col width="10%">
   	<col width="10%">
   	<col width="10%">
   	<col width="10%">


   

    <thead>
    
      <tr class="table-success text-center">
     	<th>공정아이디</th>
     	<th>공정명</th>
     	<th>공정내용</th>
     	<th>기준 생산량</th>
     	<th>기준원재료량</th>
     	<th>기계명</th>
     	<th>원재료명</th>
     	<th>공정 시간</th>
   <!--
	private int prc_id; //공정아이디
	private String prc_nm;//공정명
	private String prc_dtl;// 공정내용
	private int prc_bsln_qntt;// 기준 생산량
	private int mch_id;// 기계아이디
	private int prc_stnd_qntt;// 기준원재료량
	private int mnum;// 원재료 코드
	private int ptime; // 공정 시간
	private String mch_nm; // 기계명
	private String mname; //원재료명
   -->
      </tr>
    </thead>	
    <tbody>
    	<c:forEach var="pt" items="${plist}">
    	<tr ondblclick="goDetail('${pt.prc_id}')">
    	<td>${pt.prc_id}</td>
    	<td>${pt.prc_nm}</td>
    	<td>${pt.prc_dtl}</td>
    	<td>${pt.prc_bsln_qntt}</td>
    	<td>${pt.prc_stnd_qntt}</td>
    	<td>${pt.mch_nm}</td>
    	<td>${pt.mname}</td>
    	<td>${pt.ptime}</td>
    	</tr>
    	</c:forEach>
    </tbody>
	</table>
	
	<div class="container-fluid">
  <div class="row">
    <div class="col-sm-3" style="padding-left: 0;">
      <button type="button" class="btn btn-primary">
		  총 <span class="badge badge-light">${sch.count}</span> 건
	   </button>
    </div>
    <div class="col-sm-9" >
		<ul class="pagination justify-content-end" >
		  <li class="page-item"><a class="page-link" href="javascript:goPage(${sch.startBlock-1})">Previous</a></li>	  
		 
		  <c:forEach var="pcnt" begin="${sch.startBlock}" end="${sch.endBlock}">
		  	<li class="page-item ${sch.curPage==pcnt?'active':''}">
		  		<a class="page-link" href="javascript:goPage(${pcnt})">${pcnt}</a></li>
		  </c:forEach>
		  <!-- 
		  	클릭한 현재페이지 번호와 페이지번호가 같을 때, 배경색상이 있게(active) 처리함..
		   -->
		  <li class="page-item"><a class="page-link" href="javascript:goPage(${sch.endBlock+1})">Next</a></li>
		</ul>    
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
	
				<script type="text/javascript">
		function goDetail(prc_id){
			var userRole = ${userRole}; // JSP에서 사용자 권한을 가져옵니다.
			var deptRole = ${deptRole}; // JSP에서 사용자 권한을 가져옵니다.
			 if (userRole == 9) { 
		  	        // userRole이 9이면 deptRole 관계없이 접근 가능
		  	        location.href = "Prc01Detail?prc_id="+prc_id+"&lang=${param.lang}";
		  	    } else
			if (userRole < 2) { // 관리자 권한이 아닐 경우
				alert("권한이 없습니다. 등록할 수 없습니다.");
				return false; // 클릭 이벤트 방지
			}
			else if (deptRole != 40) { // 관리자 권한이 아닐 경우
				alert("권한이 없습니다. 등록할 수 없습니다.");
				return false; // 클릭 이벤트 방지
			}
			else {
			location.href="Prc01Detail?prc_id="+prc_id+"&lang=${param.lang}"
		}
		}
		</script>
		</div>
	</div>
</div>
</div>
</div>
</body>

</body>
</html>