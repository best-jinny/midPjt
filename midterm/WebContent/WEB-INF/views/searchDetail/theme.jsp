<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>DirectoryPlus+</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="DirectoryPlus template project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/midterm/styles/bootstrap-4.1.2/bootstrap.min.css">
<link href="/midterm/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/midterm/plugins/OwlCarousel2-2.3.4/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/midterm/plugins/OwlCarousel2-2.3.4/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/midterm/plugins/OwlCarousel2-2.3.4/animate.css">
<link rel="stylesheet" type="text/css" href="/midterm/styles/listings.css">
<link rel="stylesheet" type="text/css" href="/midterm/styles/responsive.css">
</head>
<body>
<!-- Menu -->
<c:set var="member_id" value="${sessionScope.member_id}" />
<c:if test="${empty member_id}">
	<jsp:include page="../main/loginHam.jsp"/>
</c:if>
<c:if test="${not empty member_id}">
	<jsp:include page="../main/mainHam.jsp"/>
</c:if>

<div class="super_container">
	<!-- Header -->
	<c:if test="${empty member_id}">
		<jsp:include page="../main/loginSearchMenu.jsp"/>
	</c:if>
	<c:if test="${not empty member_id}">
		<jsp:include page="../main/mainSearchMenu.jsp"/>
	</c:if>

	<div class="super_container_inner">	
		<div class="super_overlay"></div>
								
		<!-- Results -->
		<div class="results_container">
		
		<!-- Locations -->

		<div class="locations container_custom">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="section_title text-center"><h1>Cafe themes</h1></div>
						<div class="locations_container d-flex flex-row align-items-start justify-content-between flex-wrap">
							<c:set var="i" value="0"></c:set>
							<c:set var="loop_flag" value="false"></c:set>
							<c:set var="hashLength" value="${fn:length(hashKindList) }"></c:set>
							<c:forEach var="hashKind" items="${hashKindList }">
								<c:set var="i" value="${i+1 }"></c:set>
								<c:if test="${i==9 }">
									<c:set var="i" value="1"></c:set>
								</c:if>
								<c:if test="${i==hashLength+1 }">
									<c:set var="loop_flag" value="true"></c:set>
								</c:if>
								<c:if test="${not loop_flag }">
									<c:if test="${i%5!=0 }">
										<div class="location">
											<img src="/midterm/images/cafe${i }.jpg" alt="">
											<div class="location_title text-center"><div><a href="/midterm/search/search.do?subject=${hashKind.hashkind_name}">#${hashKind.hashkind_name}<div>Q</div></a></div></div>
										</div>
									</c:if>
									<c:if test="${i%5==0 }">
										</div></div></div>
										<div class="row"><div class="col">
										<div class="locations_container d-flex flex-row align-items-start justify-content-between flex-wrap">
										<div class="location">
											<img src="/midterm/images/cafe${i }.jpg" alt="">
											<div class="location_title text-center"><div><a href="/midterm/search/search.do?subject=${hashKind.hashkind_name}">#${hashKind.hashkind_name}<div>Q</div></a></div></div>
										</div>
									</c:if>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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