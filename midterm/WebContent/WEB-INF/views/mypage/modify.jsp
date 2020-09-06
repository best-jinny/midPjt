<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test ="${idPassValue > 0}" >
	<script type="text/javascript">
	alert("회원 정보 수정이 완료 되었습니다.");
	location.href="main.do"
	</script>
</c:if>

<c:if test ="${idPassValue == 0}">
	<script type="text/javascript">
	alert("회원 정보 수정이 실패 하였습니다.");
	history.go(-1);
	</script>
</c:if>
</body>
</html>