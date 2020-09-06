<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/midterm/js/jquery.js"></script>
<script type="text/javascript">
	function hashDelete(hash_id) {
		var sendDeleteData = "hash_id="+hash_id;
		$('#reloadArea').load("/midterm/admin/hashDelete.do",sendDeleteData);
	}
</script>
<style type="text/css">
    .bs-example{ margin: 10px;}
</style>
</head>
<body>
<div class="bs-example">
<div id="reloadArea">
    <table class="table table-hover">
		<caption style="text-align:center">해시태그목록</caption>
        <thead>
            <tr>
                <th>해시태그ID</th>
                <th>해시태그이름</th>
                <th>관련카페</th>
                <th>관련해시그룹</th>
                <!-- <th>수정</th> -->
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:if test = "${empty list}">
				<tr><th colspan="10">데이터가 없습니다</th></tr>
			</c:if> 	
			<c:if test = "${not empty list}">
				<c:forEach var="hash" items="${list }">
					<tr><td>#${hash.hash_id }</td><td>${hash.hash_name }</td>
					<td><a href="">${cafeMap[hash.hash_id] }</a></td><td>${hashKindMap[hash.hash_id] }</td>
					<%-- <td><a href="/midterm/admin/hashUpdateForm.do?hash_id=${hash.hash_id }">수정</a></td> --%>
					<td><a href="" onclick="hashDelete('${hash.hash_id }')">삭제</a></td></tr>	 
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	</div>
	<a href='/midterm/admin/hashInsertForm.do'>해시태그등록</a>
	<a href='/midterm/admin/adminMain.do'>관리자메인</a>
</div>
</body>
</html>