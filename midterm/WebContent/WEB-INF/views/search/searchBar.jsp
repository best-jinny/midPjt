<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="search_form_container">
	<form action="/midterm/search/search.do" class="search_form" id="search_form">
		<div class="d-flex flex-sm-row flex-column align-items-sm-start align-items-center justify-content-sm-between">
			<input type="text" name="subject" class="search_input" placeholder="What cafes shall we try today?" required="required">
			<button class="search_button">Spill It!</button>
		</div>
	</form>
</div>
</body>
</html>