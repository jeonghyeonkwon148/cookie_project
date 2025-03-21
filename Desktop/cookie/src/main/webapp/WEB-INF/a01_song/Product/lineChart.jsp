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
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<!-- Custom fonts for this template-->
<link href="a00_com/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="a00_com/css/sb-admin-2.min.css" rel="stylesheet">
<style>
.input-group-text {
	width: 100%;
	background-color: linen;
	color: black;
	font-weight: bolder;
}

.input-group-prepend {
	width: 20%;
}
#content-wrapper {
    display: flex;
    position: relative;
}

.container {
    position: absolute;
    right: 0;       /* 오른쪽에 배치 */
    top: 600px;  /* 아래로 이동할 거리 (필요에 따라 조정) */
    left: 0;    
}
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<!-- Bootstrap core JavaScript-->
	<script src="a00_com/vendor/jquery/jquery.min.js"></script>
	<script src="a00_com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="a00_com/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="a00_com/js/sb-admin-2.min.js"></script>
<script src="https://unpkg.com/vue" type="text/javascript"></script>
<script src="http://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	const URL = "/prodt_sal_chartList"	
	var model = {msg:"제품판매리스트", 
				 sch:{sal_month:""}, salList:[], 
				 sal:{num:'',sal_month:'',original_cookie_tot:'',cocho_cookie_tot:'',nut_cookie_tot:''}, 
				 isLoading:false}
	var vm = Vue.createApp({
		name:"App",
		data(){
			return model;
		},
		created(){
			this.search()
			this.callProdt_sal_chartList()
		},
		methods:{
            callProdt_sal_chartList(){
				// ajaxDeptListVue
				axios.get("/prodt_sal_chartList").then((response)=>{
					console.log(response.data)
					this.salList = response.data
				}).catch((err)=>{
					console.log(err)
				})					
				
			},
			getChart(num){
				
			// 상세 화면 처리
				 $("#regBtnFrm").click()
				 $("#exampleModalLongTitle").text("판매 상세");
				 // 등록 버튼을 보이게 하고, 수정/삭제버튼을 보이지 않게..
				 $("#empRegBtn").hide()
				 $("#empUptBtn").show()
				 $("#empDelBtn").show()
				 // 입력불가능하게 해야되기에..
				 $("#frm02 [name=num]").prop("readonly",true)
			// 상세 데이터 가져오기..
				axios.get("/chartByNum",{params:{num:num}}).then((response)=>{
					console.log("# 상세 데이터 #")
					console.log(response.data)
					this.sal = response.data
					 
					//alert("상세 데이터 가져옴")
				}).catch((err)=>{
					console.log(err)
				})
			},
			insertChart(){
				console.log("# 정보 등록 #")
				console.log(this.emp)
				axios.post("/insertChart",this.sal).then((response)=>{
					console.log(response.data)
					alert(response.data)
					this.sal={}
					
					this.search()
				}).catch((err)=>{
					console.log(err)
				})						
			},
			updateChart(){
				console.log("# 정보 수정 #")
				console.log(this.sal)
				// updateEmpVue
				axios.put("/updateChart",this.sal).then((response)=>{
					console.log(response.data)
					alert(response.data)
					
					this.search()
				}).catch((err)=>{
					console.log(err)
				})						
			},		
			deleteChart(){
				console.log("# 정보 삭제 #")
				
				axios.delete("/deleteChart",{params: {num:this.sal.num} }).then((response)=>{
					console.log(response.data)
					alert(response.data)
					this.sal={}
					this.search()
					$(".clsBtn").click()
				}).catch((err)=>{
					console.log(err)
				})						
			},				
			search(){
				this.isLoading=true;
				//  axios.get(주소,{params:요청값매개변수}).then(함수1-처리결과).catch(함수2-에러발생)
				axios.get(URL,{params:this.sch}).then((response)=>{
					console.log(response.data)
					this.salList = response.data
					this.isLoading=false;
					console.log("#로딩#")
					console.log(this.isLoading)
				}).catch((err)=>{
					console.log(err)
				})
			},
			registerFrm(){
				 // 입력을 초기화
				 $("#frm02")[0].reset()				
				 // 타이틀 변경
				 $("#exampleModalLongTitle").text(" 등록");
				 // 등록 버튼을 보이게 하고, 수정/삭제버튼을 보이지 않게..
				 $("#empRegBtn").show()
				 $("#empUptBtn").hide()
				 $("#empDelBtn").hide()
				 // 입력불가능하게 해야되기에..
				 $("#frm02 [name=num]").prop("readonly",true)
			},
			formatNumber(value) {
			      return value.toLocaleString();			    
			  }
		}
	}).mount(".container")
	
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

				</div>

			</div>
		</div>
		<div class="container">
		<div class="jumbotron text-center">
			<h2>{{msg}}</h2>
		</div>
		    <!-- 
			@keyup.키이름="함수"
			 -->
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				
				<input @keyup.enter="search" class="form-control mr-sm-2" placeholder="판매달"
					v-model="sch.sal_month" /> 
				<button @click="search"  class="btn btn-info" type="button">Search</button>
			    <button class="btn btn-success" id="regBtnFrm"
			    	data-toggle="modal" @click="registerFrm" data-target="#exampleModalCenter"
			        type="button">등록</button>				
			</nav>
		<table class="table table-hover table-striped">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<thead>
				<tr class="table-success text-center">
					<th>번호</th>
					<th>판매달</th>
					<th>오리지날쿠키</th>
					<th>초코쿠키</th>
					<th>견과류쿠키</th>
				</tr>
			</thead>
			<tbody>
				<tr v-for="sal in salList" @dblclick="getChart(sal.num)">
					<td>{{sal.num}}</td>
					<td>{{sal.sal_month}}</td>
					<td>{{ formatNumber(sal.original_cookie_tot) }}</td>
    				<td>{{ formatNumber(sal.cocho_cookie_tot) }}</td>
    				<td>{{ formatNumber(sal.nut_cookie_tot) }}</td>
				</tr>
			</tbody>
			
		</table>
		<button class="btn btn-primary" id="loadBtn" v-show="isLoading" disabled>
		  <span class="spinner-border spinner-border-sm"></span>
		  Loading..
		</button>	
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		    <!-- $("#exampleModalLongTitle").text("등록/상세"); -->
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
		        <button type="button" class="clsBtn close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
				<form id="frm02" class="form"  method="post">
			     <div class="row">
			      <div class="col">
			        <input type="text" v-model="sal.num" 
			        	 class="form-control" placeholder="번호" name="num">
			      </div>	
			     </div>				
			     <div class="row">
			      <div class="col">
			        <input type="text" v-model="sal.sal_month"  class="form-control" placeholder="판매달 입력" name="sal_month">
			      </div>
			      <div class="col">
			        <input type="text" v-model="sal.original_cookie_tot"  class="form-control" placeholder="오리지날쿠키수익 입력" name="original_cookie_tot">
			      </div>
			     </div>
			     <div class="row">
			      <div class="col">
			        <input type="text" v-model="sal.cocho_cookie_tot"  class="form-control" placeholder="초코쿠키수익 입력" name="cocho_cookie_tot">
			      </div>
			      <div class="col">
			        <input type="text" v-model="sal.nut_cookie_tot"  class="form-control" placeholder="견과류쿠키수익 입력" name="nut_cookie_tot">
			      </div>
			     </div>	        	   
			    </form> 
		      </div>
		      <div class="modal-footer"> 
		        <button type="button" @click="insertChart" id="empRegBtn" class="btn btn-success">등 록</button>
		        <button type="button" @click="updateChart"  id="empUptBtn" class="btn btn-primary">수 정</button>
		        <button type="button" @click="deleteChart"  id="empDelBtn" class="btn btn-warning">삭 제</button>
		        <button type="button"   class="clsBtn btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
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
	<script>
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