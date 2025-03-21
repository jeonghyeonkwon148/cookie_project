<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Cookie Message</title>

<!-- Custom fonts for this template-->
<link href="a00_com/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="a00_com/css/sb-admin-2.min.css" rel="stylesheet">

<style type="text/css">
tbody tr:hover {
	background-color: rgb(245, 245, 245);
}
tbody tr:active {
	background-color: rgb(235, 235, 235);
} 
th,td {
	text-align: center;
}
.textareaDiv {
	justify-content: center;
	align-content: center;
	line-height: 1.5;
	text-align: left;
	outline: none;
	overflow-wrap: break-word;
	white-space: pre-wrap;
	height: 250px;
	background-color: rgb(245, 245, 245);
	font-weight: bold;
}
</style>

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
					<h1 class="h3 mb-2 text-gray-800">메세지 목록</h1>
					<p class="mb-4">메세지를 확인하세요</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary" id="cardTitle">모든 메세지들</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<form class="form-inline" id="eSFrm">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="사원 이름을 검색하세요" id="searchEname">
									</div>

									<input type="hidden" id="curPage"/>
									<input type="hidden" id="pageSize"/>

									<div class="input-group">
										<select class="form-control bg-light border-0 small"
											id="searchSR" onchange="uptPageSize()">
											<option value='1'>전체메세지</option>
											<option value='2'>보낸메세지</option>
											<option value='3'>받은메세지</option>
										</select>
									</div>
									<div class="input-group">
										<select class="form-control bg-light border-0 small"
											id="pageSizeSel" onchange="uptPageSize()">
											<option>5</option>
											<option>10</option>
											<option>20</option>
											<option>50</option>
										</select>
										<div class="input-group-append">
											<button class="btn btn-primary" type="button" id="msgSchBtn">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>

								<table class="table table-bordered" width="100%" 
									cellspacing="0">
									<col width="8%">
									<col width="12%">
									<col width="50%">
									<col width="10%">
									<col width="20%">
									<thead>
										<tr>
											<th>번호</th>
											<th id="enameSR">수/발신자</th>
											<th>내용</th>
											<th>열람여부</th>
											<th>발신일</th>
										</tr>
									</thead>
									<tbody id="msgtbody">
									</tbody>
								</table>
							</div>
						</div>
						<div class="card-footer">
							<div class="row">
								<div class="col-sm-5">
									<button type="button" class="btn btn-secondary">
										총 <span class="badge badge-light" id="empCount"></span> 건
									</button>	
									<button type="button" class="btn btn-primary" id="toWhoBtn">
										메세지 작성</button>
									<button type="button" class="btn btn-info" id="toMeBtn">
										나에게 쓰기</button>
								</div>
								<div class="col-sm-7">
									<ul class="pagination justify-content-end center" id="pageBlockUl">
										<li class="page-item"><a class="page-link"
											href="" id="PreviousA">Previous</a></li>
											
										<span id="pageForIn" class="row" style="margin-left: 0px;margin-right: 0px;"></span>
										
										<li class="page-item"><a class="page-link"
											href="" id="NextA">Next</a></li>
										
									</ul>
										
								</div>
							</div>
						</div>
					</div>
				</div>
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
	<!-- 메세지 작성 전에, 받을 사람을 검색하는 모달 -->
	<div id="opneMEModal" data-toggle="modal" data-target="#askEnameModal"></div>
	<div class="modal fade" id="askEnameModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">사원의 이름을 검색하세요</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close" id="clsSEMBtn">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body table-responsive">
					<h6>메세지를 받는 사원의 이름</h6>
					<div class="input-group">
						<input type="text"
							class="form-control bg-gray-100"
							placeholder="사원 이름을 검색하세요" id="toEname">
					</div>
					<table class="table table-bordered">
						<col width="33%">
						<col width="33%">
						<col width="33%">
						<thead>
							<tr>
								<th>부서명</th>
								<th>사원명</th>
								<th>직급</th>
							</tr>
						</thead>
						<tbody id="emptbody">
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 메세지 모달 띄우는 div -->
	<div id="showModal" data-toggle="modal"
		data-target="#exampleModalCenter"></div>
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalTitle">메세지</h5>
					<button type="button" id='clsBtn' class="close"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="sendMForm" class="user" enctype="multipart/form-data">
						<div class="form-group row" id="empnoInput">
							<div class="col-sm-2 mb-5 mb-sm-0">
								<input style="text-align: center;" type="text"
									class="form-control" id="srDname" readonly>
							</div>
							<div class="col-sm-2">
								<input style="text-align: center;" type="text"
									class="form-control" id="srEname" readonly>
									<input type="hidden" name="rmid" readonly>
									<input type="hidden" name="reid" readonly>
									<input type="hidden" name="seid" readonly>
							</div>
							<div class="col-sm-5">
							</div>
							<div class="col-sm-3">
								<input style="text-align: center;" type="text"
									class="form-control" id="srDate" readonly>
							</div>
						</div>
						<div class="form-group">
							<textarea class="form-control" rows="12" id="cttTA"
								maxlength="300" placeholder="내용을 입력하세요" name="content">
							</textarea>
							<div class="textareaDiv form-control" id="msgCtt"></div>
						</div>
						<input type="file" multiple="multiple" name="msgfiles" class="form-control" value="">
						<span id="sendFiles">
							
						</span>
					</form>
				</div>
				<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="sendBtn" onclick="sendMessage()">
							메세지 발송</button>
						<button type="button" class="btn btn-secondary" id="recieveBtn">
							답장</button>
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

	<script type="text/javascript">
		$(document).ready(function() {
			// 사원 이름 검색 form의 엔터키 작동(submit) 무효화
			$('form').on('keydown', function(e) {
				if (e.key === 'Enter') {
				    // 현재 포커스가 textarea가 아닌 경우에만 Enter 키 막기
				    if (e.target.tagName.toLowerCase() !== 'textarea') {
				      e.preventDefault(); // enter 키 작동 정지
				    }
				}
			});

			// 사원 이름 검색 form의 input에 엔터키를 입력하면 ajax 작동
			$("#searchEname").keyup(function() {
				if (event.keyCode == 13) {
					$("#curPage").val(1)
					onAjax()
				}
			})

			// 돋보기 버튼을 누르면 ajax 작동
			$("#msgSchBtn").click(function() {
				$("#curPage").val(1)
				onAjax()
			})
			//console.log("ready"+startBlock)
			// 메세지 작성 버튼 클릭 => 대상 선택 모달창 호출
			$("#toWhoBtn").click(function(){
				$("#toEname").val("")
				$("#opneMEModal").click()
			})
			// 나에게 쓰기 버튼 클릭
			$("#toMeBtn").click(function(){
				$("[name=rmid]").val("0")
				$("[name=reid]").val(sesEmpno)
				//console.log($("[name=rmid]").val())
				//console.log($("[name=reid]").val())
				let nowDate = new Date(); // 현재 시간
				let nowDateS = formatDate(nowDate); // 시간을 문자열 형태로 ("YYYY-MM-DDTHH:MI:SS.sssZ")
				let today = nowDateS.slice(0,10); // 앞에서부터 10글자 뽑아오기("YYYY-MM-DD")
				$("#srDname").val(sesDname)
				$("#srEname").val(sesEname)
				$("#srDate").val(today)
				$("#recieveBtn").hide();
				$("[name=msgfiles]").show();
				$("#sendBtn").show();
				$("#cttTA").val("");
				$("#cttTA").show();
				$("#msgCtt").hide();
				$("#showModal").click()
			})
			
			// 키 입력에 반응하여 사원 검색 ajax 작동
			$("#toEname").keyup(function(){
				getEmpAjax()
			})
			
			// 모달 닫힐 때 실행 jquery
			$("#exampleModalCenter").on('hide.bs.modal', function () {
				// 모달이 닫힐 때 실행될 함수
				onAjax()
				$("#recieveBtn").off("click") // 답장버튼 이벤트 제거
				$("#sendFiles").empty(); // 파일 다운로드 a태그 제거
			});
			
			$("[name=seid]").val(sesEmpno) // 페이지 로드 되면 발신자 사원번호에 내 사원번호 넣기
			//console.log($("[name=seid]").val())
			
			
			// 헤더의 메세지를 눌러서 이동한 경우
			if(insertNo==5){
				openDt(goMsg);
			}else if(insertNo==6){
				openSM(sendToEmpno,sendToEname,sendToDname);
			}

		})
		$("#curPage").val(1)
		let curPage = $("#curPage").val()
		//console.log(curPage)
		$("#pageSize").val(5)
		let pageSize = $("#pageSize").val()
		//console.log(pageSize)
		let startBlock = "";
		let sesEmpno = "${sessionScope.empno}"
		let sesEname = "${sessionScope.ename}"
		let sesDname = "${sessionScope.dname}"
		let insertNo = `${param.insertNo}`
		let goMsg = `${param.goMsg}`
		let sendToEmpno = `${param.sendToEmpno}`
		let sendToEname = `${param.sendToEname}`
		let sendToDname = `${param.sendToDname}`
		// 페이지 로드 되면 ajax 작동
		onAjax()
		<% session.setMaxInactiveInterval(60 * 60); %>
		

		// ajax 실행하는 함수
		function onAjax() {
			// 사원 이름, 부서번호를 지정
			let sEname = $("#searchEname").val()
			let sendOrRecieve = $("#searchSR").val()
			let sPageSize = $("#pageSize").val()
			let sCurPage = $("#curPage").val()
			//console.log(sesEmpno)
			//console.log(sEname)
			//console.log(sendOrRecieve)
			//console.log(sPageSize)
			//console.log(sCurPage)
			getMessage(sesEmpno, sEname, sendOrRecieve, sPageSize, sCurPage)
			pageAjax(sesEmpno, sEname, sendOrRecieve, sPageSize, sCurPage)
		}
		
		// 메세지 검색하는 ajax
		function getMessage(empno, ename, sendOrRecieve, pageSize, curPage) {
			if(sendOrRecieve==1){
				//모든
				$("#cardTitle").text("모든 메세지들")
				$("#enameSR").text("수/발신자")
			}else if(sendOrRecieve==2){
				//보낸
				$("#cardTitle").text("보낸 메세지들")
				$("#enameSR").text("수신자")
			}else if(sendOrRecieve==3){
				//받은 메세지
				$("#cardTitle").text("받은 메세지들")
				$("#enameSR").text("발신자")
			}
			$.ajax({
				url : "/ajaxsearchMsgList",
				type : "post",
				data : "empno=" + empno + "&ename=" + ename
						+ "&sendOrRecieve=" + sendOrRecieve
						+"&pageSize=" + pageSize + "&curPage=" + curPage,
				dataType : "json",
				success : function(msgs) {
					let addHTML = "";
					let isRead = "";
					let senddate = "";
					$(msgs).each(function(idx, msg) {
						let hireS = formatDate(new Date(msg.senddte));
						let sOrREname = msg.ename;
						let yoyac = ""
						let fixMsg = msg.content.replace(/\\n/g, "\n");
						let resend = ""
						//console.log(empno)
						if(sendOrRecieve==1){
							if (msg.seid == msg.reid) {
								sOrREname = "나에게";
							} else if (msg.seid == empno) {
								sOrREname = msg.reename+" 받음"
							} else if (msg.reid == empno) {
								sOrREname = msg.seename+" 보냄"
							}
						}else{
							sOrREname = msg.ename;
						}
						if (msg.opauth == 1) {
							isRead = "안 읽음"
						} else if (msg.opauth == 2) {
							isRead = "읽음"
						} else {
							isRead = "예외"
						}
						if(fixMsg.length>20){
							yoyac = fixMsg.slice(0, 20)+"..."
						}else{
							yoyac = fixMsg
						}
						if(msg.level!=1){
							resend = Math.floor(msg.level / 2)+"번째 답장 : "
							if(sendOrRecieve==1){
								resend = "└"+resend
							}
							yoyac = resend + yoyac
						}
						//senddate = msg.senddte.toISOString()
						addHTML += "<tr onclick='openDt(" + msg.mid
								+ ")'><td>" + msg.cnt + "</td><td>"
								+ sOrREname + "</td><td>" + yoyac
								+ "</td><td>" + isRead + "</td><td>["
								+ hireS.slice(0, 10) + "] [" + hireS.slice(11, 16)
								//+ msg.senddte
								+ "]</td></tr>"
					})
					//console.log(addHTML)
					$("#msgtbody").html(addHTML)
				},
				error : function(err) {
					console.log(err)
				}
			})
		}
		
		function openSendModal(){
			$("#showModal").click()
		}
		
		// 메세지 검색후 페이징처리 ajax
		function pageAjax(empno, ename, sendOrRecieve, pageSize, curPage) {
			$.ajax({
				url : "ajaxsearchMsgListPage",
				type : "post",
				data : "empno=" + empno + "&ename=" + ename
						+ "&sendOrRecieve=" + sendOrRecieve
						+"&pageSize=" + pageSize + "&curPage=" + curPage,
				dataType : "json",
				success : function(sch) {
					//console.log("ajax작동")
					startBlock = sch.startBlock;
					//console.log(startBlock)
					let endBlock = sch.endBlock;
					//console.log(endBlock)
					let curPage = sch.curPage;
					//console.log(curPage)
					let hrefP = "javascript:goPage(" + (startBlock - 1) + ")"
					//console.log(hrefP)
					let hrefN = "javascript:goPage(" + (endBlock + 1) + ")"
					//console.log(hrefN)
					$("#empCount").text(sch.count);
					let addHTML = ""
					for(let pcnt=startBlock; pcnt<=endBlock; pcnt++){
						let clboo = curPage==pcnt?'active':'';
						addHTML += "<li class=\"page-item "+clboo+"\">"+
				  				   "<a class=\"page-link\" href=\"javascript:goPage("+pcnt+")\">"+pcnt+"</a></li>"
					}
					//console.log(addHTML)
					$("#PreviousA").attr("href",hrefP)
					$("#NextA").attr("href",hrefN)
					$("#pageForIn").html(addHTML)

				},
				error : function(err) {
					console.log(err)
				}
			})
		}
		
		// 페이징 처리
		function uptPageSize() {
			$("#pageSize").val($("#pageSizeSel").val())
			//console.log($("#pageSize").val())
			$("#curPage").val(1)
			//console.log($("#curPage").val())
			onAjax();
		}
		// n번 페이지로 이동
		function goPage(pcnt) {
			//console.log(pcnt)
			$("#curPage").val(pcnt) // 클릭한 번호를 현재 페이지로 설정
			//console.log($("#curPage").val())
			onAjax(); // 요청값으로 전송
		}
		
		// 사원목록 검색하는 ajax
		function getEmpAjax() {
			let getEname = $("#toEname").val()
			
			$.ajax({
				url : "ajaxgetCookieEmpSimple",
				type : "post",
				data : "ename=" + getEname,
				dataType : "json",
				success : function(emps) {
					let addHTML = "";
					let authName = "";
					$(emps).each(function(idx, emp) {
						if (emp.auth == 1) {
							authName = "사원"
						} else if (emp.auth == 2) {
							authName = "관리자"
						} else {
							authName = "시스템관리자"
						}
						addHTML += "<tr onclick=\"openSM('" + emp.empno + "','"
								+ emp.ename + "','" + emp.dname
								+ "')\"><td>" + emp.dname + "</td><td>"
								+ emp.ename + "</td><td>" + authName + "</td></tr>"
					})
					//console.log(addHTML)
					$("#emptbody").html(addHTML)
				},
				error : function(err) {
					console.log(err)
				}
			})
		}
		
		// 사원 선택 후 메세지 작성 모달창 호출
		function openSM(empno,ename,dname){
			$("[name=rmid]").val("0")
			$("[name=reid]").val(empno)
			//console.log($("[name=rmid]").val())
			//console.log($("[name=reid]").val())
			$("#recieveBtn").hide();
			$("#sendBtn").show();
			$("#clsSEMBtn").click()
			let nowDate = new Date(); // 현재 시간
			let nowDateS = formatDate(nowDate); // 시간을 문자열 형태로 ("YYYY-MM-DDTHH:MI:SS.sssZ")
			let today = nowDateS.slice(0,10); // 앞에서부터 10글자 뽑아오기("YYYY-MM-DD")
			$("#srDname").val(dname)
			$("#srEname").val(ename)
			$("#srDate").val(today)
			$("#cttTA").val("");
			$("#cttTA").show();
			$("[name=msgfiles]").show();
			$("#msgCtt").hide();
			$("#showModal").click()
		}
		
		// 메세지 상세 내용 확인
		function openDt(mid){

			//<span ondblclick="download('${fname}')">${fname}</span>,&nbsp;&nbsp;&nbsp;
			
			$("#sendBtn").hide();
			$("#recieveBtn").show();
			$("#cttTA").hide();
			$("[name=msgfiles]").hide();
			$("#msgCtt").show();
			let nowDate = new Date(); // 현재 시간
			let nowDateS = formatDate(nowDate); // 시간을 문자열 형태로 ("YYYY-MM-DD HH:MI")
			let today = nowDateS.slice(0,10); // 앞에서부터 10글자 뽑아오기("YYYY-MM-DD")
			//console.log(nowDateS)
			//console.log(today)
			let msgDay = "";
			let sOrREname = "";
			let sOrRDname = "";
			$.ajax({
				url : "ajaxgetCookieEmpMsgDt",
				type : "post",
				data : "mid=" + mid + "&readid=" + sesEmpno,
				dataType : "json",
				success : function(msg) {
					let addHTML = "";
					let hireS = formatDate(new Date(msg.senddte));
					if(hireS.slice(0,10)==today){
						msgDay = hireS.slice(11,16)
					}else{
						msgDay = hireS.slice(0,10)
					}
					//console.log (msgDay)
					if(msg.seid==msg.reid){
						sOrREname = msg.seename;
						sOrRDname = msg.sedname;
						$("[name=reid]").val(msg.reid)
						$("#recieveBtn").hide();
						$("#sendBtn").hide();
					}else if(msg.seid==sesEmpno){
						sOrREname = msg.reename;
						sOrRDname = msg.redname;
						$("[name=reid]").val("")
						$("#recieveBtn").hide();
						$("#sendBtn").hide();
					}else if(msg.reid==sesEmpno){
						sOrREname = msg.seename;
						sOrRDname = msg.sedname;
						$("[name=reid]").val(msg.seid)
						$("#recieveBtn").show();
						$("#sendBtn").hide();
					}
					//console.log(msg.fnames)
					if(msg.fnames!=null){
						$(msg.fnames).each(function(idx, fname) {
							addHTML += "<a href=\"download?filename="+fname
									+ "\" target=\"_blank\">"+fname+"</a>&nbsp;&nbsp;&nbsp;"
						})
					}
					$("#sendFiles").html(addHTML)
					$("#srDname").val(sOrRDname)
					$("#srEname").val(sOrREname)
					$("#srDate").val(msgDay)
					$("#msgCtt").text(msg.content)
					$("#recieveBtn").on("click",function(){
						reSendMessage(msg.mid)
					})
					$("#showModal").click()
				},
				error : function(err) {
					console.log(err)
				}
			})
		}

		function download(fname){
			if(confirm(fname+" 파일을 다운로드 하시겠습니까?"))
				location.href="/download?filename="+fname
		}	
		
		// 시간 수정처리
		function formatDate(date) {
		    let year = date.getFullYear();
		    let month = String(date.getMonth() + 1).padStart(2, '0'); // 월 (0~11이므로 +1)
		    let day = String(date.getDate()).padStart(2, '0'); // 일
		    let hours = String(date.getHours()).padStart(2, '0'); // 24시간제
		    let minutes = String(date.getMinutes()).padStart(2, '0'); // 분
		
		    return year+"-"+month+"-"+day+" "+hours+":"+minutes;
		}	
		
		// 메세지 전송
		function sendMessage(){
			let cont = $("[name=content]").val()
			if(cont==""){
				alert("전송할 메세지를 입력해주세요")
			}else{
				if(confirm("메세지를 보내시겠습니까?")){
					sendMessageAjax()
				}
			}
			
		}
		// 답장 처리
		function reSendMessage(mid){
			$("[name=rmid]").val(mid)
			let reEname = $("#srEname").val()
			$("#clsBtn").click()
			$("#recieveBtn").hide();
			$("#sendBtn").show();
			$("#cttTA").show();
			$("[name=msgfiles]").show();
			$("#msgCtt").hide();
			$("[name=content]").val("\n\n\n\n\n\n----------\n"+reEname+"에게 답장")
			setTimeout(function(){
				$("#showModal").click()
			}, 500) // 0.5초 이후에 모달창을 다시 열기
		}
		// 메세지 전송처리
		function sendMessageAjax(){
			let send = new FormData($('#sendMForm')[0]);
			$.ajax({
				url : "ajaxsendMessage",
				type : "post",
				data : send,
			    contentType: false, // 파일 업로드 시 false로 설정
			    processData: false, // 데이터를 문자열로 변환하지 않음
				success : function(msg) {
					alert(msg)
					if(msg.indexOf("메세지가")>=0){
						location.href="/yoocookiemessage";
					}
				},
				error : function(err) {
					console.log(err)
				}
			})
		}
		
		
	</script>

</body>
</html>