<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>vue exercise</title>
<link rel="stylesheet" href="/a00_com/bootstrap.min.css">
<!-- Custom fonts for this template-->
<link href="a00_com/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom fonts for this template-->
<link href="a00_com/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom styles for this template-->
<link href="a00_com/css/sb-admin-2.min.css" rel="stylesheet">
<style>
td {
	text-align: center;
}
#loadBtn{
  	position: fixed; /* 화면에 고정 */
	top: 40%; /* 화면의 중간 */
	left: 50%; /* 화면의 중간 */		
}		
</style>
<script src="https://unpkg.com/vue" type="text/javascript"></script>
<script src="http://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
						<!-- Bootstrap core JavaScript-->
<script src="a00_com/vendor/jquery/jquery.min.js"></script>
<script src="a00_com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="a00_com/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="a00_com/js/sb-admin-2.min.js"></script>

<script type="text/javascript">
//http://localhost:5050/a01_song/chatList.html
	$(document).ready(function(){
		
		const URL = "/chatList"
		var model = {msg:"채팅리스트", 
					 sch:{sender:"",receiver:""}, chatList:[], 
					 chat:{chat_id:'',sender:'',receiver:'',content:'',readcnt:'',send_date:''}, 
					 isLoading:false}
		var vm = Vue.createApp({
			name:"App",
			data(){
				return model;
			},
			created(){
				this.search()
				this.callChat()
			},
			methods:{
                callChat(){
					
					axios.get("/chatList").then((response)=>{
						console.log(response.data)
						
						this.chatList = response.data
					}).catch((err)=>{
						console.log(err)
					})					
					
				},
				getChat(chat_id){
					//alert(empno)
				// 상세 화면 처리
					 $("#regBtnFrm").click()
					 $("#exampleModalLongTitle").text("채팅 상세");
					 // 등록 버튼을 보이게 하고, 수정/삭제버튼을 보이지 않게..
					
					 $("#empDelBtn").show()
					 // 사원번호가 입력이 가능하게/상세화면에서는 입력불가능하게 해야되기에..
					 
				// 상세 데이터 가져오기..
					axios.get("/chatByChatId",{params:{chat_id:chat_id}}).then((response)=>{
						console.log("# 상세 데이터 #")
						console.log(response.data)
						 response.data.send_date = this.formatDate(response.data.send_date)
						
						this.chat = response.data
						this.search()
					}).catch((err)=>{
						console.log(err)
					})
				},
				deleteChat(){					
					axios.delete("/deleteChat",{params: {chat_id:this.chat.chat_id} }).then((response)=>{
						console.log(response.data)
						alert(response.data)
						this.chat={}
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
				
						this.chatList = response.data
						this.isLoading=false;
						
					}).catch((err)=>{
						console.log(err)
					})
				},
				formatDate(dateString) {
		            const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
		            return new Date(dateString).toLocaleDateString('ko-KR', options);
		        },
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
<div class="container-fluid"><!-- ctrl + shift+ f (소스 정리) -->
	<div class="container">
		<div class="jumbotron text-center">
			<h2>{{msg}}</h2>
		</div>
		    <!-- 
			@keyup.키이름="함수"
			 -->
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input @keyup.enter="search" class="form-control mr-sm-2" placeholder="보낸자"
					v-model="sch.sender" /> 
				<input  @keyup.enter="search" class="form-control mr-sm-2"
					placeholder="받는자" v-model="sch.receiver" />
				<button @click="search"  class="btn btn-info" type="button">Search</button>
			    <button class="btn btn-success" id="regBtnFrm"
			    	data-toggle="modal" @click="registerFrm" data-target="#exampleModalCenter"
			        type="button">등록</button>				
			</nav>
		
		<table class="table table-hover table-striped">
			<col width="10%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="10%">
			<col width="20%">
			<thead>
				<tr class="table-success text-center">
					<th>채팅아이디</th>
					<th>보낸사람</th>
					<th>받는사람</th>
					<th>내용</th>
					<th>읽음여부</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<tr v-for="chat in chatList" @dblclick="getChat(chat.chat_id)">				
					<td>{{chat.chat_id}}</td>
					<td>{{chat.sender}}</td>
					<td>{{chat.receiver}}</td>
					<td>{{chat.content}}</td>
					<td>{{chat.readcnt}}</td>
					<td>{{ formatDate(chat.send_date) }}</td>
					
				</tr>
			</tbody>
			
		</table>
		<button class="btn btn-primary" id="loadBtn" v-show="isLoading"
			disabled>
			<span class="spinner-border spinner-border-sm"></span> Loading..
		</button>
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<!-- $("#exampleModalLongTitle").text("등록/상세"); -->
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
						<button type="button" class="clsBtn close"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form id="frm02" class="form" method="post">
							<div class="row">
								<div class="col">
									<input type="text" v-model="chat.chat_id"
										class="form-control">
								</div>
							</div>
							<div class="row">
								<div class="col">
									<input type="text" v-model="chat.sender"
										class="form-control">
								</div>
								<div class="col">
									<input type="text" v-model="chat.receiver"
										class="form-control">
								</div>
							</div>
							<div class="row">
								<!--  
								<div class="col">
									<input type="text" v-model="chat.content"
										class="form-control">
								</div>
								-->
								<div class="col">
									<div  style="overflow-x:hidden" class="input-group-append">
										<textarea  v-model="chat.content" class="form-control"  rows="10" cols="20"></textarea>
									</div>
								</div>
								<div class="col">
									<input type="text" v-model="chat.readcnt"
										class="form-control">
								</div>
							</div>
							<div class="row">
								<div class="col">
									<input type="text" v-model="chat.send_date"
										 class="form-control">
								</div>
						</form>
					</div>
					<div class="modal-footer">
						<c:if test="${sessionScope.auth == 2 && sessionScope.deptno == 30}">
 							<button type="button" @click="deleteChat" id="empDelBtn" class="btn btn-warning">삭 제</button>
      					</c:if>
						<button type="button" class="clsBtn btn btn-secondary"
							data-dismiss="modal">Close</button>
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
</body>
</html>