<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>로그인</title>

    <!-- Custom fonts for this template-->
    <link href="a00_com/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="a00_com/css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">
            <div class="col-xl-5 col-lg-6 col-md-9 my-5">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="p-5">
			                        <div class="row">
			                            <div class="col-lg-8"></div>
			                            <div class="col-lg-4">
 											<form id="selectLanForm">
												<select class="form-control" id="selectLan" name="lang">
													<option value=""><spring:message code="chlange"/></option>
													<option value="ko"><spring:message code="ko"/></option>
													<option value="en"><spring:message code="en"/></option>
													<option value="chinese"><spring:message code="Chinese"/></option>
												</select>
											</form>
										</div>
									</div>
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4"><spring:message code="Login"/></h1>
                                    </div>
                                    <form class="user" method="post">
                                        <div class="form-group">
                                            <input type="text"  name="empno" class="form-control form-control-user"
                                                placeholder="<spring:message code='EnterEmployeeNumber'/>" pattern="[0-9]{4}" maxlength="4" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="pwd" class="form-control form-control-user"
                                                placeholder="<spring:message code='EnterPassword'/>" maxlength="15" required>
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-user btn-block">
                                            <spring:message code="Login"/>
                                        </button>
                                        <button type="button" class="btn btn-info btn-user btn-block"
                                        	data-toggle="modal" data-target="#updatePwdModal">
                                            비밀번호 변경요청
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    <div id="openModal" data-toggle="modal" data-target="#chgpwdModal">
    </div>
	<!-- 비밀번호 변경 권유 Modal-->
    <div class="modal fade" id="chgpwdModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">비밀번호를 변경하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close" onclick="goMain()">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">아직 비밀번호를 변경하시지 않으셨습니다. 비밀번호를 변경하시기 바랍니다.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal" onclick="goMain()">다음에 변경</button>
                    <a class="btn btn-primary" href="/yoochangePwd">지금 변경</a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 비밀번호를 잊었는지 묻는 Modal-->
    <div id="openUdtPwdlModal" data-toggle="modal" data-target="#updatePwdModal"></div>
	<div class="modal fade" id="updatePwdModal" tabindex="-1" role="dialog"
		aria-labelledby="updatePwdModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="updatePwdModalLabel">비밀번호 변경을 요청하시겠습니까?</h5>
					<button class="close" type="button" id="clsBtn" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<h6>수정을 원하시면 이름과 사원번호를 입력하세요</h6>
					<div class="form-group row">
						<div class="col-sm-3 mb-5 mb-sm-0">
							<input style="text-align: center;" type="text"
								class="form-control" value="이름" readonly>
						</div>
						<div class="col-sm-9">
							<input style="text-align: center;"
								class="form-control" id="ckEname">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-3 mb-5 mb-sm-0">
							<input style="text-align: center;" type="text"
								class="form-control" value="사원번호" readonly>
						</div>
						<div class="col-sm-9">
							<input style="text-align: center;"
								class="form-control" id="ckEmpno"
								pattern="[0-9]{4}" maxlength="4">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">아니오</button>
					<button class="btn btn-info" type="button" onclick="sendAskMsg()">수정</button>
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
		$(document).ready(function(){
			let ename="";
			let empno=0;
			getEmpData()
			
			// 다국어처리 이벤트
			$("#selectLan").val("${sessionScope.lang}").change(function(){
				let chVal = $(this).val()
				if(chVal!=''){
					upSession(chVal)
				}
				location.reload()
			})
			
			// 모달 닫힐 때 실행 jquery
			$("#chgpwdModal").on('hide.bs.modal', function () {
				location.href="/cookiemain"
			});
			
		})
		const msg = `${msg}`
		const pwdupt = `${pwdupt}`
		if(msg!=''){
			alert(msg)
			if(msg.indexOf('오세요')>=0){
				if(pwdupt==1){
					$("#openModal").click();
				}else{
					location.href="/cookiemain"
				}
			}else{
				$("[name=empno]").focus();
			}
		}
       	function login(){
			console.log("login() 작동")
       		$("form").submit();	
       	}
       	function goMain(){
			console.log("goMain() 작동")
       		location.href="/cookiemain"
       	}
       	function getEmpData() {
            $.ajax({
                url: "ajaxcookieempData",  // 사원 정보 가져오는 서블릿
                type: "post",
                dataType: "json",
                success: function(emp) {
					empno=emp.empno;
					ename=emp.ename;
					console.log("사원번호 : "+empno)
					console.log("사원이름 : "+ename)
                },
                error: function(error) {
                    console.log("AJAX 요청 실패:"+error);
                }
            });
        }
       	function sendAskMsg() {
       		let ckEname = $("#ckEname").val()
       		let ckEmpno = $("#ckEmpno").val()
       		if(ckEname!=""&&ckEname!=null
       				&&ckEmpno!=""&&ckEmpno!=null){
	            $.ajax({
	                url: "ajaxsendAskMessage",  
	                type: "post",
	                data: "ckEname="+ckEname+"&ckEmpno="+ckEmpno,
	                success: function(msg) {
	                	alert(msg)
	                	$("#clsBtn").click()
	                },
	                error: function(error) {
	                    console.log("AJAX 요청 실패:"+error);
	                }
	            });
       		}
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
	<%--
	if(session.getAttribute("sesEmp")!=""||session.getAttribute("sesEmp")!=null){
		session.removeAttribute("sesEmp");
	}
	--%>

</body>

</html>