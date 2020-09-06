<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>Search Result</title>
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
<link rel="stylesheet" type="text/css" href="/midterm/styles/listings_responsive.css">
<link rel="stylesheet" href="/midterm/styles/pretty-checkbox/dist/pretty-checkbox.min.css"/>
<style type="text/css">
	.testimonial_text {text-overflow:ellipsis; overflow:hidden; white-space:nowrap; }
</style>
<script src="/midterm/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		var result = "${result}";
		if (!result)	{
			var sendSearchData = "subject=${subject}";
			$.post("/midterm/search/noSearch.do",sendSearchData,function(data) {
				$('#noSearchResult').html(data);
			});
			// $('#searchResult').load("/midterm/search/noSearch.do",sendSearchData);
		}
	})
	function favorite(num) {
		var sendData = "member_id=${member_id}&cafe_id=" + num;
		$.post("wish.do", sendData);
		return false;
	}
	function reorder() {
		var sendSearchDataReload = "order="+orderForm.order.value+"&result=${result}&subject=${subject}&member_id=${member_id}";
		$('#searchResult').load("/midterm/search/searchResult.do",sendSearchDataReload);
	}
</script>
</head>
<body>
<!-- Menu -->
<c:set var="member_id" value="${sessionScope.member_id}" />
<c:if test="${empty member_id}">
	<jsp:include page="/WEB-INF/views/main/loginHam.jsp"/>
</c:if>
<c:if test="${not empty member_id}">
	<jsp:include page="/WEB-INF/views/main/mainHam.jsp"/>
</c:if>

<div class="super_container">
	<!-- Header -->
	<c:if test="${empty member_id}">
		<jsp:include page="/WEB-INF/views/main/loginSearchMenu.jsp"/>
	</c:if>
	<c:if test="${not empty member_id}">
		<jsp:include page="/WEB-INF/views/main/mainSearchMenu.jsp"/>
	</c:if>

	<div class="super_container_inner">	
		<div class="super_overlay"></div>
		
		<div id="noSearchResult">
		<!-- Listings -->
		<div class="listings container_custom">
		
			<!-- Search Result Display -->
			<div id="searchResult">
				<div class="container">
					<div class="row">
						
						<!-- Listings Content -->
						<div class="col-xl-6">
							<div class="listings_content">
								<!-- Listing Filter -->
								<div class="listing_filter">
									<div class="section_title"><h1>Filter by tags </h1></div>
									<div class="listing_filter_container d-flex flex-row align-items-start justify-content-start flex-wrap">
										
										<!-- Listing Checkbox -->
										<c:forEach var="hashtag" items="${topHash }">
											<div class="listing_checkbox">
												<label>${hashtag }
													<input type="checkbox" data-filter=".${hashtag }">
													<span class="checkmark"></span>
												</label>
											</div>
										</c:forEach>
								
									</div>
								</div>	
								<!-- Results -->
								<div class="results_container">
									<div class="section_title"><h1>${subject}<span>에 관한 검색 결과</span></h1>
									<form name=orderForm>
										<select name="order">
											<option value="rel">관련도순</option>
											<option value="new">신상순</option>
											<option value="hot">인기순</option>
										</select>
										<input type="button" value="결과 순서" onclick="reorder()">
									</form>
									</div>
									<div class="results grid">
										<!-- Result Item -->
										<c:forEach var="cafe" items="${cafeList }">
										<c:set var="cafeImg" value="${cafe_image[cafe.cafe_id] }"></c:set>
											<div class="grid-item result ${cafe_filter[cafe.cafe_id]}">
												<div class="listing">
													<div class="listing_image">
														<div class="listing_icon"><a href="listing.html"><img src="/midterm/images/loc.png" alt=""></a></div>
														<img src="${cafeImg }" alt="" onclick="location.href='/midterm/searchDetail/cafeDetail.do?member_id=${member_id }&cafe_id=${cafe.cafe_id }'">
													</div>
													<div class="listing_title_container">
														<div class="listing_title"><a href="../searchDetail/cafeDetail.do?member_id=${member_id }&cafe_id=${cafe.cafe_id }">${cafe.cafe_name }</a></div>
														<div class="listing_info d-flex flex-row align-items-center justify-content-between">
															<c:forEach var="cafehash" items="${cafe_hash }">
																<c:if test="${cafehash.key==cafe.cafe_id }">
																<div class="listing_divider">|</div>
																	<c:forEach var="hashtag" items="${cafehash.value }">
																		<div class="listing_type"><a href="search.do?subject=${hashtag }">#${hashtag}</a></div>
																		<div class="listing_divider">|</div>
																	</c:forEach>
																</c:if>
															</c:forEach>
														</div>
														<div class="listing_info d-flex flex-row align-items-center justify-content-between">
															<c:if test="${not empty member_id}">
																<div class="pretty p-icon p-toggle p-plain">
															        <input type="checkbox" id="heartCheck" onclick="favorite('${cafe.cafe_id}')"/>
															        <c:set var="heart" value="false"></c:set>
															        <c:forEach var="wish" items="${wishCafe }">
															        	<c:if test="${wish==cafe.cafe_id }">
															        		<c:set var="heart" value="true"></c:set>
															        	</c:if>
															        </c:forEach>
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
															<div class="listing_type">${cafe.cafe_addr }</div>
														</div>
													</div>
													<div class="listing_testimonial">
														<div class="d-flex flex-row align-items-center justify-content-start">
															<div class="testimonial_text">
																${cafe.cafe_desc }
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
		
						<!-- Listings Map -->
						<div class="col-xl-6">
							<div class="listings_map">
		
								<div class="map">
									<div class="map_container">
										<div id="map"></div>
										<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=38d9353399b484489e3ca9a3d0e2c0b7"></script>
										<script>
										var coordComb = "${mapCoords[0]}";
										var coord1 = coordComb.slice(0,coordComb.indexOf(","));
										var coord2 = coordComb.slice(coordComb.indexOf(",")+1,coordComb.length);
										var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
										    mapOption = { 
										        center: new kakao.maps.LatLng(coord1,coord2), // 지도의 중심좌표
										        level: 3 // 지도의 확대 레벨
										    };
										
										var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
										// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
										var mapTypeControl = new kakao.maps.MapTypeControl();
										 
										// 마커를 표시할 위치와 title 객체 배열입니다 
										var positions = [];
										var titles = new Array();
										var contents = new Array();
										<c:forEach items="${cafeList}" var="cafe">
											titles.push("${cafe.cafe_name}");
											contents.push("${cafe.cafe_id}");
										</c:forEach>
										var latLngs = new Array();
										<c:forEach items="${mapCoords}" var="map">
											latLngs.push("${map}");
										</c:forEach>
										for (var i=0;i<titles.length;i++) {
											coordComb = latLngs[i]+"";
											coord1 = coordComb.slice(0,coordComb.indexOf(","));
											coord2 = coordComb.slice(coordComb.indexOf(",")+1,coordComb.length);
											positions.push({title:titles[i],latlng:new kakao.maps.LatLng(coord1,coord2),content:contents[i]});
										}
										
										// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
										var bounds = new kakao.maps.LatLngBounds();    
		
										// 마커 이미지의 이미지 주소입니다
										var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
										    
										for (var i = 0; i < positions.length; i ++) {
										    
										    // 마커 이미지의 이미지 크기 입니다
										    var imageSize = new kakao.maps.Size(24, 35); 
										    
										    // 마커 이미지를 생성합니다    
										    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
										    
										    // 마커를 생성합니다
										    var marker = new kakao.maps.Marker({
										        map: map, // 마커를 표시할 지도
										        position: positions[i].latlng, // 마커를 표시할 위치
										        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
										        content : positions[i].content,
										        image : markerImage, // 마커 이미지 
										        clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
										    });
										    marker.setMap(map);
										    
										 	// LatLngBounds 객체에 좌표를 추가합니다
									     	bounds.extend(positions[i].latlng);
										}
										
										// 마커에 클릭이벤트를 등록합니다
										kakao.maps.event.addListener(marker, 'click', function() {
											alert(marker);
										    window.location.href='/midterm/searchDetail/cafeDetail.do?member_id=${member_id }&cafe_id='+marker.title;
										});
										
									    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
									    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
									    map.setBounds(bounds);
										
										// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
										// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
										map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
										// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
										var zoomControl = new kakao.maps.ZoomControl();
										map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
										</script>
									</div>
								</div>
								
							</div>
						</div>
		
					</div>
				</div>
			</div>
		</div>
		</div>
		<!-- Footer -->
		<jsp:include page="/WEB-INF/views/main/footer.jsp"/>
	</div>
</div>
<script src="/midterm/styles/bootstrap-4.1.2/popper.js"></script>
<script src="/midterm/styles/bootstrap-4.1.2/bootstrap.min.js"></script>
<script src="/midterm/plugins/greensock/TweenMax.min.js"></script>
<script src="/midterm/plugins/greensock/TimelineMax.min.js"></script>
<script src="/midterm/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="/midterm/plugins/greensock/animation.gsap.min.js"></script>
<script src="/midterm/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="/midterm/plugins/OwlCarousel2-2.3.4/owl.carousel.js"></script>
<script src="/midterm/plugins/easing/easing.js"></script>
<script src="/midterm/plugins/progressbar/progressbar.min.js"></script>
<script src="/midterm/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="/midterm/plugins/parallax-js-master/parallax.min.js"></script>
<script src="/midterm/js/listings.js"></script>		
</body>
</html>