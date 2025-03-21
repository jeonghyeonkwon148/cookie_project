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
<link href="a00_com/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
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
		width:80%;height:200px;overflow-y:scroll;text-align:left;
		border:1px solid green;
		padding-right:15px;
	}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	var socketServer = "${socketServer}"
		//alert(socketServer+":접속")
		var wsocket = null
	
	$(document).ready(function(){
		$("#enterBtn").click(function(){
			wsocket = new WebSocket(socketServer)//새로운 웹 소켓 연결을 생성
				wsocket.onopen=function(evt){//웹 소켓 연결이 열렸을 때 실행되는 함수
					console.log(evt)
					alert($("#id").val()+"님:입장합니다.");
					wsocket.send( $("#id").val()+"님:입장합니다.");//메시지를 웹 소켓을 통해 서버로 전송
				}
				wsocket.onmessage = function(evt){//서버로부터 메시지를 받았을 때 실행되는 함수
					//alert(evt.data)
					$("#chatMessageArea").append(evt.data+"<br>")
					//수신된 메시지(evt.data)를 추가하고, 줄 바꿈 태그(<br>)를 추가
				}
			

		})
		$("#exitBtn").click(function(){
			alert($("#id").val()+"님:접속 종료합니다.")
			
			wsocket.send( $("#id").val()+"님:접속 종료합니다.");//메시지를 웹 소켓을 통해 서버로 전송
			wsocket.close();//웹 소켓 연결을 닫습니다
			$("#chatMessageArea").text("")
			$("#id").val("").focus()
		})
		$("#sendBtn").click(function(){
			sendMsg()
			
		})
		$("#main").click(function(){
			insertChat()
			location.href="cookiemain"
		})
		$("#msg").keyup(function(){
			if(event.keyCode==13){
				sendMsg()
			}
		})
		$(".clsBtn").click(function(){
			socketServer()		
		})
	});
	function sendMsg(){
		wsocket.send( $("#id").val()+":"+$("#msg").val());
	}
	
	
	
	function insertChat(){
		$.ajax({
			url:"/insertChat",
			type:"get",
			data:$("#frm02").serialize(),
			dataType:"json",
			success:function(data){
				// 등록된 내용 초기화처리
				$("#frm02")[0].reset()
				alert(data.msg)	
			},
			error:function(err){
				console.log(err)
			}
		})
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
<div class="jumbotron text-center">
  <h2>실시간 채팅</h2>
</div>
<div class="container">
	<form id="frm02">
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">입장할이름</span>
		</div>
		<input id="id"  name="sender" class="form-control" value="${sessionScope.ename}"/>		
		<input type="button" class="btn btn-primary" value="채팅방입장" id="enterBtn"/>
		<input type="button" class="btn btn-danger" value="채팅방나가기" id="exitBtn"/>
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">메시지</span>
		</div>
		<div id="chatArea" style="overflow-x:hidden" class="input-group-append">
			<textarea id="chatMessageArea" name="content" class="form-control"  rows="10" cols="20"></textarea>
		</div>
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">받는사람</span>
		</div>
		<select id="id" name="receiver" class="form-control">
			<option value=" ">선택하세요</option>
			<c:forEach var="customer" items="${customerlist}">
				<option value="${customer.manager}">${customer.manager}(${customer.cname})</option>
			</c:forEach>
		</select> 
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">메시지</span>
		</div>
		<input id="msg" class="form-control"  placeholder="전송할 메시지 입력"/>	
		<input type="button" class="btn btn-success" value="메시지전송" id="sendBtn"/>
		<input type="button" class="btn btn-warning" value="메인게시판" id="main"/>
	</div>	
	
	</form>
	
	
		    
</div>
<!-- Bootstrap core JavaScript-->
<script src="a00_com/vendor/jquery/jquery.min.js"></script>
<script src="a00_com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="a00_com/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="a00_com/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="a00_com/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="a00_com/js/demo/chart-area-demo.js"></script>
<script src="a00_com/js/demo/chart-pie-demo.js"></script>
</body>
</html>