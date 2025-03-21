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

<title>Cookie Main</title>

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

					<!-- Area Chart -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h2 class="m-0 font-weight-bold text-primary">제품별 판매액</h2>
						</div>
						<div class="card-body">
							<div class="chart-area">
								<canvas id="myAreaChart"></canvas>
							</div>
							<hr>

						</div>
					</div>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">오늘의 정보</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<form id="frm01" class="form-inline" method="post">

									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small" placeholder="제목"
											name="subject" value="${param.subject}">
									</div>

									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="작성자" name="writer" value="${param.writer}">
									</div>

									<input type="hidden" name="curPage" value="${sch.curPage}" /> <input
										type="hidden" name="pageSize" value="${sch.pageSize}" />
									<div class="input-group">
										<select class="form-control bg-light border-0 small"
											name="category">
											<option value="">카테고리</option>
											<option value="공지"
												${param.category == '공 지' ? 'selected' : ''}>[ 공 지
												사 항 ]</option>
											<option value="복지"
												${param.category == '복 지' ? 'selected' : ''}>[ 복 지
												사 항 ]</option>
											<option value="협찬"
												${param.category == '협 찬' ? 'selected' : ''}>[ 협 찬
												]</option>
											<option value="기사"
												${param.category == '기 사' ? 'selected' : ''}>[ 기 사
												]</option>
											<option value="이벤트"
												${param.category == '이벤트' ? 'selected' : ''}>[ 이 벤
												트 ]</option>
										</select>
										<script type="text/javascript">
											$("[name=category]").val("${param.category}")
										</script>


									</div>
									<div class="input-group">
										<select class="form-control bg-light border-0 small"
											id="pageSize" onchange="uptPageSize()">
											<option value="3">[ 3 ]</option>
											<option value="5">[ 5 ]</option>
											<option value="10">[ 10 ]</option>
											<option value="20">[ 20 ]</option>
											<option value="50">[ 50 ]</option>
										</select>

										<div class="input-group-append">
											<button class="btn btn-primary" type="button" id="schBtn">
												<i class="fas fa-search fa-sm"></i>

											</button>
										</div>
									</div>
								</form>

								<table class="table ">
									<col width="10%">
									<col width="20%">
									<col width="20%">
									<col width="15%">
									<col width="15%">
									<col width="10%">
									<col width="20%">

									<thead>

										<tr class="text-center">
											<th>번호</th>
											<th>카테고리</th>
											<th>제목</th>
											<th>부서번호</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>조회수</th>
										</tr>
									</thead>


									<tbody class="text-center">
										<!-- 번호 더블클릭시, 상세페이지로 이동 -->
										<c:forEach var="jo" items="${joboardList}">
											<tr ondblclick="goDetail(${jo.no})">
												<td>${jo.cnt}</td>
												<td>${jo.category}</td>
												<!-- 게시글 제목 표시 -->
												<td style="text-align: center;"><c:forEach begin="2"
														end="${jo.level}" varStatus="sts">
							    			&nbsp;&nbsp;&nbsp;
							    			<c:if test="${sts.last}">☞</c:if>
													</c:forEach> <!-- 미확인 게시글은 제못 앞에 * 미확인 * 추가 --> <c:choose>
														<c:when test="${jo.isread == 'N'}">
															<span style="color: red;">* 미확인 *</span>${jo.subject}
    													</c:when>
														<c:otherwise>
										    				${jo.subject}
										    			</c:otherwise>
													</c:choose></td>
												<td>${jo.board_deptno}</td>
												<td>${jo.writer}</td>
												<td><fmt:formatDate value="${jo.regdte}"
														pattern="yyyy년MM월dd일" /></td>
												<td>${jo.readcnt}</td>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="card-footer">
								<div class="row">
									<div class="col-sm-5" style="padding-left: 0;">
										<button type="button" class="btn btn-secondary">
											총 <span class="badge badge-light">${sch.count}</span> 건
										</button>
										<button type="button" class="btn btn-primary" id="regBtn">게시글
											등록</button>
									</div>
								</div>
								<div class="col-sm-7">
									<ul class="pagination justify-content-end m-0" id="pageBlockUl">
										<li class="page-item"><a class="page-link"
											href="javascript:goPage(${sch.startBlock-1})" id="PreviousA">Previous</a>
										</li>
										<c:forEach var="pcnt" begin="${sch.startBlock}"
											end="${sch.endBlock}">
											<li class="page-item ${sch.curPage==pcnt?'active':''}">
												<a class="page-link" href="javascript:goPage(${pcnt})">${pcnt}</a>
											</li>
										</c:forEach>
										<span id="pageForIn" class="row"
											style="margin-left: 0px; margin-right: 0px;"></span>
										<li class="page-item"><a class="page-link"
											href="javascript:goPage(${sch.endBlock+1})" id="NextA">Next</a>
										</li>
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

	<!-- Bootstrap core JavaScript-->
	<script src="a00_com/vendor/jquery/jquery.min.js"></script>
	<script src="a00_com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="a00_com/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="a00_com/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

	<script type="text/javascript">

	<%session.setMaxInactiveInterval(60 * 60);%>
	
	$(document).ready(function(){

		let sesEmpno = "${sessionScope.empno}"
		let sesDeptno = "${sessionScope.deptno}"
		$("#regBtn").click(function(){
			location.href="joboardInsert"
		})
		$("#pageSize").val("${sch.pageSize}")
		
		$("#schBtn").click(function(){
			$("[name=curPage]").val(1)
			$("form").submit();
		})

	});
	function goDetail(no){
		
		location.href="joboardDetail?no="+no
	}
	function goPage(pcnt){
		$("[name=curPage]").val(pcnt);
		$("form").submit();
	}
	function uptPageSize(){
		$("[name=pageSize]").val($("#pageSize").val());
		$("[name=curPage]").val(1);
		$("form").submit();
	}
	function updateReadStatus(no, element){
		$.ajax({
			type : "POST",
			url : "/joupdateRead",
			data : {no: no},
			success : function(response){
				if (response === "success"){
					$(element).text("확인");
					location.href="joboardDetail?no="+no;
				}
			}
		});
	}
	
	function ajax() {
	    $.ajax({
	        url: "/prodt_sal_chartList",
	        type: "get",
	        dataType: "json",
	        success: function(data) {
	            const labels = data.map(item => item.sal_month);
	            const chartData1 = data.map(item => item.original_cookie_tot);
	            const chartData2 = data.map(item => item.cocho_cookie_tot);
	            const chartData3 = data.map(item => item.nut_cookie_tot);
				console.log(labels)
	            
	            
	            
	            
	            var ctx = document.getElementById("myAreaChart").getContext('2d');
	            var myLineChart = new Chart(ctx, {
	                type: 'line',
	                data: {
	                    labels: labels,
	                    datasets: [
	                    {
	                        label: "오리지날쿠키",
	                        lineTension: 0.3,
	                        backgroundColor: "rgba(78, 115, 223, 0.05)",
	                        borderColor: "rgba(78, 115, 223, 1)",
	                        pointRadius: 3,
	                        pointBackgroundColor: "rgba(78, 115, 223, 1)",
	                        pointBorderColor: "rgba(78, 115, 223, 1)",
	                        pointHoverRadius: 3,
	                        pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
	                        pointHoverBorderColor: "rgba(78, 115, 223, 1)",
	                        pointHitRadius: 10,
	                        pointBorderWidth: 2,
	                        data: chartData1,
	                    },
	                    {
	                        label: "초코쿠키",
	                        lineTension: 0.3,
	                        backgroundColor: "rgba(78, 115, 223, 0.05)",
	                        borderColor: "rgba(195, 232, 18, 1)",
	                        pointRadius: 3,
	                        pointBackgroundColor: "rgba(78, 115, 223, 1)",
	                        pointBorderColor: "rgba(78, 115, 223, 1)",
	                        pointHoverRadius: 3,
	                        pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
	                        pointHoverBorderColor: "rgba(78, 115, 223, 1)",
	                        pointHitRadius: 10,
	                        pointBorderWidth: 2,
	                        data: chartData2,
	                    },
	                    {
	                        label: "견과류쿠키",
	                        lineTension: 0.3,
	                        backgroundColor: "rgba(78, 115, 223, 0.05)",
	                        borderColor: "rgba(105, 20, 44, 1)",
	                        pointRadius: 3,
	                        pointBackgroundColor: "rgba(78, 115, 223, 1)",
	                        pointBorderColor: "rgba(78, 115, 223, 1)",
	                        pointHoverRadius: 3,
	                        pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
	                        pointHoverBorderColor: "rgba(78, 115, 223, 1)",
	                        pointHitRadius: 10,
	                        pointBorderWidth: 2,
	                        data: chartData3,
	                    }
	                  ],
	               },
	                options: {
	                    maintainAspectRatio: false,
	                    layout: {
	                        padding: {
	                            left: 10,
	                            right: 25,
	                            top: 25,
	                            bottom: 0
	                        }
	                    },
	                    scales: {
	                        xAxes: [{
	                            time: {
	                                unit: 'date'
	                            },
	                            gridLines: {
	                                display: false,
	                                drawBorder: false
	                            },
	                            ticks: {
	                                maxTicksLimit: 7
	                            }
	                        }],
	                        yAxes: [{
	                            ticks: {
	                                maxTicksLimit: 5,
	                                padding: 10,
	                                callback: function(value) {
	                                    return '$' + value.toLocaleString();
	                                }
	                            },
	                            gridLines: {
	                                color: "rgb(234, 236, 244)",
	                                zeroLineColor: "rgb(234, 236, 244)",
	                                drawBorder: false,
	                                borderDash: [2],
	                                zeroLineBorderDash: [2]
	                            }
	                        }],
	                    },
	                    legend: {
	                        display: false
	                    },
	                    tooltips: {
	                        backgroundColor: "rgb(255,255,255)",
	                        bodyFontColor: "#858796",
	                        titleMarginBottom: 10,
	                        titleFontColor: '#6e707e',
	                        titleFontSize: 14,
	                        borderColor: '#dddfeb',
	                        borderWidth: 1,
	                        xPadding: 15,
	                        yPadding: 15,
	                        displayColors: false,
	                        intersect: false,
	                        mode: 'index',
	                        caretPadding: 10,
	                        callbacks: {
	                            label: function(tooltipItem, chart) {
	                                var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
	                                return datasetLabel + ': $' + tooltipItem.yLabel.toLocaleString();
	                            }
	                        }
	                    }
	                }
	            });
	        },
	        error: function(err) {
	            console.log(err);
	        }
	    });
	}
	
	ajax();

</script>

</body>
</html>