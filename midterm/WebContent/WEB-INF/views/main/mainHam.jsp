<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function member_logOut() {
		if(confirm('정말로 로그아웃 하시겠습니까?')){
			location.href='/midterm/login/logout.do';
		}else{
			location.href='/midterm/mypage/main.do';
		}
	}
</script>
</head>
<body>
<!-- Menu -->
<div class="menu">
	<div class="menu_container text-right">
		<div class="menu_close">close</div>
		<nav class="menu_nav">
			<ul>
				<li><a href="/midterm/main/main.do">Home</a></li>
				<li><a href="/midterm/mypage/main.do">My page</a></li>
				<li><a href="/midterm/mypage/wishList.do?member_id=${member_id}">Favorites</a></li>
				<li><a href="" onclick="javascript:member_logOut();">로그아웃</a></li>
			</ul>
		</nav>
	</div>
</div>
</body>
</html>