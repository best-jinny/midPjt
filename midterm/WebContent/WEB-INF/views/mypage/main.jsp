<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>

	<title>Login V14</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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

<script type="text/javascript">

</script>
</head>
<script type="text/javascript">
function member_delete(){

	if(confirm('정말로 탈퇴 하시겠습니까?')){
	location.href='/midterm/mypage/delete.do';
	}else{
	location.href='/midterm/mypage/main.do';
	}
};

function member_logOut(){

	if(confirm('정말로 로그아웃 하시겠습니까?')){
	location.href='/midterm/login/logout.do';
	}else{
	location.href='/midterm/mypage/main.do';
	}
};
</script>
<body>
		
	
	<div class="container-login100" >
		<div class="wrap-login100 p-l-200 p-r-85 p-t-55 p-b-55" >	
			<span class="login100-form-title p-b-32">
				마이페이지
			</span>
			<div class="container-login100-form-btn">
				<button onclick="location.href='/midterm/main/main.do'" class="login100-form-btn">
					메인페이지
				</button>
				<br><br><br><br><br>
			</div>
			<div class="container-login100-form-btn">
				<button onclick="location.href='wishList.do?member_id=${member_id}'" class="login100-form-btn">
					Favorites ♥
				</button>
				<br><br><br><br><br>
			</div>
			
			<div class="container-login100-form-btn">
				<button onclick="location.href='modifyForm.do'" class="login100-form-btn" name=deleteConfirm>
					회원정보 수정
				</button>
				<br><br><br><br><br>
			</div>
			<div class="container-login100-form-btn">
				<button onclick="javascript:member_delete();" class="login100-form-btn">
					회원탈퇴 
				</button>
				<br><br><br><br><br>
			</div>
			<div class="container-login100-form-btn">
				<button onclick="javascript:member_logOut();"  class="login100-form-btn" >
					로그아웃 
				</button>
				<br><br><br>
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