<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
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
			
			if(deptno==10||auth>1){
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
                <div class="sidebar-brand-text mx-3"><spring:message code="CompanyName"/></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="/cookiemain">
                    <i class="fas fa-fw fa-cookie-bite"></i>
                    <span><spring:message code="MainScreen"/></span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                <spring:message code="WorkManagement"/>
            </div>

            <!-- 내 근무 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseComm"
                    aria-expanded="true" aria-controls="collapseComm">
                    <i class="fas fa-fw fa-business-time"></i>
                    <span><spring:message code="MyWork"/></span>
                </a>
                <div id="collapseComm" class="collapse" aria-labelledby="headingComm" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header"><spring:message code="PersonalInformation"/>:</h6>
                        <a class="collapse-item" href="/yoocookieempMyInfo"><spring:message code="MyInformation"/></a>
                        <a class="collapse-item" href="/yoocookieempMyCalendar"><spring:message code="MySchedule"/></a>
                        <a class="collapse-item" href="/yoocookiemessage"><spring:message code="MyMessages"/></a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header"><spring:message code="BulletinBoard"/>:</h6>
                        <a class="collapse-item" href="/joboardList"><spring:message code="BulletinBoard"/></a>
                        <a class="collapse-item" href="/joboardInsert"><spring:message code="CreatePost"/></a>
                    </div>
                </div>
            </li>

            <!-- 사원정보 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseEmployee"
                    aria-expanded="true" aria-controls="collapseEmployee">
                    <i class="fas fa-fw fa-building"></i>
                    <span><spring:message code="CompanyInformation"/></span>
                </a>
                <div id="collapseEmployee" class="collapse" aria-labelledby="headingEmployee"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header"><spring:message code="Introduction"/>:</h6>
                        <a class="collapse-item" href="/cookieempList"><spring:message code="EmployeeList"/></a>
                        <a class="collapse-item" href="/yoocookiedeptList"><spring:message code="DepartmentList"/></a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading" id="insaHeader">
                <spring:message code="HumanResourcesAndFinancialManagement"/>
            </div>

            <!-- 인사관리 -->
            <li class="nav-item" id="insaMenu">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseInsa"
                    aria-expanded="true" aria-controls="collapseInsa">
                    <i class="fas fa-fw fa-address-book"></i>
                    <span><spring:message code="ManagementOfEmployeesAndDepartments"/></span>
                </a>
                <div id="collapseInsa" class="collapse" aria-labelledby="headingInsa" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header"><spring:message code="Employee"/>:</h6>
                        <a class="collapse-item" href="/cookieempListInsert?insertNo=5"><spring:message code="EmployeeRegistration"/></a>
                        <a class="collapse-item" href="/yoocookiedeptMove"><spring:message code="ChangeOfDepartmentAndPosition"/></a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header"><spring:message code="Department"/>:</h6>
                        <a class="collapse-item" href="/yoocookiedeptListInsert?insertNo=5&lang=${param.lang}"><spring:message code="RegistrationAndModificationOfDepartments"/></a>
                    </div>
                </div>
            </li>
            
            <!-- 재무관리 -->
            <li class="nav-item" id="jemuMenu">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseJemu"
                    aria-expanded="true" aria-controls="collapseJemu">
                    <i class="fas fa-fw fa-dollar-sign"></i>
                    <span><spring:message code="FinancialManagement"/></span>
                </a>
                <div id="collapseJemu" class="collapse" aria-labelledby="headingJemu" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header"><spring:message code="revenue"/><spring:message code="expenditure"/>:</h6>
                        <a class="collapse-item" href=""><spring:message code="record"/><spring:message code="modification"/><spring:message code="Delete"/></a>
                    </div>
                </div>
            </li>
            
            <!-- Heading -->
            <div class="sidebar-heading">
                <spring:message code="OrderingAndWarehousingAndForwardingManagement"/>
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fa-solid fa-phone"></i>
                    <span><spring:message code="OrderManagement"/></span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header"><spring:message code="OrderManagement"/>:</h6>
                        <a class="collapse-item" href="/orderList"><spring:message code="OrderList"/></a>     
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header"><spring:message code="CustomerManagement"/>:</h6>
                        <a class="collapse-item" href="/customerList"><spring:message code="CustomerList"/></a>                    
                        <h6 class="collapse-header"><spring:message code="SalesStatus"/>:</h6>
                        <a class="collapse-item" href="/prodt_sal_chart"><spring:message code="SalesStatusGraph"/></a>
                        <h6 class="collapse-header"><spring:message code="chat"/>:</h6>
                        <a class="collapse-item" href="/chatting"><spring:message code="chat"/></a>
                        <a class="collapse-item" href="/chat2"><spring:message code="chatList"/></a>
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Page2s Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePage2s"
                    aria-expanded="true" aria-controls="collapsePages">
                   <i class="fa-solid fa-truck-fast"></i>
                    <span><spring:message code="WarehousingAndForwardingManagement"/></span>
                </a>
                <div id="collapsePage2s" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header"><spring:message code="RawMaterialManagement"/>:</h6>
                        <a class="collapse-item" href="/materialList"><spring:message code="RawmMaterialList"/></a>
                        <a class="collapse-item" href="/material_mngList"><spring:message code="RawMaterialWarehousingAndForwardingRecordList"/></a>
                        <a class="collapse-item" href="/calendar"><spring:message code="WarehousingAndForwardingSchedule"/></a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header"><spring:message code="ProductManagement"/>:</h6>
                        <a class="collapse-item" href="/productList"><spring:message code="ProductList"/></a>
                        <a class="collapse-item" href="/prodt_mngList"><spring:message code="ProductWarehousingAndForwardingRecordList"/></a>
                       	<h6 class="collapse-header"><spring:message code="WarehousingAndForwardingSchedule"/>:</h6>
                       	 <a class="collapse-item" href="/calendar"><spring:message code="WarehousingAndForwardingSchedule"/></a>
                    </div>
                </div>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
            <!-- Heading -->
            <div class="sidebar-heading">
                <spring:message code="ProductionAndManufacturingManagement"/>
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsemake"
                    aria-expanded="true" aria-controls="collapsePages">
                   <i class="fa-solid fa-hammer"></i>
                    <span><spring:message code="ManufacturingManagement"/></span>
                </a>
                <div id="collapsemake" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header"><spring:message code="ProcessControl"/>:</h6>
                        <a class="collapse-item" href="/Prc01List"><spring:message code="ProcessControl"/></a>
                        <a class="collapse-item" href="/Prd_mng_prc01List"><spring:message code="ProcessControlDuringProduction"/></a>
                        <a class="collapse-item" href="/Prdct_mngmnList"><spring:message code="FinalProcessResults"/></a>     
                        <a class="collapse-item" href="/atnmngListVue"><spring:message code="AttendanceManagementSystem"/></a>     
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header"><spring:message code="WorkInstruction"/>:</h6>
                        <a class="collapse-item" href="/Work_orderList"><spring:message code="WorkInstruction"/></a>
                        <a class="collapse-item" href="/Invn_prdcList"><spring:message code="Invnprdction"/></a>
                        <a class="collapse-item" href="/yoon_boardList"><spring:message code="yoon_boardList"/></a>
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Page2s Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsequality"
                    aria-expanded="true" aria-controls="collapsePages">
                  <i class="fa-solid fa-mars-and-venus"></i>
                    <span><spring:message code="QualityControl"/></span>
                </a>
                <div id="collapsequality" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header"><spring:message code="MachineManagement"/>:</h6>
                        <a class="collapse-item" href="/Machine_managementList"><spring:message code="MachineManagement"/></a>
                        <a class="collapse-item" href="/Periodic_inspectionList"><spring:message code="regularMechanicalInspection"/></a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header"><spring:message code="DefectManagement"/>:</h6>
                        <a class="collapse-item" href="/Dfc_prd01List"><spring:message code="DefectListInProduction"/></a>
                        <a class="collapse-item" href="/Dfct_mngm01List"><spring:message code="DefectiveProcessingResults"/></a>
                        <a class="collapse-item" href="/Dfct_calendar"><spring:message code="CheckMonthlyDefect"/></a>
                        <a class="collapse-item" href="/Defect_typeList"><spring:message code="CheckDefectType"/></a>
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