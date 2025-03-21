<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Cookie My Information</title>

<!-- Custom fonts for this template-->
<link href="a00_com/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="a00_com/css/sb-admin-2.min.css" rel="stylesheet">

<!-- 켈린더에 필요 -->
<link href="a00_com/bootstrap.min.css" rel="stylesheet" />
<link href='a00_com/lib/main.css' rel='stylesheet' />


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
					<h1 class="h3 mb-2 text-gray-800">내 일정</h1>
					<p class="mb-4">오늘도 열심히</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">내 켈린더</h6>
						</div>
						<div class="card-body">
							<div id='calendar' class="container"></div>
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
					<button class="btn btn-primary" type="button" id="logoutBtn"
						onclick="logout()">예</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 모달 띄우는 div -->
	<div id="showModal" data-toggle="modal" data-target="#calendarModal"></div>
	<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalTitle">타이틀</h5>
					<button type="button" id='clsBtn' class="close"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="frm" class="form" method="post">
						<div class="form-group row" id="empnoInput">
							<div class="col-sm-3 mb-5 mb-sm-0">
								<input style="text-align: center;" type="text"
									class="form-control" value="일정 이름" readonly>
							</div>
							<div class="col-sm-6">
								<input style="text-align: center;" type="text"
									class="form-control" name="title">
							</div>
							<div class="col-sm-3">
								<select class="form-control" style="text-align: center;"
									name="showlevel">
									<option value="1">개인 일정</option>
									<option value="2">부서 일정</option>
									<option value="3" id="everyDate">전체 일정</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-3 mb-5 mb-sm-0">
								<input style="text-align: center;" type="text"
									class="form-control" value="날짜" readonly>
							</div>
							<div class="col-sm-3">
								<select class="form-control" style="text-align: center;"
									name="allDay">
									<option value="1">하루 일정</option>
									<option value="0">시간 일정</option>
								</select>
							</div>
							<div class="col-sm-3">
								<input type="text" style="text-align: center;"
									class="form-control" id="sStart" readonly>
							</div>
							<div class="col-sm-3">
								<input type="text" style="text-align: center;"
									class="form-control" id="sEnd" readonly>
							</div>
						</div>
						<div class="form-group">
							<textarea class="form-control" rows="12" maxlength="300"
								placeholder="일정의 내용을 입력하세요" name="content">
							</textarea>
						</div>
						<div class="form-group row">
							<div class="col-sm-3 mb-5 mb-sm-0">
								<input style="text-align: center;" type="text"
									class="form-control" value="일정 색깔" readonly>
							</div>
							<div class="col-sm-6">
								<select class="form-control" style="text-align: center;"
									id="choiceCol" onchange="changeColor()">
									<option value="0">선택</option>
									<option value="1"
										style="background-color: rgb(245, 245, 220); color: rgb(70, 50, 50);">
										Beige</option>
									<option value="2"
										style="background-color: rgb(230, 255, 240); color: rgb(50, 50, 50);">
										Mint</option>
									<option value="3"
										style="background-color: rgb(240, 240, 240); color: rgb(30, 30, 80);">
										Gray</option>
									<option value="4"
										style="background-color: rgb(255, 255, 200); color: rgb(45, 45, 45);">
										Yellow</option>
									<option value="5"
										style="background-color: rgb(255, 240, 245); color: rgb(80, 40, 40);">
										Pink</option>
								</select>
							</div>
							<input type="hidden" name="start" readonly/>
							<input type="hidden" name="end" readonly/>
							<input type="hidden" name="backgroundColor" readonly/>
							<input type="hidden" name="textColor" readonly/>
							<input type="hidden" name="id" value="0" readonly/>
							<input type="hidden" name="empno" readonly/>
							<input type="hidden" name="deptno" readonly/>
							<div class="col-sm-3">
								<div class="form-control" style="text-align: center;"
									id="myCalCol">내 일정</div>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-3 mb-5 mb-sm-0">
								<input style="text-align: center;" type="text"
									class="form-control" value="참조 사이트" readonly>
							</div>
							<div class="col-sm-9">
								<input style="text-align: center;" type="text"
									ondblclick="goPage(this.value)" class="form-control"
									name="urllink">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="regBtn">등록</button>
					<button type="button" class="btn btn-warning" id="uptBtn">수정</button>
					<button type="button" class="btn btn-danger" id="delBtn">삭제</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
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

	<!-- 켈린더에 필요 -->
	<script src='a00_com/lib/main.js'></script>

	<script type="text/javascript">
		$(document).ready(function() {

			// 사원 이름 검색 form의 엔터키 작동(submit) 무효화
			$('form').on('keydown', function(e) {
				if (e.key === 'Enter') {
					e.preventDefault(); // 기본 동작 취소
				}
			});
			

		})
		let sesEmpno = "${sessionScope.empno}"
		let sesDeptno = "${sessionScope.deptno}"
		let sesAuth = "${sessionScope.auth}"
		<%session.setMaxInactiveInterval(60 * 60);%>
		
		document.addEventListener('DOMContentLoaded', function() {
			
		
			
			
		
			  
		    var calendarEl = document.getElementById('calendar');

		    var toDay = new Date(); // javascript의 날짜 객체..(현재 날짜와 시간)
		    // 2024-12-03T12:30:25 ==> ISO 표준시간 표현방법 : fullcalendar api 
		    // alert(toDay.toISOString())
		    // .toISOString() : 국제표준시 기준 시간
		    // 시간 저장 시에 해당 시간 기준으로 date 데이터를 저장
		    //toDay.toISOString().split("T") // ["2024-12-03","12:30:25"] 배열로 구분하여 담긴다.
		    // 최종적으로 활용할 날짜만 추출
		    var date = toDay.toISOString().split("T")[0] 
		    // alert(date)
		    
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
		      select: function(event) {
				$("#showModal").click() // 모달 호출
				$("#regBtn").show();$("#uptBtn").hide();$("#delBtn").hide() // 등록버튼만 보이게
				$("#modalTitle").text("일정등록")
				// console.log(event)
				// console.log(event.start)
				// console.log(event.end)
				// console.log(event.allDay)
				$("[name=empno]").val(sesEmpno)
				$("[name=title]").attr("readonly",false)
				$("[name=content]").attr("readonly",false)
				$("[name=urllink]").attr("readonly",false)
				$("[name=allDay]").show()
				$("#myCalCol").show()
				if(sesDeptno==10){
					$("[name=showlevel]").show()
					$("#everyDate").show()
				}else if(sesAuth==1){
					$("[name=showlevel]").hide()
					$("#everyDate").hide()
				}else if(sesAuth==2){
					$("[name=showlevel]").show()
					$("#everyDate").hide()
				}
				$("#choiceCol").show()
				addForm(event, 'I')  // 입력모달/상세모달이 같은 form에 의해 처리되기에 구분..(공통함수이용)
		        calendar.unselect()
		      },
		      eventClick: function(arg) {
		  		$("#showModal").click() // 모달 호출
				$("#regBtn").hide();$("#uptBtn").show();$("#delBtn").show() // 수정삭제
				$("[name=title]").attr("readonly",false)
				$("[name=content]").attr("readonly",false)
				$("[name=urllink]").attr("readonly",false)
				$("[name=allDay]").show()
				$("#choiceCol").show()
				$("#myCalCol").show()
				if(sesDeptno==10){
					$("[name=showlevel]").show()
					$("#everyDate").show()
				}else if(sesAuth==1){
					$("[name=showlevel]").hide()
					$("#everyDate").hide()
				}else if(sesAuth==2){
					$("[name=showlevel]").show()
					$("#everyDate").hide()
				}
				
				// 해당 일정에 저장된 사원번호와 세션의 사원번호가 다르면 수정삭제 불가
				if(sesEmpno!=arg.event._def.extendedProps.empno){
					$("#uptBtn").hide();$("#delBtn").hide()
					$("[name=title]").attr("readonly",true)
					$("[name=content]").attr("readonly",true)
					$("[name=urllink]").attr("readonly",true)
					$("[name=allDay]").hide()
					$("#choiceCol").hide()
					$("[name=showlevel]").hide()
					$("#myCalCol").hide()
				}
				 //console.log(arg.event)
				$("#modalTitle").text("일정상세")
				
				addForm(arg.event, 'D')
		      },
		      
		      editable: true,
		      dayMaxEvents: true, // allow "more" link when too many events
		      events:function(info, successCallback, failureCallback){
				$.ajax({
					url:"/getCookieidcalListAjax",
					type:"post",
					data:"empno="+sesEmpno+"&deptno="+sesDeptno,
					dataType:"json",
					success:function(calList){
		            	//console.log("# 게시판 프로젝트 #")
		            	//console.log(calList)
		            	$(calList).each(function(idx, cal){
		            		if(cal.showlevel==2){
		            			cal.title= "["+cal.title+"]"
		            		}else if(cal.showlevel==3){
		            			cal.title= "##"+cal.title+"##"
		            		}
		            	})
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
				let choCol = $("#choiceCol").val();
				let tit = $("[name=title]").val()
				let con = $("[name=content]").val()
				if(tit!=""){
					if(con!=""){
						if(choCol!=0){
							if(confirm("일정을 등록 하시겠습니까?")){
								callAjax("insCookieidcalAjax")
							}
						}else{
							alert("색을 지정하세요")
							$("#choiceCol").focus();
						}
					}else{
						alert("내용을 입력하세요")
						$("[name=content]").focus()
					}
				}else{
					alert("제목을 입력하세요")
					$("[name=title]").focus()
				}
		    })
		    $("#uptBtn").click(function(){
				if(confirm("해당 일정을 수정 하시겠습니까?")){
					callAjax("udtCookieidcalAjax")
				}
		    })  
		    $("#delBtn").click(function(){
				if(confirm("해당 일정을 삭제 하시겠습니까?")){
					callAjax("delCookieidcalAjax")
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
						//console.log(data)
						
						//console.log("## CUD 이후 ##")
						//alert(data.msg)	
						/// 데이터 재 랜더링...
						calendar.removeAllEvents()
		            	$(data.list).each(function(idx, cal){
		            		if(cal.showlevel==2){
		            			cal.title= "["+cal.title+"]"
		            		}else if(cal.showlevel==3){
		            			cal.title= "##"+cal.title+"##"
		            		}
		            	})
						calendar.addEventSource(data.list)	
						$("#clsBtn").click();
					},
					error:function(err){
						console.log(err)
					}
				})
		    }
		    
		    
			// 등록/상세 따른 모달창의 데이터 입력 form형식 처리
			// 등록 addForm(event, "I"),  일정클릭시 addForm(arg.event, "D")
			function addForm(event, proc){
				$("#frm")[0].reset() // form데이터 초기화
				$("[name=content]").val("")
				$("[name=deptno]").val(sesDeptno) // 부서번호 고정
				if(event.startStr.length>12){
					let stime = "["+event.startStr.slice(5,10)+"] ["+event.startStr.slice(11,16)+"]"
					let etime = "["+event.endStr.slice(5,10)+"] ["+event.endStr.slice(11,16)+"]"
					$("#sStart").val(stime)
					if(event.end==null){  // 마지막날짜가 없는 경우
						$("#sEnd").val(stime)
				    }else{
				    	$("#sEnd").val(etime)
				    }
				}else{
					$("#sStart").val(event.startStr)
					if(event.end==null){  // 마지막날짜가 없는 경우
						$("#sEnd").val(event.startStr)
				    }else{
				    	$("#sEnd").val(event.endStr)
				    }
				}
				$("[name=start]").val(event.startStr)
				if(event.end==null){  // 마지막날짜가 없는 경우
					$("[name=end]").val(event.startStr)
			    }else{
			    	$("[name=end]").val(event.endStr)
			    }
				$("[name=allDay]").val(event.allDay?1:0);// event.allDay true일 때, 1 그외는 0	
				$("#myCalCol").css("background-color","")
				$("#myCalCol").css("color","");
				if(proc=="D"){ 
				// 등록된 일정을 클릭시에서 그외 정보도 할당해야 한다. 그래서 구분..
				//   start end allDay title  backgroundColor textColor  
				// content urllink
					//console.log(event)
					$("[name=id]").val(event.id)
					$("[name=empno]").val(event._def.extendedProps.empno)
	            		if(event._def.extendedProps.showlevel==2){
	    					$("[name=title]").val(event.title.substr(1, event.title.length-2))
	            		}else if(event._def.extendedProps.showlevel==3){
	    					$("[name=title]").val(event.title.substr(2, event.title.length-4))
	            		}else{
	    					$("[name=title]").val(event.title)
	            		}
					$("[name=backgroundColor]").val(event.backgroundColor)
					$("[name=textColor]").val(event.textColor)
					$("[name=content]").val(event._def.extendedProps.content)
					$("[name=urllink]").val(event._def.extendedProps.urllink)
					$("#myCalCol").css("background-color",event.backgroundColor)
					$("#myCalCol").css("color",event.textColor);
				}else{
					$("[name=empno]").val(sesEmpno)
				}
			}
			
			// 등록/상세 따른 모달창의 데이터 입력 form형식 처리
			// 등록 addForm(event, "I"),  일정클릭시 addForm(arg.event, "D")
		});
		function changeColor(){
			let choCol = $("#choiceCol").val();
			//console.log(choCol);
			
			if(choCol==1){
				$("#myCalCol").css("background-color","rgb(245, 245, 220)");
				$("#myCalCol").css("color","rgb(70, 50, 50)");
				$("[name=backgroundColor]").val("#f5f5dc")
				$("[name=textColor]").val("#463232")
				//console.log("case1");
			}else if(choCol==2){
				$("#myCalCol").css("background-color","rgb(230, 255, 240)");
				$("#myCalCol").css("color","rgb(50, 50, 50)");
				$("[name=backgroundColor]").val("#e6fff0")
				$("[name=textColor]").val("#323232")
				//console.log("case2");
			}else if(choCol==3){
				$("#myCalCol").css("background-color","rgb(240, 240, 240)");
				$("#myCalCol").css("color","rgb(30, 30, 80)");
				$("[name=backgroundColor]").val("#f0f0f0")
				$("[name=textColor]").val("#1e1e50")
				//console.log("case3");
			}else if(choCol==4){
				$("#myCalCol").css("background-color","rgb(255, 255, 200)");
				$("#myCalCol").css("color","rgb(45, 45, 45)")
				$("[name=backgroundColor]").val("#ffffc8")
				$("[name=textColor]").val("#2d2d2d")
				//console.log("case4")
			}else if(choCol==5){
				$("#myCalCol").css("background-color","rgb(255, 240, 245)")
				$("#myCalCol").css("color","rgb(80, 40, 40)");
				$("[name=backgroundColor]").val("#fff0f5")
				$("[name=textColor]").val("#502828")
				//console.log("case5");
			}else{
				$("#myCalCol").css("background-color","")
				$("#myCalCol").css("color","");
				$("[name=backgroundColor]").val("")
				$("[name=textColor]").val("")
				//console.log("default");
			}
			
			<%--
			switch(choCol){
				case 1:
					$("#myCalCol").css("background-color","rgb(245, 245, 220)");
					$("#myCalCol").css("color","rgb(70, 50, 50)");
					console.log("case1");
					break;
				case 2:
					$("#myCalCol").css("background-color","rgb(230, 255, 240)");
					$("#myCalCol").css("color","rgb(50, 50, 50)");
					console.log("case2");
					break;
				case 3:
					$("#myCalCol").css("background-color","rgb(240, 240, 240)");
					$("#myCalCol").css("color","rgb(30, 30, 80)");
					console.log("case3");
					break;
				case 4:
					$("#myCalCol").css("background-color","rgb(255, 255, 200)");
					$("#myCalCol").css("color","rgb(45, 45, 45)")
					console.log("case4")
					break;
				case 5:
					$("#myCalCol").css("background-color","rgb(255, 240, 245)")
					$("#myCalCol").css("color","rgb(80, 40, 40)");
					console.log("case5");
					break;
				default:
					console.log("default");
			}
			--%>
		}
	</script>

</body>
</html>
