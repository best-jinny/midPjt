<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>cafe_admin</title>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	<link rel="stylesheet" type="text/css" href="/midterm/styles/css/util.css">
	<link rel="stylesheet" type="text/css" href="/midterm/styles/css/main.css">
<!--===============================================================================================-->
</head>
<body>
<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100 p-t-1000 p-b-30">
			<div class="text-left p-t-15 p-b-30">
				<span class="txt1">
					SPILL
				</span>
			</div>
			<br>
			<div class="container-login100-form-btn">
				<button onclick ="location.href='/midterm/admin/memberList.do'"class="login100-form-btn" >
					회원관리
				</button>
			</div>
			<br>
			<div class="container-login100-form-btn">
				<button onclick="location.href='/midterm/admin/cafeUpdateMain.do'"class="login100-form-btn">
					카페관리
				</button>
			</div>
			<br>
			<div class="container-login100-form-btn">
				<button onclick="location.href='/midterm/admin/hashMain.do'"class="login100-form-btn">
					해시태그관리
				</button>
			</div>
			<br>
			<div class="container-login100-form-btn">
				<button onclick="location.href='/midterm/login/logout.do'"class="login100-form-btn">
					로그아웃
				</button>
			</div>
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
	<script src="/midterm/js/main.js"></script>

</body>
</html>
