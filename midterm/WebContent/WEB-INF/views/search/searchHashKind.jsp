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
	function hashReplace(hash_name) {
		var hash_name_insert = hash_name;
		formId.hashOriginalList.value += hash_name + " ";
		var hashReplaceData1 = '<div id="'+hash_name+'"><input type="button"'
		+' onclick="hashDeleteOriginal(\'';
		var hashReplaceData2 = '\')" value="'+hash_name+
			'" class="button-hash"></div>';
		$('#hashKindList').append(hashReplaceData1+hash_name_insert+hashReplaceData2);
	}
	function hashCreate(hash_name) {
		var hash_name_insert = hash_name;
		formId.hashNewList.value += hash_name + " ";
		var hashCreateData1 = '<div id="'+hash_name+'"><input type="button"'
		+' onclick="hashDeleteNew(\'';
		var hashCreateData2 = '\')" value="'+hash_name+
			'" class="button-hash"></div>';
		$('#hashKindList').append(hashCreateData1+hash_name_insert+hashCreateData2);
	}
	function hashDeleteOriginal(hash_name) {
		var stringCut = formId.hashOriginalList.value;
		var start = stringCut.indexOf(hash_name);
		formId.hashOriginalList.value = stringCut.replace(hash_name,"");
		$('#'+hash_name).empty();
	}
	function hashDeleteNew(hash_name) {
		var stringCut = formId.hashNewList.value;
		var start = stringCut.indexOf(hash_name);
		formId.hashNewList.value = stringCut.replace(hash_name,"");
		$('#'+hash_name).empty();
	}
</script>
</head>
<body>
<h6 class="warntext">*등록하고 싶은 해시그룹을 클릭해주세요</h6>
<br>
<c:if test="${needNew }">
	<input type="button" onclick="hashCreate('${newHashKind}')" value=" ${newHashKind } " class="button-new">
</c:if>
<c:if test="${not empty listHkdSearch }">
	<c:forEach var="hashkind" items="${listHkdSearch }">
		<input type="button" onclick="hashReplace('${hashkind.hashkind_name }')" value=" ${hashkind.hashkind_name } " class="button-style">
	</c:forEach>
</c:if>
</body>
</html>