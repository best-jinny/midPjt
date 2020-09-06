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
	.redtext {
		font-family: Oswald-Medium;
		color: red;
	}
	.greentext {
		font-family: Oswald-Medium;
		color: green;
	}
</style>
</head>
<body>
<c:if test="${result==0 }">
	<h6 class="greentext">*사용가능한 해시그룹입니다</h6>
</c:if>
<c:if test="${result>0 }">
	<h6 class="redtext">*이미 존재하는 해시그룹입니다</h6>
</c:if>
</body>
</html>