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
				$("form").submit()
			}
		})
		$("#mainBtn").click(function(){
			location.href="yoon_boardList"
		})
		var msg = "${msg}"
		if(msg!=""){
			alert(msg)
			// indexOf("검색문자") : 해당 문자열의 포함된 위치를 index번호로 리턴한다.
			// 삭제라는 글자가 있으면 검색으로 바로 이동하게 처리한다.
			if(msg.indexOf("삭제")>=0){
				location.href="yoon_boardList"
			}
		}
			
		$("#uptBtn").click(function(){
			if(confirm("수정하시겠습니까?")){
				$("form").attr("action","yoon_boardUpdate")
				$("form").submit();
			}
		})
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				$("form").attr("action","yoon_boardDelete")
				$("form").submit();
			}
		})
	
	});
	function yoon_download(fname){
		if(confirm(fname+" 파일을 다운로드 하시겠습니까?"))
			location.href="/yoon_download?filename="+fname
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
   <h2 class="text-center">게시글 상세</h2>

	<form method="post" enctype="multipart/form-data">
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">번호</span>
		</div>
		<input name="no" class="form-control" value="${board.no}" readonly />
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">상위번호</span>
		</div>
		<input name="refno" class="form-control" value="${board.refno}" readonly />
	</div>			
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">제목</span>
		</div>
		<input name="subject" class="form-control" value="${board.subject}" />
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">작성자</span>
		</div>
		<input name="writer" class="form-control" value="${board.writer}" />
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">조회수</span>
		</div>
		<input  class="form-control" value="${board.readcnt}" />		
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">등록일</span>
		</div>
		<input class="form-control" value="<fmt:formatDate value='${board.regdte}'/>" />
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">수정일</span>
		</div>
		<input class="form-control" value="<fmt:formatDate value='${board.uptdte}'/>" />		
	</div>		
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">내용</span>
		</div>
		<textarea name="content" class="form-control"  rows="10" cols="20">${board.content}</textarea>
	</div>		
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">첨부파일</span>
		</div>
		<c:forEach var="fname" items="${board.flist}">
			<span ondblclick="yoon_download('${fname}')">${fname}</span>,&nbsp;&nbsp;&nbsp;
		</c:forEach>
	</div>		
	<div style="text-align:right;">
		<input type="button" class="btn btn-warning" value="답글" id="repBtn"/>
		<input type="button" class="btn btn-primary" value="수정" id="uptBtn"/>
		<input type="button" class="btn btn-danger" value="삭제" id="delBtn"/>
		<input type="button" class="btn btn-info" onclick="location.href='yoon_boardList'" 
				value="조회리스트" id="mainBtn"/>
	</div>	
	</form>		
	<script>
	$("#repBtn").click(function(){
		if(confirm("답글을 처리하시겠습니까?")){
			/*
			var refno = $("[name=no]").val()
			var subject = $("[name=subject]").val()
			var content = $("[name=content]").val()
			$("[name=refno]").val(refno)
			$("[name=subject]").val("RE:"+subject)
			$("[name=content]").val("\n\n\n\n\n==== 이전글 ===\n"+content)
			*/
			$("form").attr("action","yoon_boardReply")
			$("form").submit()
			
		}
	})
	</script>
	
    
</div>
</div>
         </div>
      </div>
   </div>

</body>
</html>