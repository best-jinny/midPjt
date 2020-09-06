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
<c:if test="${result>0}">
	<script type="text/javascript">
	alert("해시그룹등록 성공했습니다");
	location.href="/midterm/admin/hashKindList.do";
	</script>
</c:if>
<c:if test="${result==0}">
	<script type="text/javascript">
	alert("해시그룹등록 실패했습니다");
	history.go(-1);
	</script>
</c:if>
<c:if test="${result==-1}">
	<script type="text/javascript">
	alert("이미 있는 해시그룹입니다.");
	history.go(-1);
	</script>
</c:if>
</body>
</html>