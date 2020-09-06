<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Search Result</title>
</head>
<body>
<div class="results_container">
	<!-- Locations -->
	<div class="locations_no container_custom">
		<div class="container">
			<div class="row">
				<div class="col">
				<div class="section_title"><h1>${subject}<span>에 관한 검색 결과가 없습니다 :(<br>이런 검색은 어떠세요?</span></h1></div>
					<div class="locations_container_no d-flex flex-row align-items-start justify-content-between flex-wrap">	
						<c:set var="i" value="0"></c:set>
						<c:set var="loop_flag" value="false"></c:set>
						<c:set var="hashLength" value="${fn:length(hashKindList) }"></c:set>
						<c:forEach var="hashKind" items="${hashKindList }">
							<c:set var="i" value="${i+1 }"></c:set>
							<c:if test="${i==hashLength+1 }">
								<c:set var="loop_flag" value="true"></c:set>
							</c:if>
							<c:if test="${not loop_flag }">
								<div class="location_no">
									<img src="/midterm/images/cafe${i }.jpg" alt="">
									<div class="location_title_no text-center"><div><a href="/midterm/search/search.do?subject=${hashKind.hashkind_name}">#${hashKind.hashkind_name}<div>Q</div></a></div></div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>