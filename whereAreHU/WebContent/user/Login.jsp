<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Login Page</title>
  <link rel="stylesheet" type="text/css" href="./style.css">
</head>
<body width="100%" height="100%">

<form action="loginChk" method ="post" class="loginForm">	
<h2>LOGIN</h2>
<div class="idForm">
ID<input type="text" name="user_id" class="id"><br>
</div>

<div class="passForm">
PW<input type="password" name="user_pw" class="pw"><br>
</div>
<input type="submit" value="Login" class="btn" onclick="check()">
<form action="userinsert.jsp" method="post">
  <div class="bottomText">
   Don't you have ID?  <a href="userinsert.jsp">Sign up</a>
   
   
 <a href="javascript:KakaoLogin()"><img = src="https://developers.kakao.com/docs/static/image/m/kakaologin.png"></a>
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   <script>

	  window.Kakao.init("b17f39ce838a0f2150074bbe84b0e99e");
	  function KakaoLogin() {
		window.Kakao.Auth.login({
			scope:'profile, account_email',
			success: function(authobj) {
				console.log(authobj);
				window.Kakao.API.request({
					url:'/v2/user/me',
					success: res => {
						const Kakao_account=res.kakao_account;
				console.log(kakao_account);
					}
				});
			}
		});
	}
   
   </script>

</div>
</form>
</form>


</body>
</html>