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
<link href='a00_com/lib/main.css' rel='stylesheet' />
<link href="a00_com/bootstrap.min.css" rel="stylesheet" >
<!-- Custom styles for this template-->
<link href="a00_com/css/sb-admin-2.min.css" rel="stylesheet">
<!-- Core plugin JavaScript-->
<script src="a00_com/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="a00_com/js/sb-admin-2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
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
<script src="/a00_com/jquery.min.js"></script>
<script src="/a00_com/bootstrap.min.js"></script>
<script src="https://unpkg.com/vue" type="text/javascript"></script>
<script src="http://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src='a00_com/lib/main.js'></script>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	
	  
    var calendarEl = document.getElementById('calendar');

    var toDay = new Date(); // javascript의 날짜 객체..(현재 날짜와 시간)
    // 2024-12-03T12:30:25 ==> ISO 표준시간 표현방법 : fullcalendar api 
    //alert(toDay.toISOString())
    // 시간은 필요없고, 날짜만 추출할려면..
    //toDay.toISOString().split("T") // ["2024-12-03","12:30:25"] 배열로 구분하여 담긴다.
    // 최종적으로 활용할 날짜만 추출하기 위해..
    var date = toDay.toISOString().split("T")[0] 
    
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: date,
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(event) {//이 함수는 사용자가 캘린더에서 날짜를 선택할 때마다 새로운 이벤트를 추가하기 위한 초기 설정을 도와줍니다
		$("#showModal").click() // 입력을 위한 모달이 로딩되게 처리..
		$("#regBtn").show();$("#uptBtn").hide();$("#delBtn").hide()
		$("#modalTitle").text("일정등록")
		console.log(event)
		console.log(event.start)
		console.log(event.end)
		console.log(event.allDay)
		addForm(event, 'I')  // 입력모달/상세모달이 같은 form에 의해 처리되기에 구분..(공통함수이용)
        calendar.unselect()
      },
      eventClick: function(arg) {
//이 함수는 사용자가 이미 존재하는 이벤트를 클릭하면 해당 이벤트의 세부 정보를 보여주는 모달 창을 여는 역할을 합니다.
  		$("#showModal").click() // 입력을 위한 모달이 로딩되게 처리..
		$("#regBtn").hide();$("#uptBtn").show();$("#delBtn").show()
		$("#modalTitle").text("일정상세")
		addForm(arg.event, 'D')
      },
      
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events:function(info, successCallback, failureCallback){//이 함수는 FullCalendar에서 이벤트 데이터를 가져오기 위해 호출됩니다.
		$.ajax({
			url:"calListAjax",
			dataType:"json",
			success:function(calList){
            	console.log("# 게시판 프로젝트 #")
            	console.log(calList)
            	successCallback(calList)
			},
			error:function(err){
				console.log(err)
				failureCallback(err)
			}
		})
		  
	  }
    });

    calendar.render();
    
    
    $("#regBtn").click(function(){
		if(confirm("일정 등록 하시겠습니까?")){
			callAjax("insertCalendarAjax")
		}
    })
    $("#uptBtn").click(function(){
		if(confirm("일정 수정 하시겠습니까?")){
			callAjax("updateCalendarAjax")
		}
    })  
    $("#delBtn").click(function(){
		if(confirm("일정 삭제 하시겠습니까?")){
			callAjax("deleteCalendarAjax")
		}
    })      
    // 
    
    function callAjax(loc){
		$.ajax({
			url:loc,
			type:"post",
			data:$("#frm").serialize(),
			dataType:"json",
			success:function(data){
				/*
			class CudVo {
				private String msg;
				private List<?> list;	
			==> {msg:"등록성공", list:[{id:1,title:""},{id:2,title:""},]}	
				*/
				console.log(data)
				
				console.log("## CUD 이후 ##")
				alert(data.msg)	
				/// 데이터 재 랜더링...
				calendar.removeAllEvents()
				calendar.addEventSource(data.list)					
			},
			error:function(err){
				console.log(err)
			}
		})
    }
    
    
  });
  // 등록/상세 따른 모달창의 데이터 입력 form형식 처리
  // 등록 addForm(event, "I"),  일정클릭시 addForm(arg.event, "D")
  function addForm(event, proc){
	$("#frm")[0].reset() // form데이터 초기화
	$("[name=start]").val(event.startStr)
	if(event.end==null){  // 마지막날짜가 없는 경우
		$("[name=end]").val(event.startStr)
    }else{
    	$("[name=end]").val(event.endStr)
    }
	$("[name=allDay]").val(event.allDay?1:0);// event.allDay true일 때, 1 그외는 0	
	if(proc=="D"){ // 등록된 일정을 클릭시에서 그외 정보도 할당해야 한다. 그래서 구분..
//   start end allDay title  backgroundColor textColor 제공데이터  
// content writer urllink 사용자 지정 데이터
		$("[name=id]").val(event.id)
		$("[name=title]").val(event.title)
		$("[name=backgroundColor]").val(event.backgroundColor)
		$("[name=textColor]").val(event.textColor)
		$("[name=content]").val(event.extendedProps.content)
		$("[name=writer]").val(event.extendedProps.writer)
		$("[name=urllink]").val(event.extendedProps.urllink)
	}
	
	
  }
</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
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
<jsp:include page="/headerCookie" />
<!-- End of Topbar -->
<!-- Begin Page Content -->
<div class="container-fluid"><!-- ctrl + shift+ f (소스 정리) -->
<div class="jumbotron text-center">
  <h2>입출고 일정</h2>
</div>
	<div id='calendar'></div>
  <!-- 
  title writer start end content backgroundColor textColor allDay urllink
   -->
  <!-- 모달 로딩 요소객체 --> 
  <div id="showModal"  data-toggle="modal" data-target="#exampleModalCenter"></div> 
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalTitle">타이틀</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm" class="form"  method="post">
		 	<input type="hidden" name="id" value="0"/>
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="일정명 입력" name="title">
	      </div>
	     </div>
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="작성자 입력" name="writer">
	      </div>
	      <div class="col">
	      	<select class="form-control"  name="allDay" >
	      		<option value="1">종일</option>
	      		<option value="0">시간</option>
	      	</select>
	      </div>
	     </div> 	     
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="시작일시" name="start">
	      </div>
	      <div class="col">
	      	<input type="text" class="form-control" placeholder="종료일시" name="end">
	      </div>	      
	     </div>	  
	     <div class="row">
	      <div class="col">
	      	<textarea name="content"  placeholder="내용입력"  rows="5" cols="20" class="form-control" ></textarea>
	      </div>
	     </div>	 
	     <div class="row">
	      <div class="col">
	        <input type="color"  title="배경색상"  class="form-control" name="backgroundColor" value="#0099cc"> 
	      </div>
	      <div class="col">
	      	<input type="color" title="글자색상"  class="form-control" name="textColor"  value="#ccffff">
	      </div>	      
	     </div>	 
	     <div class="row">
	      <div class="col">
	        <input type="text" ondblclick="goPage(this.value)" class="form-control" placeholder="참조사이트" name="urllink">
	      </div>
	     </div>
	    </form> 
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
	    <script type="text/javascript">
	    	function goPage(page){
				if(confirm("해당 페이지로 이동하시겠습니까?")){
				   // 새로운 창으로 이동 처리.
					window.open(page,"","")
					//location.href=page
				}
				
	    	}
	    </script>
      </div>
	    <div class="modal-footer">
			<c:if test="${sessionScope.auth == 2 && sessionScope.deptno == 30}">
				<button type="button" class="btn btn-success" id="regBtn">등록</button>
				<button type="button" class="btn btn-primary" id="uptBtn">수정</button>
				<button type="button" class="btn btn-warning" id="delBtn">삭제</button>
			</c:if>
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>     
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