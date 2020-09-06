<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/midterm/js/jquery.js"></script>
<script type="text/javascript">
	function hashDelete(hash_id) {
		var sendDeleteData = "hash_id="+hash_id;
		$('#reloadArea').load("/midterm/admin/hashDelete.do",sendDeleteData);
	}
</script>
</head>
<body>
<table class="table table-hover">
		<caption style="text-align:center">해시태그목록</caption>
        <thead>
            <tr>
                <th>해시태그아이디</th>
                <th>해시태그이름</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:if test = "${empty list}">
				<tr><th colspan="10">데이터가 없습니다</th></tr>
			</c:if> 	
			<c:if test = "${not empty list}">
				<c:forEach var="hash" items="${list }">
					<tr><td>${hash.hash_id }</td><td>${hash.hash_name }</td>
					<td><a href="/midterm/admin/hashUpdateForm.do?hash_id=${hash.hash_id }">수정</a></td>
					<td><a href="" onclick="hashDelete('${hash.hash_id }')">삭제</a></td></tr>	 
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</body>
</html>