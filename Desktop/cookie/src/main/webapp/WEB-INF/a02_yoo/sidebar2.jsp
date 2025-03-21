<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<script src="a00_com/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">

	let auth=0;
	let deptno=0;
	getEmpData()
	function getEmpData() {
	    $.ajax({
	        url: "ajaxcookieempData",
	        type: "post",
	        dataType: "json",
	        success: function(emp) {
				deptno=emp.deptno;
				auth=emp.auth;
				
				if(deptno==10||auth>=2){
					$("#insaMenu").show()
					$("#jemuMenu").show()
					$("#jemuMenu").after("<hr class='sidebar-divider d-none d-md-block'>")
					$("#insaHeader").show()
				}else{
					$("#insaMenu").hide()
					$("#jemuMenu").hide()
					$("#insaHeader").hide()
					
				}
				
	        },
	        error: function(error) {
	            console.log("AJAX 요청 실패:"+error);
	        }
	    });
	}
</script>
<body>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/cookiemain">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-cookie"></i>
                </div>
                <div class="sidebar-brand-text mx-3">쿠키공장</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="/cookiemain">
                    <i class="fas fa-fw fa-cookie-bite"></i>
                    <span>메인화면</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                근무 관리(시스템관리)
            </div>

            <!-- 내 근무 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseComm"
                    aria-expanded="true" aria-controls="collapseComm">
                    <i class="fas fa-fw fa-business-time"></i>
                    <span>내 근무</span>
                </a>
                <div id="collapseComm" class="collapse" aria-labelledby="headingComm" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">개인 정보:</h6>
                        <a class="collapse-item" href="/yoocookieempMyInfo">내 정보</a>
                        <a class="collapse-item" href="/yoocookieempMyCalendar">내 일정</a>
                        <a class="collapse-item" href="/yoocookiemessage">내 메세지</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">게시판:</h6>
                        <a class="collapse-item" href="">게시판</a>
                        <a class="collapse-item" href="">게시글 작성</a>
                    </div>
                </div>
            </li>

            <!-- 사원정보 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseEmployee"
                    aria-expanded="true" aria-controls="collapseEmployee">
                    <i class="fas fa-fw fa-building"></i>
                    <span>회사 정보</span>
                </a>
                <div id="collapseEmployee" class="collapse" aria-labelledby="headingEmployee"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">소개합니다:</h6>
                        <a class="collapse-item" href="/cookieempList">사원 목록</a>
                        <a class="collapse-item" href="/yoocookiedeptList">부서 목록</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading" id="insaHeader">
                인사 재무 관리
            </div>

            <!-- 인사관리 -->
            <li class="nav-item" id="insaMenu">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseInsa"
                    aria-expanded="true" aria-controls="collapseInsa">
                    <i class="fas fa-fw fa-address-book"></i>
                    <span>사원 부서 관리</span>
                </a>
                <div id="collapseInsa" class="collapse" aria-labelledby="headingInsa" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">사원:</h6>
                        <a class="collapse-item" href="/cookieempListInsert?insertNo=5">사원 등록</a>
                        <a class="collapse-item" href="/yoocookiedeptMove">부서/직급 변경</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">부서:</h6>
                        <a class="collapse-item" href="/yoocookiedeptListInsert?insertNo=5">부서 등록/수정</a>
                    </div>
                </div>
            </li>
            
            <!-- 재무관리 -->
            <li class="nav-item" id="jemuMenu">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseJemu"
                    aria-expanded="true" aria-controls="collapseJemu">
                    <i class="fas fa-fw fa-dollar-sign"></i>
                    <span>재무관리</span>
                </a>
                <div id="collapseJemu" class="collapse" aria-labelledby="headingJemu" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">수익지출:</h6>
                        <a class="collapse-item" href="">기록/수정/삭제</a>
                    </div>
                </div>
            </li>
            
            <!-- Heading -->
            <div class="sidebar-heading">
                주문및 입출고 관리
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fa-solid fa-phone"></i>
                    <span>주문관리</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">주문관리:</h6>
                        <a class="collapse-item" href="/orderList">주문리스트</a>     
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">고객관리:</h6>
                        <a class="collapse-item" href="/customerList">고객리스트</a>
                        <h6 class="collapse-header">판매현황:</h6>
                        <a class="collapse-item" href="/prodt_sal_chart">판매현황그래프</a>
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Page2s Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePage2s"
                    aria-expanded="true" aria-controls="collapsePages">
                   <i class="fa-solid fa-truck-fast"></i>
                    <span>입출고관리</span>
                </a>
                <div id="collapsePage2s" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">원재료관리:</h6>
                        <a class="collapse-item" href="/materialList">원재료리스트</a>
                        <a class="collapse-item" href="/material_mngList">원재료입출고기록 리스트</a>
                        <a class="collapse-item" href="/calendar">입출고일정</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">제품관리:</h6>
                        <a class="collapse-item" href="/productList">제품리스트</a>
                        <a class="collapse-item" href="/prodt_mngList">제품입출고기록 리스트</a>
                        <a class="collapse-item" href="/calendar">입출고일정</a>
                    </div>
                </div>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
            <!-- Heading -->
            <div class="sidebar-heading">
                생산/제조 관리
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsemake"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fa-solid fa-fire-burner"></i>
                    <span>생산관리</span>
                </a>
                <div id="collapsemake" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">공정관리:</h6>
                        <a class="collapse-item" href="/Prc01List">공정관리</a>
                        <a class="collapse-item" href="/Prd_mng_prc01List">생산중 공정 관리</a>
                        <a class="collapse-item" href="/Prdct_mngmnList">최종 공정 결과</a>     
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">작업지시:</h6>
                        <a class="collapse-item" href="/Work_orderList">작업지시서</a>
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Page2s Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsequality"
                    aria-expanded="true" aria-controls="collapsePages">
                   <i class="fa-solid fa-temperature-high"></i>
                    <span>품질관리</span>
                </a>
                <div id="collapsequality" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">기계관리:</h6>
                        <a class="collapse-item" href="/Machine_managementList">기계관리</a>
                        <a class="collapse-item" href="/Periodic_inspectionList">기계 정기 검사</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">불량관리:</h6>
                        <a class="collapse-item" href="/Dfc_prd01List">생산중 불량 리스트</a>
                        <a class="collapse-item" href="/Dfct_mngm01List">불량처리 결과</a>
                        <a class="collapse-item" href="/calendar">월별 불량 확인</a>
                        <a class="collapse-item" href="/Defect_typeList">불량 유형 확인</a>
                    </div>
                </div>
            </li>
            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
     </div>  
</body>
</html>