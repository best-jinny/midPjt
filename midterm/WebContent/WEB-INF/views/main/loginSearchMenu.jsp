<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Header -->
<header class="header">
	<div class="header_overlay"></div>
	<div class="header_content d-flex flex-row align-items-center justify-content-start">
		
		<!-- Logo -->
		<div class="logo"><a href="../main/main.do">Spill<span>the</span><span>tea</span></a></div>

		<!-- Header Nav -->
		<div class="header_right d-flex flex-row align-items-center justify-content-start ml-auto">
			<nav class="main_nav">
				<ul class="d-flex flex-row align-items-center justify-content-start">
					<li><!-- Listing Search -->
					<div class="listing_search_container">
						<form action="/midterm/search/search.do" class="search_form" id="search_form">
							<div class="d-flex flex-md-row flex-column align-items-start justify-content-start">
								<div>
									<input type="text" name="subject" class="search_input" value="${subject }" required="required">
									<button class="search_button">Spill It!</button>
								</div>
							</div>
						</form>
					</div></li>
				</ul>
			</nav>
			<div class="log_reg">
				<ul class="d-flex flex-row align-items-center justify-content-start">
					<li><a href="../login/loginForm.do">Login</a></li>
				</ul>
			</div>
			<div class="hamburger">
				<i class="fa fa-bars trans_200"></i>
			</div>
		</div>
	</div>
</header>
</body>
</html>