<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Join</title>
<!-- Font Icon -->
<link rel="stylesheet" href="/midterm/plugins/material-icon/css/material-design-iconic-font.min.css">
<!-- Main css -->
<link rel="stylesheet" href="/midterm/styles/css/style.css">
 <script type="text/javascript">
  function IdChkConfirm() {
		if (!chk.member_id.value) {
			alert("아이디를 입력하세요.");
			chk.member_id.focus();
			return false;
		}
	$.post('id_Confirm.do','member_id='+chk.member_id.value, function(data) {
					
		$('#err').html(data);
	});
  }
	function passChkConfirm(){
		if (chk.member_password.value != chk.confrim_password.value){
			alert("비밀번호가 일치 하지 않습니다.");
			chk.member_password.focus(); chk.member_password.value="";
			return false;
		}
	}
  </script>
</head>
<body>

    <div class="main">

        <section class="signup">
            <!-- <img src="images/signup-bg.jpg" alt=""> -->
            <div class="container">
                <div class="signup-content">
                    <form method="POST" action="/midterm/mypage/join.do" method="post" name="chk" onsubmit="return passChkConfirm()">
                        <h2 class="form-title">회원가입</h2>
                        
                        <div class="form-group" >
                            <input type="text" class="form-input" name="member_id" id="name" placeholder="Id"/>
                            <div id="err">
                            <input type="button" class="form-input"value="아이디 중복체크"onclick="return IdChkConfirm()">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <input type="password" class="form-input" name="member_password" id="password" placeholder="PassWord"/>
                           	 <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                        </div>
                        
                        <div class="form-group">
                            <input type="password" class="form-input" name="confrim_password" id="password" placeholder="PassWord"/>
                        </div>
                        
                        <div class="form-group">
                            <input type="text" class="form-input" name="member_name" id="re_password" placeholder="Your Name"/>
                        </div>
                 
                        <div class="form-group">
                            <input type="text" class="form-input" name="member_email" id="email" placeholder="E-mail"/>
                        </div>
                        
                        <div class="form-group">
                            <input type="tel" class="form-input" name="member_tel" id="tel" pattern="\d{3}-\d{3,4}-\d{4}" placeholder="Tel(010-xxxx-xxxx)"/>
                        </div>
            
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="완료"/>
                        </div>
                        
                    </form>
                    <p class="loginhere">
                      	 이미 가입이 되어있습니까? <a href="/midterm/login/loginForm.do" class="loginhere-link">로그인</a>
                    </p>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="/midterm/vendor/jquery/jquery.min.js"></script>
    <script src="/midterm/js/main.js"></script>
</body>
</html>