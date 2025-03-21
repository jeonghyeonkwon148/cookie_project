<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<!-- Custom fonts for this template-->
<link href="a00_com/vendor/fontawesome-free/css/all.min.css"
   rel="stylesheet" type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">

<!-- Custom styles for this template-->
<link href="a00_com/css/sb-admin-2.min.css" rel="stylesheet">

<style type="text/css">
	.input-group-text{width:100%;background-color:linen;
		color:black;font-weight:bolder;}
	.input-group-prepend{width:20%;}
	#chatArea{
		width:80%;height:200px;overflow-y:auto;text-align:left;
		border:1px solid green;
	}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#regBtn").click(function(){
			if(confirm("등록하시겠습니까?")){
				if($("[name=subject]").val()==""){
					alert("제목은 반드시 입력하여야 합니다.")
					return;
				}
				if($("[name=writer]").val()==""){
					alert("작성자는 반드시 입력하여야 합니다.")
					return;
				}				
				
				$("form").submit()
			}
		})
		$("#mainBtn").click(function(){
			location.href="yoon_boardList"
		})
		var msg = "${msg}"
		if(msg!="")
			alert(msg)
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
   <h2 class="text-center">게시글 등록</h2>

	<!--boardReply로 처리되는 것을 방지..-->
	<form method="post" action="yoon_boardInsert" enctype="multipart/form-data">
		    
		<input type="hidden" name="refno" value="${empty re.refno?0:re.refno}"/>
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">제목</span>
		</div>
		<input name="subject" class="form-control" value="${re.subject}" required/>
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">작성자</span>
		</div>
		<input name="writer" class="form-control" value=""  required/>
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">내용</span>
		</div>
		<textarea name="content" class="form-control"  rows="10" cols="20" required>${re.content}</textarea>
	</div>		
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">첨부파일</span>
		</div>
		<input type="file" multiple="multiple" name="reports" class="form-control" value="" />
	</div>		
	<div style="text-align:right;">
			<input type="button" class="btn btn-success" value="등록" id="regBtn"/>
			<input type="button" class="btn btn-info"
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