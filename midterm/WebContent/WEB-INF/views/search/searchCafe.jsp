<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@font-face {
	  font-family: Oswald-Medium;
	  src: url('/midterm/plugins/oswald/Oswald-Medium.ttf'); 
	}
	.button-style {
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
	.button-style:hover {
	 	color: #fff;
	 	background-color: #5C73AD;
	}
	.button-new {
		font-family: Oswald-Medium;
		font-size: 16px;
		color: #fff;
		background-color: green;
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
	.button-new:hover {
	 	color: #fff;
	 	background-color: #5C73AD;
	}
	.warntext {
		font-family: Oswald-Medium;
		color: red;
	}
</style>
<script src="/midterm/js/jquery.js"></script>
<script type="text/javascript">
	var formId;
	window.onload = function() {
		formId = document.getElementById("frmId");
	}
	function cafeReplace(cafe_name) {
		var cafe_name_insert = cafe_name;
		formId.cafeList.value += cafe_name + " ";
		var cafeReplaceData1 = '<div id="'+cafe_name+'"><input type="button"'
		+' onclick="cafeDeleteOriginal(\'';
		var cafeReplaceData2 = '\')" value="'+cafe_name+
			'" class="button-cafe"></div>';
		$('#cafeShowList').append(cafeReplaceData1+cafe_name_insert+cafeReplaceData2);
	}
	function cafeDeleteOriginal(cafe_name) {
		var stringCut = formId.cafeList.value;
		var start = stringCut.indexOf(cafe_name);
		formId.cafeList.value = stringCut.replace(cafe_name,"");
		$('#'+cafe_name).empty();
	}
</script>
</head>
<body>
<h6 class="warntext">*등록하고 싶은 카페를 클릭해주세요</h6>
<br>
<c:if test="${empty listCafeSearch }">
	<h6 class="warntext">해당하는 카페가 없습니다. 다시 검색해주세요.</h6>
</c:if>
<c:if test="${not empty listCafeSearch }">
	<c:forEach var="cafe" items="${listCafeSearch }">
		<input type="button" onclick="cafeReplace('${cafe.cafe_name }')" value=" ${cafe.cafe_name } " class="button-style">
	</c:forEach>
</c:if>
</body>
</html>