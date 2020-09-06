<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cafe Add Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/midterm/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/midterm/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/midterm/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/midterm/plugins/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/midterm/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/midterm/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/midterm/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/midterm/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/midterm/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/midterm/styles/css/util1.css">
	<link rel="stylesheet" type="text/css" href="/midterm/styles/css/main1.css">
<!--===============================================================================================-->
<style type="text/css">
	.button-hash {
		font-family: Oswald-Medium;
		font-size: 16px;
		color: #000000;
		line-height: 1.2;
		display: -webkit-box;
		display: -webkit-flex;
		display: -moz-box;
		display: -ms-flexbox;
		display: inline-block;
		justify-content: center;
		align-items: center;
		width: auto;
		height: 30px;
		border-radius: 10px;
	}
	.button-hash:hover {
	 	color: #fff;
	 	background-color: red;
	}
</style>
<script src="/midterm/js/jquery.js"></script>
<script type="text/javascript">
	var formId;
	window.onload = function() {
		formId = document.getElementById("frmId");
		formId.hashOriginalList.value="";
		formId.hashNewList.value="";
	}
	$(function() {
		$('#hashtagSearch').keyup(function(){
			var subject = formId.hashtagSearch.value;
			var sendData = "subject="+subject;
			$('#hashtagSearchResult').load("/midterm/search/searchHash.do", sendData);
		});
		$('#hashkind_name').keyup(function(){
			var subjectKind = formId.hashkind_name.value;
			var sendKindData = "subject="+subjectKind;
			$('#warningText').load("/midterm/search/checkHashKind.do", sendKindData);
		});
	});
	function chk() {
		if ($('h6').is('.redtext')) {
			alert("이미 등록되어 있는 해시그룹입니다. 등록할 해시그룹이름을 바꿔주세요.");
			formId.hashkind_name.value == "";
			formId.hashkind_name.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-100 p-r-100 p-t-85 p-b-100">
			<form action="/midterm/admin/hashKindInsert.do" method="post" name="frm" id="frmId" onsubmit="return chk();">
				<input type="hidden" name="hashOriginalList">
				<input type="hidden" name="hashNewList">
				<span class="login100-form-title p-b-32">
					해시그룹등록
				</span>
				<span class="txt1 p-b-11">
					해시그룹 이름 (필수)
				</span>
				<div class="wrap-input100 validate-input m-b-13" data-validate = "Username is required">
					<input class="input100" type="text" name="hashkind_name" id="hashkind_name" required="required" autofocus="autofocus">
					<span class="focus-input100"></span>
					<div id="warningText"></div>
				</div>
				<br>
				<span class="txt1 p-b-11">
					추가할 해시태그 목록 <input type="button" value="목록비우기" onclick="emptyHashList()">
				</span>
				<div class="wrap-input100 validate-input m-b-20" data-validate = "Username is required">
					<div id="hashtagList"></div>
				</div>
				<span class="txt1 p-b-11">
					해시그룹에 속할 해시태그 추가 
				</span>
				<div class="wrap-input100 validate-input m-b-20" data-validate = "Username is required">
					<input class="input100" type="text" name="hashtagSearch" id="hashtagSearch" placeholder="추가하고 싶은 해시태그를 검색해주세요">
					<span class="focus-input100"></span>
				</div>
				<div id="hashtagSearchResult"></div>
				<hr>
				<div class="container-login100-form-btn">
					<input type="submit" value="해시그룹등록" class="login100-form-btn">
				</div>
				<br>
				<div class="container-login100-form-btn">
					<input type="reset" value="다시작성" class="login100-form-btn">
				</div>
			</form>
			</div>
		</div>
	</div>

<!--===============================================================================================-->
	<script src="/midterm/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/midterm/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/midterm/vendor/bootstrap/js/popper.js"></script>
	<script src="/midterm/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/midterm/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/midterm/vendor/daterangepicker/moment.min.js"></script>
	<script src="/midterm/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/midterm/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="/midterm/js/main1.js"></script>

</body>
</html>