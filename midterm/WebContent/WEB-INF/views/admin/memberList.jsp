<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
    .bs-example{
    	margin: 10px;
    	text-align: center;
    }
</style>
</head>
<body>
<div>
    <table class="table table-hover">
    <caption style="text-align:center">회원목록</caption>
        <thead>
            <tr>
                <th>회원아이디</th>
                <th>이름</th>
                <th>전화번호</th>
                <th>이메일</th>
              	<th>가입일</th>
                <th>탈퇴여부</th>
            </tr>
        </thead>
        <tbody>
    		<c:if test = "${empty list}">
				<tr><th colspan="5">데이터가 없습니다</th></tr>
			</c:if> 	
			<c:if test = "${not empty list}">
				<c:forEach var="member" items="${list }">
					<tr><td>${member.member_id}</td><td>${member.member_name}</td>
					<td>${member.member_tel}</td><td>${member.member_email}</td>
					<td>${member.member_reg_date }</td><td>${member.member_del }</td>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
<a href='/midterm/admin/adminMain.do'>관리자메인</a> 
</div>
</body>
</html>