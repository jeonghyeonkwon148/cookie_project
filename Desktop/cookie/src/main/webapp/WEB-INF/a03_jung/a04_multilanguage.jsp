 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<style type="text/css">
.input-group-text {
	width: 100%;
	background-color: linen;
	color: black;
	font-weight: bolder;
}

.input-group-prepend {
	width: 20%;
}

#chatArea {
	width: 80%;
	height: 200px;
	overflow-y: auto;
	text-align: left;
	border: 1px solid green;
}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script
	src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 이전화면에서 요청한 내용을 선택하게 하여, 선택할 때 마다 언어를 변경 처리 전달..
		$("#selectLan").val("${param.lang}").change(function(){
			var chVal = $(this).val()
			if(chVal!=''){
				location.href="/multilang?lang="+chVal
			}
		})
		
	});
</script>
</head>

<body>
	<h2>안녕하세요</h2>
	<div class="jumbotron text-center">
		<h2>
			<spring:message code="multilang" />
		</h2>
		<h3>
			<spring:message code="welcome" />
		</h3>
		<h3>
			<spring:message code="greet" />
		</h3>
		<h3>
			<spring:message code="regmem" />
		</h3>
	</div>
	<%--
 --%>
	<div class="container">
		<div class="text-right">
			<select class="form-control" id="selectLan">
				<option value=""><spring:message code="chlange" /></option>
				<option value="ko"><spring:message code="ko" /></option>
				<option value="en"><spring:message code="en" /></option>
			</select>
		</div>
		<form method="post">
			<div class="input-group mb-3">
				<div class="input-group-prepend ">
					<span class="input-group-text  justify-content-center"> <spring:message
							code="id" /></span>
				</div>
				<input name="id" class="form-control" value="" />
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend ">
					<span class="input-group-text  justify-content-center"> <spring:message
							code="pwd" />
					</span>
				</div>
				<input name="pwd" type="password" class="form-control" value="" />
			</div>
			<div style="text-align: right;">
				<input type="button" class="btn btn-primary"
					value='<spring:message code="reg"/>' id="uptBtn" />
			</div>
		</form>
	</div>
	
</body>
</html>