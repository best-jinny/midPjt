<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Login V14</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/midterm/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/midterm/styles/bootstrap-4.1.2/bootstrap.min.css">
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
	<link rel="stylesheet" type="text/css" href="/midterm/styles/css/utilLogin.css">
	<link rel="stylesheet" type="text/css" href="/midterm/styles/css/mainLogin.css">
<!--===============================================================================================-->
</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
					<p align="right" >
						<a href="/midterm/main/main.do">
					 		메인페이지
						</a>
					</p>	
				<form action="/midterm/login/login.do" class="login100-form validate-form flex-sb flex-w">
					

					<span class="login100-form-title p-b-32">
						로그인
					</span>

					<span class="txt1 p-b-11">
						아이디
					</span>
					<div class="wrap-input100 validate-input m-b-36" data-validate = "Username is required">
						<input class="input100" type="text" name="member_id" >
						<span class="focus-input100"></span>
					</div>
					
					<span class="txt1 p-b-11">
						비밀번호
					</span>
					<div class="wrap-input100 validate-input m-b-12" data-validate = "Password is required">
						<span class="btn-show-pass">
							<i class="fa fa-eye"></i>
						</span>
						<input class="input100" type="password" name="member_password" >
						<span class="focus-input100"></span>
					</div>
						<div>
							<a href="/midterm/mypage/joinForm.do">
								 회원가입
							</a>
						</div>
						
					
					
					<div class="right-login100-form-btn">
						<button class="login100-form-btn" >
							확인
						</button>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	<div id="dropDownSelect1"></div>
	
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