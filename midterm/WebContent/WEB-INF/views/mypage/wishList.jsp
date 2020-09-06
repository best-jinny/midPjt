<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="/midterm/styles/pretty-checkbox/dist/pretty-checkbox.min.css"/>
<script src="/midterm/js/jquery.js"></script>
<script type="text/javascript">
	function favorite(num) {
		var sendData = "member_id=${member_id}&cafe_id=" + num;
		$('#reloadPage').load("/midterm/mypage/deleteWishListConfirm.do",sendData);
	}
</script>
</head>
<body>	

									


<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">Favorites</h1>
     </div>
</section>

<div class="container mb-4" style="line-height:3.5em">
<h2>#My Hashtags!</h2>
<c:forEach items="${hashList_user}" var="hashList_user"> <!-- 유저 등록 해시 출력  -->
<button type="button" class="btn btn-outline-danger" onclick="location.href='/midterm/search/search.do?subject=${hashList_user.hash_name}&member_id=${sessionScope.member_id}'">#${hashList_user.hash_name}</button>
</c:forEach> 
</div>


<div class="container mb-4">
<h2>♥My Favorite Cafes</h2>
    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
            	<div id="reloadPage">
                <table class="table table-striped">
                
                    <thead>
                        <tr>
                            <th scope="col" class="text-left"></th>
							<th scope="col" class="text-left">이름</th>
							<th scope="col" class="text-left">위치</th>
							<th scope="col" class="text-left">영업시간</th>	
							<th scope="col" class="text-left">찜 목록</th>	
                        </tr>
                    </thead>
 
                    <tbody>	
                    	<c:forEach var="cafe" items="${cafeList }" varStatus="status"> 
                    	<input type="hidden" value= "${member_id}">
                        <tr>
                            <td>
								<a href="/midterm/searchDetail/cafeDetail.do?member_id=${member_id}&cafe_id=${cafe.cafe_id}">
								<img src="${imageList[status.index].img_path }" width="150" height="150"></a>
							</td>
                            <td>${cafe.cafe_name }</td>
							<td>${cafe.cafe_addr }</td>
							<td>${cafe.cafe_hours }</td>
                            <td class="text-left">
                            	<div class="pretty p-icon p-toggle p-plain">
							        <input type="checkbox" id="heartCheck" onclick="favorite('${cafe.cafe_id}')"/>
						        	<div class="state p-off p-info-o">
						            	<i class="icon fa fa-heart"></i>
						            	<label>찜</label>
						        	</div>
						        	<div class="state p-on">
						            	<i class="icon fa fa-heart-o"></i>
						            	<label>찜</label>
						        	</div>
						    	</div>
                            </td>
                            </tr>   
						 </c:forEach> 
                    </tbody>
                    
                    
                </table>
                </div>
            </div>
        </div>
        <form action="/midterm/main/main.do" class="col-sm-12 col-md-6 text-center">
        <div class="col mb-2">
            <div class="row">
               	
                <div class="col-sm-12 col-md-6 text-center">
                    <button class="btn btn-lg btn-block btn-success text-uppercase">돌아가기</button>
                </div>
            </div>
        </div>
        </form>
    </div>
</div>
</html>