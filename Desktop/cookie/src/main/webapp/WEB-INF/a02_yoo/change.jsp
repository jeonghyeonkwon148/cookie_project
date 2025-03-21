<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>비밀번호 변경</title>

    <!-- Custom fonts for this template-->
    <link href="a00_com/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="a00_com/css/sb-admin-2.min.css" rel="stylesheet">

<style type="text/css">
 span#notSame{
 	visibility: hidden;
 	color: red;
 	font-size: 12px;
 }
</style>
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
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">비밀번호 변경</h1>
                                    </div>
                                    <form class="user" id="chgPwdForm" method="post">
                                        	<span id="notSame">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;두 비밀번호가 같지 않습니다</span>
                                        <div class="form-group">
                                            <input type="password" id="pwd" name="chgPwd" class="form-control form-control-user"
                                                placeholder="비밀번호를 입력하세요" maxlength="15" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" id="pwdChk" class="form-control form-control-user"
                                                placeholder="다시 비밀번호를 입력하세요" maxlength="15" required>
                                        </div>
                                        <button type="button" id="chgPwd" class="btn btn-primary btn-user btn-block">
                                            변경
                                        </button>
                                        <button type="button" id="notChgPwd" class="btn btn-info btn-user btn-block">
                                            나중에 변경하고 메인페이지로 이동
                                        </button>
                                            <input type="hidden" name="empno" id="hiddenEmpno">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
	<!-- 비밀번호 변경 Modal-->
    <div id="openChgPwdModal" data-toggle="modal" data-target="#chgpwdModal">
    </div>
    <div class="modal fade" id="chgpwdModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">비밀번호를 변경하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">비밀번호가 변경됩니다</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <button class="btn btn-primary" type="button" onclick="formSbm()">변경</button>
                </div>
            </div>
        </div>
    </div>
	<!-- 나중에 비밀번호 변경 Modal-->
    <div id="openNotChgPwdModal" data-toggle="modal" data-target="#notChgpwdModal">
    </div>
    <div class="modal fade" id="notChgpwdModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">메인페이지로 이동하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">아직 비밀번호를 변경하시지 않으셨습니다. 나중에 비밀번호를 바꾸고 메인페이지로 이동하시겠습니까?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
                    <button class="btn btn-primary" type="button" onclick="goMain()">예</button>
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
			getEmpData();
			const msg=`${msg}`
			if(msg!=""){
				alert(msg)
				if(msg.indexOf("변경")>0){
					goMain();
				}
			}
		})
       	$("#chgPwd").click(function(){
       		let pwd = $("#pwd").val()
			let pwdChk = $("#pwdChk").val()
			if(pwd==pwdChk){
				$("#openChgPwdModal").click();
			}else{
				alert("입력하신 두 비밀번호가 다릅니다.")
			}
       	})
       	$("#notChgPwd").click(function(){
			$("#openNotChgPwdModal").click();
       	})
       	// 비밀번호란 두개가 같은지 체크
       	$("#pwd").blur(function(){
       		let pwd = $("#pwd").val()
			let pwdChk = $("#pwdChk").val()
			if(pwdChk!=""&&pwdChk!=null){chkPwdSame()}
       	})
       	$("#pwdChk").blur(function(){chkPwdSame()})
       	function chkPwdSame(){
			let pwd = $("#pwd").val()
			console.log(pwd)
			let pwdChk = $("#pwdChk").val()
			console.log(pwdChk)
			if(pwd==pwdChk){
				$("#notSame").css("visibility","hidden")
			}else{
				$("#notSame").css("visibility","visible")
			}
		}
		
       	function goMain(){
			location.href="/cookiemain"
       	}
		function formSbm(){
			$('#chgPwdForm').submit();
			console.log("formSbm 작동")
		}
       	function getEmpData() {
            $.ajax({
                url: "ajaxcookieempData",  
                type: "post",
                dataType: "json",
                success: function(emp) {
					empno=emp.empno;
					ename=emp.ename;
					console.log("사원번호 : "+empno)
					console.log("사원이름 : "+ename)
					$("#hiddenEmpno").val(empno);
                },
                error: function(error) {
                    console.log("AJAX 요청 실패:"+error);
                }
            });
        }
	</script>

</body>

</html>