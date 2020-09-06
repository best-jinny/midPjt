<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>SpilltheTea</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="DirectoryPlus template project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/midterm/styles/bootstrap-4.1.2/bootstrap.min.css">
<link href="/midterm/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/midterm/plugins/OwlCarousel2-2.3.4/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/midterm/plugins/OwlCarousel2-2.3.4/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/midterm/plugins/OwlCarousel2-2.3.4/animate.css">
<link rel="stylesheet" type="text/css" href="/midterm/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="/midterm/styles/responsive.css">
</head>
<body>

<!-- Menu -->
<c:set var="member_id" value="${sessionScope.member_id}" />
<c:if test="${empty member_id}">
	<jsp:include page="loginHam.jsp"/>
</c:if>
<c:if test="${not empty member_id}">
	<jsp:include page="mainHam.jsp"/>
</c:if>

<div class="super_container">

	<!-- Header -->
	<c:if test="${empty member_id}">
		<jsp:include page="loginMenu.jsp"/>
	</c:if>
	<c:if test="${not empty member_id}">
		<jsp:include page="mainMenu.jsp"/>
	</c:if>

	<div class="super_container_inner">
		<div class="super_overlay"></div>
		<!-- Home -->
		<div class="home">
			<div class="owl-carousel owl-theme home_slider">	
				<!-- Slide -->
				<div class="slide">
					<div class="background_image" style="background-image:url(/midterm/images/cafe_stock_f.svg)"></div>
					<div class="home_container">
						<div class="container">
							<div class="row">
								<div class="col-xl-8 offset-xl-2">
									<div class="home_content text-center">
										<div class="home_title"><h1 class="invisible">S P I L L</h1></div>
										<jsp:include page="../search/searchBar.jsp"/>
									</div>
								</div>
							</div>					
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="tabs.jsp"/>
		<jsp:include page="footer.jsp"/>
	</div>	
</div>

<script src="/midterm/js/jquery-3.3.1.min.js"></script>
<script src="/midterm/styles/bootstrap-4.1.2/popper.js"></script>
<script src="/midterm/styles/bootstrap-4.1.2/bootstrap.min.js"></script>
<script src="/midterm/plugins/greensock/TweenMax.min.js"></script>
<script src="/midterm/plugins/greensock/TimelineMax.min.js"></script>
<script src="/midterm/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="/midterm/plugins/greensock/animation.gsap.min.js"></script>
<script src="/midterm/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="/midterm/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="/midterm/plugins/OwlCarousel2-2.3.4/owl.carousel.js"></script>
<script src="/midterm/plugins/easing/easing.js"></script>
<script src="/midterm/plugins/progressbar/progressbar.min.js"></script>
<script src="/midterm/plugins/parallax-js-master/parallax.min.js"></script>
<script src="/midterm/js/custom.js"></script>
</body>
</html>