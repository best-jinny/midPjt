<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=c88afu0i41"></script>
<script src="/midterm/js/jquery.js"></script>
<script type="text/javascript">
	function initGoogleMap() {
		var map = new naver.maps.Map('map', {
		    center: new naver.maps.LatLng(${cafe.cafe_map }),
		    zoom: 15
		});
		var marker = new naver.maps.Marker( {
		    position: new naver.maps.LatLng(${cafe.cafe_map }),
		    map: map
		});	
	}
	function favorite(num) {
		var sendData = "member_id=${member_id}&cafe_id=" + num;
		$.post("../search/wish.do", sendData);
		return false;
	}
	
	function addHash() {
		if(!form.member_id.value){
			alert("로그인 후 이용해주세요");
			form.user_hash.value="";
		}else{
		var frm = document.form;
		frm.action = "/midterm/searchDetail/userHash.do";
		frm.submit();
		location.reload();
		}
	}
	
	
</script>
<title>상세페이지</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="DirectoryPlus template project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/midterm/styles/bootstrap-4.1.2/bootstrap.min.css">
<link href="/midterm/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/midterm/plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/midterm/styles/listing.css">
<link rel="stylesheet" type="text/css" href="/midterm/styles/listing_responsive.css">
<link rel="stylesheet" href="/midterm/styles/pretty-checkbox/dist/pretty-checkbox.min.css"/>
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

		<!-- Home -->

		<div class="home">
			<div class="container fill_height">
				<div class="row fill_height">
					<div class="col fill_height">
						<div class="listing_image">
							<div class="listing_background_image_left"><!-- 화면 상단 사진 3개 순서대로 왼쪽, 오른쪽, 중간  -->
								<div class="background_image" style="background-image:url(${list[4].img_path})"></div>
							</div>
							<div class="listing_background_image_right">
								<div class="background_image" style="background-image:url(${list[5].img_path})"></div>
							</div>
							<div class="listing_background_image_left1"><!-- 화면 상단 사진 3개 순서대로 왼쪽, 오른쪽, 중간  -->
								<div class="background_image" style="background-image:url(${list[0].img_path})"></div>
							</div>
							<div class="listing_background_image_right1">
								<div class="background_image" style="background-image:url(${list[1].img_path})"></div>
							</div>
							<%-- <div class="background_image" style="background-image:url(${list[0].img_path})"></div> --%>
						</div>
					</div>
				</div>
			</div>
			<div class="home_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="home_content">
								<div class="listing_title"><h1></h1></div>
								<div class="listing_info_container d-flex flex-lg-row flex-column align-items-start justify-content-start">
									<!-- <div class="listing_info d-flex flex-row align-items-center justify-content-start">
										<div class="listing_rating">4,5</div>
										<div class="listing_price">$$$</div>
										<div class="listing_type">Restaurant</div>
										<div class="listing_status">Closed</div>
									</div>-->
									<!--<div class="listin_info_options d-flex flex-row align-items-start justify-content-start ml-lg-auto">
										<div class="listing_info_button listing_info_button_1"><a href="#">+Add listing</a></div>
										<!--<div class="listing_info_button listing_info_button_2"><a href="#">Book a table</a></div>-->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Listing -->

	<div class="listing">
		<div class="container">
			<div class="row">
				
				<!-- Listing Content -->
				<div class="col-lg-8">
					<div class="listing_content"><!-- 카페 상세정보. 카페명, 아이콘(클릭시 위시추가), 이미지(슬라이드 만들어야함), 해시태그   -->
						<div class="section_title">
							<h1>${cafe.cafe_name }</h1>
							<c:if test="${not empty member_id}">
								<div class="pretty p-icon p-toggle p-plain">
							        <input type="checkbox" id="heartCheck" onclick="favorite('${cafe.cafe_id}')"/>
							        <c:set var="heart" value="false"></c:set>
						        	<c:if test="${not empty wishCafe }">
						        		<c:set var="heart" value="true"></c:set>
						        	</c:if>
							        <c:if test="${heart }">
							        	<div class="state p-off p-info-o">
							            	<i class="icon fa fa-heart"></i>
							            	<label>찜</label>
							        	</div>
							        	<div class="state p-on">
							            	<i class="icon fa fa-heart-o"></i>
							            	<label>찜</label>
							        	</div>
							        </c:if>
							        <c:if test="${ not heart }">
							        	<div class="state p-on p-info-o">
							            	<i class="icon fa fa-heart"></i>
							            	<label>찜</label>
							        	</div>
							        	<div class="state p-off">
							            	<i class="icon fa fa-heart-o "></i>
							            	<label>찜</label>
							        	</div>
							        </c:if>
						    	</div>
							</c:if>
						</div>
						<div class="listing_text">
							<p>${cafe.cafe_desc}
							</p><br>
						</div>

						<!-- Images_carousel  -->
						<div>
							<div id="demo" class="carousel slide" data-ride="carousel">

							<!-- Indicators -->
							  <ul class="carousel-indicators">
							    <li data-target="#demo" data-slide-to="0" class="active"></li>
							    <li data-target="#demo" data-slide-to="1"></li>
							    <li data-target="#demo" data-slide-to="2"></li>
							  </ul>
							  
							  <!-- The slideshow -->
							  <div class="carousel-inner">
							    <div class="carousel-item active">
							      <img src="${list[2].img_path}" alt="Los Angeles" width="1100" height="500">
							    </div>
							    <div class="carousel-item">
							      <img src="${list[3].img_path}" alt="Chicago" width="1100" height="500">
							    </div>
							    <div class="carousel-item">
							      <img src="${list[0].img_path}" alt="New York" width="1100" height="500">
							    </div>
							  </div>
							  
							  <!-- Left and right controls -->
							  <a class="carousel-control-prev" href="#demo" data-slide="prev">
							    <span class="carousel-control-prev-icon"></span>
							  </a>
							  <a class="carousel-control-next" href="#demo" data-slide="next">
							    <span class="carousel-control-next-icon"></span>
							  </a>
							</div>
							
													
							<!-- Accordion -->
							<div style="line-height:3.5em">
							<br>
							<c:forEach items="${hashList}" var="hashList"> <!-- 관리자 등록 해시 출력  -->
							<button type="button" class="btn btn-outline-secondary" onclick="location.href='/midterm/search/search.do?subject=${hashList.hash_name}'">#${hashList.hash_name}</button>
							</c:forEach> 
							<c:forEach items="${hashList_user}" var="hashList_user"> <!-- 유저 등록 해시 출력  -->
							<button type="button" class="btn btn-outline-danger" onclick="location.href='/midterm/search/search.do?subject=${hashList_user.hash_name}'">#${hashList_user.hash_name}</button>
							</c:forEach> 
								
							</div>

							<!-- Accordion -->
							<div >
								
								<form class="search_form" name="form" method="post" action="" style="padding-top:30px; padding-right:30px">
								<input type="hidden" value="${cafe.cafe_id}" name="cafe_id">
								<input type="hidden" value="${member_id}" name="member_id">
								<h4>#My Hashtag</h4>
								<div class="d-flex flex-sm-row flex-column align-items-sm-start align-items-center justify-content-sm-between">
								<input type="text" name="user_hash" id="user_hash" class="search_input" placeholder="나만의 해시태그를 추가해보세요" required="required">
								<button class="search_button" onclick='addHash()'>Add it!</button>
								</div>
								</form>
								
								
							</div>

						</div>

						<!-- Reviews -->
						<div class="reviews">
							<div></div>
							<div class="reviews_container"></div>
						</div>
					</div>
				</div>

				<!-- Listing Sidebar -->
				<div class="col-lg-4 sidebar_col">
					<div class="sidebar">
						
						<!-- Work Hours -->
						<div ></div>

						<!-- Info -->
						<div class="sidebar_info"><!-- 이미지 오른쪽에 카페 상세정보. 글씨색 적용 안되는 문제가 있음 -->
							<ul>
								<li class="d-flex flex-row align-items-start justify-content-start">
									<div class="sidebar_info_icon"><img src="/midterm/images/location.png" alt=""></div>
									<div class="sidebar_info_content"><span>주소: </span>${cafe.cafe_addr }</div>
								</li>
								<li class="d-flex flex-row align-items-start justify-content-start">
									<div class="sidebar_info_icon"><img src="/midterm/images/light-beer.png" alt=""></div>
									<div class="sidebar_info_content"><span>영업시간: </span>${cafe.cafe_hours }</div>
								</li>
								<li class="d-flex flex-row align-items-start justify-content-start">
									<div class="sidebar_info_icon"><img src="/midterm/images/tel.png" alt=""></div>
									<div class="sidebar_info_content"><span>전화번호: </span>${cafe.cafe_tel }</div>
								</li>
								<li class="d-flex flex-row align-items-start justify-content-start">
									<div class="sidebar_info_icon"><img src="/midterm/images/parking.png" alt=""></div>
									<div class="sidebar_info_content"><span>주차여부: </span>${cafe.cafe_parking }</div>
								</li>
							</ul>
						</div>

						<!-- Location -->
						<div class="location">
							<!-- Google Map --> <!-- 타이틀은 구글맵이지만 네이버 맵 호출.  -->
							<div class="map">
								<div id="google_map" class="google_map">
									<div class="map_container">
										<div id="map"></div>
									</div>
								</div>
							</div>
						</div>

						<!-- Similar Places -->
							<div class="similar_places">
								<div class="section_title">
								<h1>비슷한 분위기의 카페</h1></div>
								<div class="similar_places_container d-flex flex-lg-column flex-row align-items-start justify-content-between flex-wrap">
									<div>
							<div id="demo" class="carousel slide" data-ride="carousel">

														  
							  <!-- The slideshow -->
							  <div class="carousel-inner">
							  	
							    <div class="carousel-item active">
							      <img src="${s_list[1].img_path}" alt="Los Angeles" width="400" height="250">
							    </div>
							   
							     <div class="carousel-item">
							      <img src="${s_list[4].img_path}" alt="Chicago" width="400" height="250">
							    </div>
							    <div class="carousel-item">
							      <img src="${s_list[5].img_path}" alt="New York" width="400" height="250">
							    </div> 
							  </div>
							  
								<div class="similar_place_title"><a href="../searchDetail/cafeDetail.do?member_id=${member_id }&cafe_id=${s_Cafe.cafe_id }">"${s_Cafe.cafe_name }" 여기는 어떠세요?</a></div>							
									
									<%-- <!-- Similar Place -->
									 <div class="similar_place">
										<div class="similar_place_image">
											<img src="${s_list[1].img_path}" alt="">
										</div>
										<div class="similar_place_title"><a href="../searchDetail/cafeDetail.do?member_id=${member_id }&cafe_id=${s_Cafe.cafe_id }">"${s_Cafe.cafe_name }" 여기는 어떠세요?</a></div>
									</div>  --%>
									
									
								</div>
							</div>

					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="../main/footer.jsp"/>
</div>

<script src="/midterm/js/jquery-3.3.1.min.js"></script>
<script src="/midterm/styles/bootstrap-4.1.2/popper.js"></script>
<script src="/midterm/styles/bootstrap-4.1.2/bootstrap.min.js"></script>
<script src="/midterm/plugins/greensock/TweenMax.min.js"></script>
<script src="/midterm/plugins/greensock/TimelineMax.min.js"></script>
<script src="/midterm/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="/midterm/plugins/greensock/animation.gsap.min.js"></script>
<script src="/midterm/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="/midterm/plugins/easing/easing.js"></script>
<script src="/midterm/plugins/progressbar/progressbar.min.js"></script>
<script src="/midterm/plugins/parallax-js-master/parallax.min.js"></script>
<script src="/midterm/plugins/colorbox/jquery.colorbox-min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
<script src="/midterm/js/listing.js"></script>
</body>
</html>