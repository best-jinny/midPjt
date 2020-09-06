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
	function hashKindDelete(hashkind_id) {
		var sendDeleteData = "hashkind_id="+hashkind_id;
		$('#reloadArea').load("/midterm/admin/hashKindDelete.do",sendDeleteData);
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
		<caption style="text-align:center">해시그룹목록</caption>
        <thead>
            <tr>
                <th>해시그룹ID</th>
                <th>해시그룹이름</th>
                <th>소속해시태그</th>
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
					<tr><td>#${hash.hashkind_id }</td><td>${hash.hashkind_name }</td><td>${hashtagMap[hash.hashkind_id] }</td>
					<%-- <td><a href="/midterm/admin/hashKindUpdateForm.do?hashkind_id=${hash.hashkind_id }">수정</a></td> --%>
					<td><a href="" onclick="hashKindDelete('${hash.hashkind_id }')">삭제</a></td></tr>	 
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	</div>
	<a href='/midterm/admin/hashKindInsertForm.do'>해시그룹등록</a>
	<a href='/midterm/admin/adminMain.do'>관리자메인</a>
</div>
</body>
</html>