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
<!-- Custom fonts for this template-->
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
	.hidden {
    display: none;
	}
	
        .comment-box { max-width: 500px; padding: 16px; border: 1px solid #ddd; border-radius: 10px; background: white; }
        .re-box { max-width: 500px; padding: 16px; border: 1px solid #ddd; border-radius: 10px; background: white; }
        .profile { width: 40px; height: 40px; background: #ddd; border-radius: 50%; display: inline-block; }
        .comment-content { margin-left: 10px; }
        .reply-button { color: blue; cursor: pointer; font-size: 14px; margin-top: 5px; }
        .reply-form { margin-top: 10px; padding: 10px; background: #f9f9f9; border-radius: 5px; display: none; border: 1px solid #ddd; }
        .reply-input { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 5px; }
        .reply-actions { display: flex; justify-content: space-between; align-items: center; margin-top: 10px; }
        .reply-icons { display: flex; gap: 10px; }
        .reply-icons button { background: none; border: none; cursor: pointer; font-size: 18px; }
</style>
<!-- Bootstrap core JavaScript-->
   <script src="a00_com/vendor/jquery/jquery.min.js"></script>
   <script src="a00_com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

   <!-- Core plugin JavaScript-->
   <script src="a00_com/vendor/jquery-easing/jquery.easing.min.js"></script>

   <!-- Custom scripts for all pages-->
   <script src="a00_com/js/sb-admin-2.min.js"></script>
   
<script type="text/javascript">
	$(document).ready(function(){

		let sesJoEname = "${sessionScope.ename}"
			$(".ename").text(sesJoEname)
			
		let sesJoDeptno = "${sessionScope.deptno}"
			$(".deptno").text(sesJoDeptno)
			
		let sesJoAuth = "${sessionScope.auth}"
		let authText = "";
			if( sesJoAuth === "1"){
				authText = "사원";
			} else if (sesJoAuth === "2"){
				authText = "관리자";
			}
    // 모든 reauth 클래스를 가진 요소 업데이트
    $(".reauth").each(function() {
        let authValue = $(this).text();
        if (authValue === "1") {
            $(this).text("사원");
        } else if (authValue === "2") {
            $(this).text("관리자");
        } else {
            $(this).text(authText);
        }
        
    	}) 
		// 게시글 등록
		$("#regBtn").click(function(){
			if(confirm("등록하시겠습니까?")){
				$("#mainFrm").submit()
			}
		})
		$("#mainBtn").click(function(){
			location.href="joboardList"
		})
		var msg = "${msg}"
		if(msg!=""){
			alert(msg)
			// indexOf("검색문자") : 해당 문자열의 포함된 위치를 index번호로 리턴한다.
			// 삭제라는 글자가 있으면 검색으로 바로 이동하게 처리한다.
			if(msg.indexOf("삭제")>=0){
				location.href="joboardList"
					if(msg.indexOf("댓글")>=0){
						location.href="joboardDetail?no=${param.board_no}"	
					}	
			}

			if(msg.indexOf("수정")>=0){
				location.href="joboardList"
					if(msg.indexOf("댓글")>=0){
						location.href="joboardDetail?no=${param.board_no}"	
					}			
			}

		}
		
		$("#uptBtn").click(function(){
			if(confirm("수정하시겠습니까?")){
				$("#mainFrm").attr("action","joboardUpdate")
				$("#mainFrm").submit();
			}
		})
		
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				$("#mainFrm").attr("action","joboardDelete")
				$("#mainFrm").submit();
			}
		})	
		
		// 게시글 답글 수정
		$("#UpReBtn").click(function(){
			if(confirm("댓글을 수정 하시겠습니까?")){
				$("#ReFrm2").attr("action","joReplyUpdate")
				$("#ReFrm2").submit()
				
			}
		})		
		// 게시글 답글 삭제
		$("#DeReBtn").click(function(){
			if(confirm("댓글을 삭제 하시겠습니까?")){
				$("#ReFrm2").attr("action","joReplyDelete")
				$("#ReFrm2").submit()
			}
		})
		// 게시글 답글 등록
		$("#repBtn").click(function(){
			if(confirm("댓글을 등록 하시겠습니까?")){
				$("#ReFrm1").attr("action","joboardReInsert")
				$("#ReFrm1").submit()
			}
		})
		
	});

    // 처음 댓글 작성 폼 토글
    function toggleNewCommentForm() {
        let form = document.getElementById("newCommentForm");

        if (form.style.display === "none" || form.style.display === "") {
            form.style.display = "block";
        } else {
            form.style.display = "none";
        }
    }

    // 대댓글 폼 토글
    function toggleReplyForm(button) {
        let commentBox = button.closest('.comment-box'); 
        let replyForm = commentBox.querySelector('.reply-form'); 

        if (replyForm.style.display === "none" || replyForm.style.display === "") {
            replyForm.style.display = "block";
        } else {
            replyForm.style.display = "none";
        }
    }    

	function download(fname){
		if(confirm(fname+" 파일을 다운로드 하시겠습니까?"))
			location.href="/download?filename="+fname
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
				<jsp:include page="/header" />
				<!-- End of Topbar -->
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">게시판 상세</h1>
					<p class="mb-4">Detail</p>
</div>
<!-- 게시글 상세 정보 -->
<div class="container">
	<form id="mainFrm" method="post" enctype="multipart/form-data">
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
		<input name="subject" class="form-control" value="${board.subject}"  />
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">카테고리</span>
		</div>
		<input name="category" class="form-control" value="${board.category}"/>
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">작성자</span>
		</div>
		<input name="writer" class="form-control" value="${board.writer}" readonly />
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">조회수</span>
		</div>
		<input  class="form-control" value="${board.readcnt}" readonly />		
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">등록일</span>
		</div>
		<input class="form-control" value="<fmt:formatDate value='${board.regdte}' pattern="yyyy-MM-dd HH:mm:ss"/>" readonly/>
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">수정일</span>
		</div>
		<input class="form-control" value="<fmt:formatDate value='${board.uptdte}' pattern="yyyy-MM-dd HH:mm:ss"/>" />		
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
			<span ondblclick="download('${fname}')">${fname}</span>,&nbsp;&nbsp;&nbsp;
		</c:forEach>
	</div>		
	<div style="text-align:right;">
		<input type="button" class="btn btn-primary" value="수정" id="uptBtn"/>
		<input type="button" class="btn btn-success" value="댓글쓰기" id="showCommentFormBtn" onclick="toggleNewCommentForm()"/>
		<input type="button" class="btn btn-danger" value="삭제" id="delBtn"/>
		<input type="button" class="btn btn-info" onclick="location.href='joboardList'" 
				value="조회리스트" id="mainBtn"/>
	</div>	
	</form>	
	<h1 class="h3 mb-2 text-gray-800">댓글</h1>
    <div class="comment-box" >
        <!-- 📝 처음 댓글 작성 폼 -->
        <div class="reply-form" id="newCommentForm" style="display: none;">
        
            <form action="joboardReInsert" method="post" id="ReFrm1">
            	
            	<input type="hidden" name="board_no" value="${board.no}">
				<input type="hidden" name="writer" value="${sessionScope.ename}">
				<strong class="ename" ></strong>
				<strong class="reauth"></strong>
				<input type="hidden" name="auth" value="${sessionScope.auth}">
                <textarea name="content" class="reply-input" placeholder="댓글을 입력하세요.">${content}</textarea>
                <div class="reply-actions">
                    <div class="reply-icons">
                        <button type="button" title="사진 추가">📷</button>
                        <button type="button" title="이모지">😊</button>
                    </div>
                    <div>
                        <button type="button" class="reply-cancel" onclick="toggleNewCommentForm()">취소</button>
                        <button type="submit" class="reply-submit" id="repBtn">댓글 작성</button>
                    </div>
                </div>
            </form>
        </div>
		</div>
        <!-- 📄 기존 댓글 목록 -->
        <c:forEach var="re" items="${replyList}" >
        <form id="ReFrm2" method="post" >
        	<input type="hidden" name="no" value="${re.no}">
            <div class="comment-box">
                <div>
                    <strong class="writer" >${re.writer}</strong> 
							<span class="reauth" >${re.auth}</span>
                    <input type="hidden" name="auth" value="${re.auth}">
                    <input type="hidden" name="writer" value="${re.writer}">
                    <p>${re.content}</p>
                    <span style="font-size: 12px; color: gray;">
                        <fmt:formatDate value="${re.regdte}" pattern="yyyy-MM-dd HH:mm:ss" />
                    </span>
                    <input type="hidden" name="board_no" value="${re.board_no}">
                    <div class="reply-button" onclick="toggleReplyForm(this)">수정/삭제</div>

                </div>

                <!-- 대댓글 작성 폼 -->
                <div class="reply-form" >          
				<strong name="writer" >${re.writer}</strong>
				<strong name="auth" class="reauth">${re.auth}</strong>
				     
                    <textarea class="reply-input" name="content" placeholder="수정하세요."></textarea>
                    <div class="reply-actions">
                        <div class="reply-icons">
                            <button type="button" title="사진 추가">📷</button>
                            <button type="button" title="이모지">😊</button>
                        </div>
                        <div>
                            <button type="button" class="reply-cancel" onclick="toggleReplyForm(this)">취소</button>
                            <input type="button" class="reply-cancel" value="수정" id="UpReBtn"/>
                            <input type="button" class="reply-cancel" value="삭제" id="DeReBtn"/>
                        </div>
                    </div>
                </div>
            </div>
            </form>
        </c:forEach>
    </div>
    <!-- End of Main Content -->

				<!-- Footer -->
				<div id="footerBox">
					<jsp:include page="/yoofooterCookie" />
				</div>
				<!-- End of Footer -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

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

		<!-- Bootstrap core JavaScript-->
		<script src="a00_com/vendor/jquery/jquery.min.js"></script>
		<script src="a00_com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script src="a00_com/vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="a00_com/js/sb-admin-2.min.js"></script>

		<!-- Page level plugins -->
		<script src="a00_com/vendor/datatables/jquery.dataTables.min.js"></script>
		<script src="a00_com/vendor/datatables/dataTables.bootstrap4.min.js"></script>

		<!-- Page level custom scripts -->
		<script src="a00_com/js/demo/datatables-demo.js"></script>
</body>
</html>