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
<style type="text/css">
    .bs-example{ margin: 10px;}
</style>
</head>
<body>
<div class="bs-example">
    <table class="table table-hover">
		<caption style="text-align:center">카페목록</caption>
        <thead>
            <tr>
                <th>카페아이디</th>
                <th>카페이름</th>
                <th>카페전화번호</th>
                <th>카페주소</th>
                <th>카페시간</th>
              	<th>카페지도좌표</th>
                <th>카페이미지</th>
                <th>카페주차여부</th>
                <th>카페등록일</th>
               	<th>카페폐업여부</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:if test = "${empty list}">
				<tr><th colspan="10">데이터가 없습니다</th></tr>
			</c:if> 	
			<c:if test = "${not empty list}">
				<c:forEach var="cafe" items="${list }">
					<tr><td>${cafe.cafe_id }</td><td>${cafe.cafe_name }</td>
					<td>${cafe.cafe_tel }</td><td>${cafe.cafe_addr }</td>
					<td>${cafe.cafe_hours }</td><td>${cafe.cafe_map }</td>
					<td>${imgCount[cafe.cafe_id] }</td><td>${cafe.cafe_parking }</td>
					<td>${cafe.cafe_reg_date }</td><td>${cafe.cafe_del }</td>
					<td><a href="/midterm/admin/cafeUpdateForm.do?cafe_id=${cafe.cafe_id }">수정</a></td>
					<td><a href="/midterm/admin/cafeDelete.do?cafe_id=${cafe.cafe_id }">삭제</a></td></tr>	 
				</c:forEach>
			</c:if>
	</table>
	<a href='/midterm/admin/cafeInsertForm.do'>카페등록</a>
	<a href='/midterm/admin/adminMain.do'>관리자메인</a>
</div>
</body>
</html>
