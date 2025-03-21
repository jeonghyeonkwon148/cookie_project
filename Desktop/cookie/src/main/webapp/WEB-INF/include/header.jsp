<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>header</title>
</head>
<body>
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
<%--
    <!-- Sidebar Toggle (Topbar) -->
    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
    </button>

    <!-- Topbar Search -->
    <form
        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
        <div class="input-group">
            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                aria-label="Search" aria-describedby="basic-addon2">
            <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                    <i class="fas fa-search fa-sm"></i>
                </button>
            </div>
        </div>
    </form>
    --%>
 	<div class="text-right">
		<select class="form-control" id="selectLan" name="lang">
			<option value=""><spring:message code="chlange"/></option>
			<option value="ko"><spring:message code="ko"/></option>
			<option value="en"><spring:message code="en"/></option>
			<option value="chinese"><spring:message code="Chinese"/></option>
		</select>
	</div>
    <!-- Topbar Navbar -->
    <ul class="navbar-nav ml-auto">
<%-- 
        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
        <li class="nav-item dropdown no-arrow d-sm-none">
            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
            </a>
            <!-- Dropdown - Messages -->
            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small"
                            placeholder="Search for..." aria-label="Search"
                            aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </li>
 		
        <!-- Nav Item - Alerts -->
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- Counter - Alerts -->
                <span class="badge badge-danger badge-counter">3+</span>
            </a>
            <!-- Dropdown - Alerts -->
            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                    Alerts Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                    <div class="mr-3">
                        <div class="icon-circle bg-primary">
                            <i class="fas fa-file-alt text-white"></i>
                        </div>
                    </div>
                    <div>
                        <div class="small text-gray-500">December 12, 2019</div>
                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                    </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                    <div class="mr-3">
                        <div class="icon-circle bg-success">
                            <i class="fas fa-donate text-white"></i>
                        </div>
                    </div>
                    <div>
                        <div class="small text-gray-500">December 7, 2019</div>
                        $290.29 has been deposited into your account!
                    </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                    <div class="mr-3">
                        <div class="icon-circle bg-warning">
                            <i class="fas fa-exclamation-triangle text-white"></i>
                        </div>
                    </div>
                    <div>
                        <div class="small text-gray-500">December 2, 2019</div>
                        Spending Alert: We've noticed unusually high spending for your account.
                    </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
            </div>
        </li>
 --%>
        <!-- Nav Item - Messages -->
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <!-- Counter - Messages -->
                <span class="badge badge-danger badge-counter" id="messageAlert"></span>
            </a>
            <!-- Dropdown - Messages -->
            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                aria-labelledby="messagesDropdown">
                <h6 class="dropdown-header" id="reMsgModalT">
                    받은 메세지
                </h6>

                <a class="dropdown-item text-center small text-gray-500" href="/yoocookiemessage?lang=${param.lang}">메세지 확인하러 가기</a>
            </div>
        </li>

        <div class="topbar-divider d-none d-sm-block"></div>

        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small" id="userInfoEname"></span>
                <img class="img-profile rounded-circle"
                    src="a00_com/img/undraw_profile.svg">
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                aria-labelledby="userDropdown">
                <a class="dropdown-item" href="/yoocookieempMyInfo?lang=${param.lang}">
                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                    내 사원정보
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    로그아웃
                </a>
            </div>
        </li>
    </ul>
</nav>
<script src="a00_com/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		getEmpData();
		$("#selectLan").val("${sessionScope.lang}").change(function(){
			let chVal = $(this).val()
			if(chVal!=''){
				upSession(chVal)
			}
			location.reload()
		})
		
		
		// 메세지 표시
		headerMessage(hdEmpno, "", 3, 4, 1);
		headerMessageCnt(hdEmpno);
		$(".modal").on('hide.bs.modal', function () {
			getEmpData();
			// 모달이 닫힐 때 메세지 개수 표시
			headerMessageCnt(hdEmpno);
		});
		
	});
	let hdEmpno = "${sessionScope.empno}"

   	function getEmpData() {
        $.ajax({
            url: "ajaxcookieempData",  
            type: "post",
            dataType: "json",
            success: function(emp) {
				if(emp.auth==1){job="사원"
				}else if(emp.auth==2){job="관리자"
				}else{job="시스템관리자"}
				
				$("#userInfoEname").text(emp.dname+"팀 "+emp.ename+" "+job);
				//console.log("사원번호 : "+emp.empno)
				//console.log("사원이름 : "+emp.ename)
				if(emp.empno==0){
					alert("로그인 후 이용 가능합니다")
					location.href="/cookielogin?lang=${param.lang}"
				}
            },
            error: function(error) {
                console.log("AJAX 요청 실패:"+error);
            }
        });
    }
	function logout(){
		$.ajax({
			url: "ajaxcookieempDataDel", // 세션데이터 삭제
            type: "post",
            success: function(msg) {
            	console.log(msg)
				location.href="/cookielogin?lang=${param.lang}"
            },
            error: function(error) {
                console.log("AJAX 요청 실패:"+error);
            }
		})
	}
	
	// 메세지 검색하는 ajax
	function headerMessage(empno, ename, sendOrRecieve, pageSize, curPage) {
		let nowDate = new Date(); // 현재 시간
		let nowDateS = nowDate.toISOString(); // 시간을 문자열 형태로 ("YYYY-MM-DDTHH:MI:SS.sssZ")
		let today = nowDateS.slice(0,10); // 앞에서부터 10글자 뽑아오기("YYYY-MM-DD")
		let msgDay = "";
		let hMsgHtml1 = "<a class=\"dropdown-item d-flex align-items-center\" href=\"";
    	let hMsgHtmlUrl = "/yoocookiemessage?insertNo=5&lang=${param.lang}&goMsg=";
    	let hMsgHtml2 = "\"><div class=\"dropdown-list-image mr-3\"><i class=\"fas fa-";
    	let hMsgHtmlIcon = "";
    	let hMsgHtml3 = " fa-3x text-gray-300 rounded-circle\"></i>";
        let hMsgHtml4 = "<div class=\"status-indicator";
        let hMsgMtmlRead = "";
        let hMsgHtml5 = "\"></div></div><div class=\"font-weight-bold\"><div class=\"text-truncate\">";
        let hMsgHtml6 = "</div><div class=\"small text-gray-500\">";
        let hMsgHtml7 = "</div></div></a>";
        //console.log(empno)
        //console.log(ename)
        //console.log(sendOrRecieve)
        //console.log(pageSize)
        //console.log(curPage)
		$.ajax({
			url : "/ajaxsearchMsgList",
			type : "post",
			data : "empno=" + empno + "&ename=" + ename
					+ "&sendOrRecieve=" + sendOrRecieve
					+"&pageSize=" + pageSize + "&curPage=" + curPage,
			dataType : "json",
			success : function(msgs) {
				let addHTML = "";
				let senddate = "";
				$(msgs).each(function(idx, msg) {
					if((msg.deptno/10)%5==1){
						hMsgHtmlIcon = "address-book"
					}else if((msg.deptno/10)%5==2){
						hMsgHtmlIcon = "cookie"
					}else if((msg.deptno/10)%5==3){
						hMsgHtmlIcon = "truck"
					}else if((msg.deptno/10)%5==4){
						hMsgHtmlIcon = "box"
					}else if((msg.deptno/10)%5==0){
						hMsgHtmlIcon = "ghost"
					}
					if(msg.senddte.slice(0,10)==today){
						msgDay = msg.senddte.slice(11,16);
					}else{
						msgDay = msg.senddte.slice(0,10);
					}
					if(msg.opauth==1){
						hMsgMtmlRead = " bg-success";
					}else{
						hMsgMtmlRead = "";
					}
					let fixMsg = msg.content.replace(/\\n/g, "\n");
					//senddate = msg.senddte.toISOString()
					addHTML += hMsgHtml1 + hMsgHtmlUrl + msg.mid
							+ hMsgHtml2 + hMsgHtmlIcon + hMsgHtml3 + hMsgHtml4
							+ hMsgMtmlRead + hMsgHtml5 + fixMsg + hMsgHtml6
							+ msg.ename + " · "+ msgDay + hMsgHtml7
				})
				//console.log(addHTML)
				$("#reMsgModalT").after(addHTML)
			},
			error : function(err) {
				console.log(err)
			}
		})
	}
	function headerMessageCnt(empno) {
		$.ajax({
			url : "/ajaxreadMessageCnt",
			type : "post",
			data : "reid=" + empno,
			success : function(cnt) {
				if(cnt!=0){
					$("#messageAlert").text(cnt)
				}
			},
			error : function(err) {
				console.log(err)
			}
		})
	}
	
	function upSession(lang){
		$.ajax({
			url : "ajaxcookieselectLang",
			type : "post",
			data : "lang=" + lang,
			success : function(msg) {
				console.log(msg)
			},
			error : function(err) {
				console.log(err)
			}
		})

	}
</script>
</body>
</html>