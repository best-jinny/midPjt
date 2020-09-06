<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	var formId;
	window.onload = function() {
		formId = document.getElementById("frmId");
		formId.fileNum.value = 1;
		formId.hashOriginalList.value="";
		formId.hashNewList.value="";
	}
	function addImage() {
		formId.fileNum.value=formId.fileNum.value*1+1;
		var str1 = '<span class="txt1 p-b-11">카페이미지</span>'
		+'<div class="wrap-input100 validate-input m-b-20" data-validate = "Username is required">'
		+'<input class="input20" type="file" name="file';
		var str2 = '"><span class="focus-input100"></span></div>';
		var str = str1+formId.fileNum.value+str2;
		$('#imageLoad').after(str);	
	}
	function deleteImg(img_id,cafe_id) {
		var sendData = "img_id="+img_id+"&cafe_id="+cafe_id;
		$('#reloadArea').load("/midterm/admin/imageDelete.do",sendData);
	}
	$(function() {
		$('#hashtagSearch').keyup(function(){
			var subject = formId.hashtagSearch.value;
			var sendData = "subject="+subject;
			$('#hashtagSearchResult').load("/midterm/search/searchHash.do", sendData);
		});
	});
	function hashDeleteActualOriginal(hash_id,hash_name) {
		$('#'+hash_name).empty();
		var sendData = "hash_id="+hash_id+"&cafe_id=${cafe.cafe_id}";
		$.post("/midterm/admin/cafeLinkDelete.do", sendData);
		return false;
	}
</script>
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-100 p-r-100 p-t-85 p-b-100">
			<form action="/midterm/admin/cafeUpdate.do" method="post" enctype="multipart/form-data" name="frm" id="frmId">
				<input type=hidden name="cafe_id" value="${cafe.cafe_id}">
				<input type="hidden" name="fileNum">
				<input type="hidden" name="hashOriginalList">
				<input type="hidden" name="hashNewList">
				<span class="login100-form-title p-b-32">
					카페정보수정
				</span>
				<span class="txt1 p-b-11">
					카페이름
				</span>
				<div class="wrap-input100 validate-input m-b-13" data-validate = "Username is required">
					<input class="input100" type="text" name="cafe_name" 
					required="required" autofocus="autofocus" value="${cafe.cafe_name}" >
					<span class="focus-input100"></span>
				</div>
				<span class="txt1 p-b-11">
					카페설명
				</span>
				<div class="wrap-input100 validate-input m-b-13" data-validate = "Username is required">
					<textarea rows="10" class="input100" name="cafe_desc">${cafe.cafe_desc}</textarea>
					<span class="focus-input100"></span>
				</div>
				<span class="txt1 p-b-11">
					카페전화번호
				</span>
				<div class="wrap-input100 validate-input m-b-13" data-validate = "Username is required">
					<input class="input100" type="text" name="cafe_tel" value="${cafe.cafe_tel}">
					<span class="focus-input100"></span>
				</div>
				<span class="txt1 p-b-11">
					카페주소 (필수)
				</span>
				<div class="wrap-input100 validate-input m-b-13" data-validate = "Username is required">
					<input class="input100" id="cafe_addr" name="cafe_addr" value="${cafe.cafe_addr}" required="required">
					<span class="focus-input100"></span>
				</div>
				<span class="txt1 p-b-11">
					카페지도좌표 (필수)
				</span>
				<div class="wrap-input100 validate-input m-b-13" data-validate = "Username is required">
					<input class="input100" type="text" name="cafe_map" id="cafe_map" value="${cafe.cafe_map}" required="required">
					<span class="focus-input100"></span>
				</div>
				<div class="container-login100-form-btn">
					<input type="button" onclick="sample5_execDaumPostcode()" class="login100-form-btn" value="주소 검색">
				</div>
				<div id="map" style="width:100%;height:300px;margin-top:10px;"></div>
				
				<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=38d9353399b484489e3ca9a3d0e2c0b7&libraries=services"></script>
				<script>
					var cafeCoord = "${cafe.cafe_map}";
					cafeSplit = cafeCoord.split(",");
				    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
				        mapOption = {
				            center: new daum.maps.LatLng(cafeSplit[0], cafeSplit[1]), // 지도의 중심좌표
				            level: 5 // 지도의 확대 레벨
				        };
				
				    //지도를 미리 생성
				    var map = new daum.maps.Map(mapContainer, mapOption);
				    //주소-좌표 변환 객체를 생성
				    var geocoder = new daum.maps.services.Geocoder();
				    //마커를 미리 생성
				    var marker = new daum.maps.Marker({
				        position: new daum.maps.LatLng(cafeSplit[0], cafeSplit[1]),
				        map: map
				    });
				    function sample5_execDaumPostcode() {
				        new daum.Postcode({
				            oncomplete: function(data) {
				                var addr = data.address; // 최종 주소 변수
				                // 주소 정보를 해당 필드에 넣는다.
				                document.getElementById("cafe_addr").value = addr;
				                // 주소로 상세 정보를 검색
				                geocoder.addressSearch(data.address, function(results, status) {
				                    // 정상적으로 검색이 완료됐으면
				                    if (status === daum.maps.services.Status.OK) {
				                        var result = results[0]; //첫번째 결과의 값을 활용
				                        // 해당 주소에 대한 좌표를 받아서
				                        var coords = new daum.maps.LatLng(result.y, result.x);
				                        document.getElementById("cafe_map").value = coords;
				                        // 지도를 보여준다.
				                        mapContainer.style.display = "block";
				                        map.relayout();
				                        // 지도 중심을 변경한다.
				                        map.setCenter(coords);
				                        // 마커를 결과값으로 받은 위치로 옮긴다.
				                        marker.setPosition(coords)
				                    }
				                });
				            }
				        }).open();
				    }
				</script>
				<br>
				<span class="txt1 p-b-11">
					카페영업시간
				</span>
				<div class="wrap-input100 validate-input m-b-20" data-validate = "Username is required">
					<input class="input100" type="text" name="cafe_hours" value="${cafe.cafe_hours}" >
					<span class="focus-input100"></span>
				</div>
				<div id="reloadArea">
					<span class="txt1 p-b-11">
						등록된 카페이미지
					</span>
					<c:if test="${empty imageList }">
						등록된 이미지가 없습니다.
					</c:if>
					<c:forEach var="images" items="${imageList}">
						<div class="wrap-input100 validate-input m-b-20" data-validate = "Username is required">
						<div class="container-login100-form-btn">
							<span class="txt1 p-b-11">
								${images.img_path }
							</span>
							<input type="button" onclick="deleteImg('${images.img_id }','${cafe.cafe_id }')" class="login100-form-btn" value="이미지 삭제">
						</div>
						</div>
					</c:forEach>
				</div>
				<div id="imageLoad">
					<span class="txt1 p-b-11">
						카페이미지
					</span>
					<div class="wrap-input100 validate-input m-b-20" data-validate = "Username is required">
						<input type="hidden" name="num">
						<input class="input20" type="file" name="file1" >
						<span class="focus-input100"></span>
					</div>
				</div>
				<div class="container-login100-form-btn">
					<input type="button" onclick="addImage()" class="login100-form-btn" value="이미지 추가">
				</div>
				<br>
				<span class="txt1 p-b-11">
					주차여부
				</span>
				<div class="wrap-input100 validate-input m-b-20" data-validate = "Username is required">
					<c:if test="${cafe.cafe_parking=='y' }">
						<label for="p1">불가능</label>
						<input type="radio" name="cafe_parking" value="n" id="p1">
						<label for="p2">가능</label>
						<input type="radio" name="cafe_parking" value="y" id="p2" checked="checked">
					</c:if>
					<c:if test="${cafe.cafe_parking=='n' }">
						<label for="p1">불가능</label>
						<input type="radio" name="cafe_parking" value="n" id="p1" checked="checked">
						<label for="p2">가능</label>
						<input type="radio" name="cafe_parking" value="y" id="p2">
					</c:if>
					<span class="focus-input100"></span>
				</div>
				<span class="txt1 p-b-11">
					카페해시태그목록
				</span>
				<div class="wrap-input100 validate-input m-b-20" data-validate = "Username is required">
					<div id="hashtagList">
						<c:forEach var="hash" items="${hashConnected}">
							<div id="${hash.hash_name }">
								<input type="button" onclick="hashDeleteActualOriginal('${hash.hash_id }','${hash.hash_name}')"
								 	value=${hash.hash_name } class="button-hash">
							</div>
						</c:forEach>
					</div>
				</div>
				<span class="txt1 p-b-11">
					카페해시태그추가 
				</span>
				<div class="wrap-input100 validate-input m-b-20" data-validate = "Username is required">
					<input class="input100" type="text" name="hashtagSearch" id="hashtagSearch" placeholder="추가하고 싶은 해시태그를 검색해주세요">
					<span class="focus-input100"></span>
				</div>
				<div id="hashtagSearchResult"></div>
				<hr>
				<div class="container-login100-form-btn">
					<input type="submit" value="카페수정" class="login100-form-btn">
				</div>
				<br>
				<div class="container-login100-form-btn">
					<input type="reset" value="다시작성" class="login100-form-btn">
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
	<script src="/midterm/js/main1.js"></script>

</body>
</html>