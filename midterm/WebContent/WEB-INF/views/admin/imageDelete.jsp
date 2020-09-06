<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<span class="txt1 p-b-11">
	등록된 카페이미지
</span>
<c:forEach var="images" items="${imageList}">
	<div class="wrap-input100 validate-input m-b-20" data-validate = "Username is required">
	<div class="container-login100-form-btn">
		<span class="txt1 p-b-11">
			${images.img_path }<input type="button" onclick="deleteImg('${images.img_id }')" class="login100-form-btn" value="이미지 삭제">
		</span>
	</div>
	</div>
</c:forEach>
</body>
</html>