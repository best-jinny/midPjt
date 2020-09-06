<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form by Colorlib</title>
<!-- Font Icon -->
<link rel="stylesheet" href="/midterm/plugins/material-icon/css/material-design-iconic-font.min.css">
<!-- Main css -->
<link rel="stylesheet" href="/midterm/styles/css/style.css">
<script type="text/javascript">
function passChkConfirm() {
	if (chk.member_password.value != chk.confrim_password.value) {
		alert("비밀번호가 일치 하지 않습니다.");
		chk.member_password.focus();
		chk.member_password.value = "";
		return false;
	}
}
</script>
</head>
<body>

    <div class="main" >

        <section class="signup">
            <!-- <img src="images/signup-bg.jpg" alt=""> -->
            <div class="container">
                <div class="signup-content">
                    <form method="POST" action="/midterm/mypage/modify.do" method="post" name="chk" onsubmit="return passChkConfirm()">
             				<input type="hidden" name="member_id" value="${member.member_id}"> 
                          
                          
                        <h2 class="form-title">회원 정보 수정</h2>
                        
                        <div class="form-group">
                            <input type="password" class="form-input" name="member_password" id="password" placeholder="PassWord"/>
                           	 <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                        </div>
                        
                        <div class="form-group">
                            <input type="password" class="form-input" name="confrim_password" id="password" placeholder="Password"/>
                        </div>
                        
                        <div class="form-group">
                            <input type="text" class="form-input" name="member_name" id="re_password" placeholder="Repeat your password" value="${member.member_name}"/>
                        </div>
                 
                        <div class="form-group">
                            <input type="text" class="form-input" name="member_email" id="email" placeholder="Email" value="${member.member_email}"/>
                        </div>
                        
                        <div class="form-group">
                            <input type="tel" class="form-input" name="member_tel" id="tel" pattern="\d{3}-\d{3,4}-\d{4}" placeholder="xxx-xxxx-xxxxx" title="tel xxx-xxxx-xxxx" value="${member.member_tel}"/>
                        </div>
            		
            			
                        <div class="form-group">
                            <input type="submit" class="form-submit"  value="확인" ></button>
                        </div>
                        	</form>
                    
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="/midterm/vendor/jquery/jquery.min.js"></script>
    <script src="/midterm/js/main.js"></script>
</body>
</html>