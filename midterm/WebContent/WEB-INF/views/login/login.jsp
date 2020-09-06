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
<c:if test ="${idPassValue == 1}">
	<script type="text/javascript">
		alert("로그인 되었습니다.");
		location.href="/midterm/main/main.do";
	</script>
</c:if>
<!-- 관리자 로그인 -->
<c:if test ="${idPassValue == 2 }">
	<script type="text/javascript">
		location.href="/midterm/admin/adminMain.do";
	</script>
</c:if>
<c:if test ="${idPassValue == 0}">
	<script type="text/javascript">
		alert("암호가 다릅니다.");
		history.go(-1);
	</script>
</c:if>	
<c:if test ="${idPassValue == -1 }">
	<script type="text/javascript">
	alert("존재 하지 않는 아이디입니다.");
	history.go(-1)
</script>
</c:if>
</body>
</html>