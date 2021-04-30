<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>


<script> 
function check() {
	var user_id =$('#id').val();
	var user_pw=$('#password').val();
    if (user_id == "") {
    	 
        alert("아이디를 입력해주세요");
        $("#id").focus();
        return;
    } 
    else if (user_pw == "") {
    	 
        alert("비밀번호를를 입력해주세요");
        $("#pw").focus();
        return;
    }

	$.ajax({
		type:"post",
		url:'loginChk',
		data:{"user_id":user_id,"user_pw":user_pw},
		success: function (data) {
			 
			if(data.trim() =="no"){
			
				alert("로그인 정보를 확인해주세요");
				$('#id').val("");
				$('#password').val("");
				$('#id').focus();
			}else{
				location.href="../list/mainPage.jsp"
			}
		}
	})
}

</script>
<meta charset="UTF-8">
<title>Login Page</title>
  <link rel="stylesheet" type="text/css" href="./style.css">
</head>
<body>
<form action="userinsert.jsp" method="post" ></form>
<form action="loginChk" method ="post" class="loginForm">	
<h2>LOGIN</h2>
<div class="idForm">
ID<input type="text" name="user_id" class="id" id="id"><br>
</div>

<div class="passForm">
PW<input type="password" name="user_pw" class="pw" id="password"><br>
</div>
<input type="button" value="Login" class="btn" onclick="check()">





  <div class="bottomText">
   Don't you have ID?  <a href="userinsert.jsp">Sign up</a>
   	
 <a href="javascript:KakaoLogin()">
    <img  id="kakao"  src="kakao.png" id="kakao">
 </a>
<!-- 네이버아이디로로그인 버튼 노출 영역 -->
<div id="naver_id_login"></div>
<!-- //네이버아이디로로그인 버튼 노출 영역 -->

</div>
</form>
   <script>
	  window.Kakao.init("b17f39ce838a0f2150074bbe84b0e99e");
	  function KakaoLogin() {
		window.Kakao.Auth.login({
			scope:'profile, account_email',
			success: function(authobj) {
				
		/* 		console.log(authobj), */
				window.Kakao.API.request({
					url:'/v2/user/me',
					success: res => {
						const kakao_account=res.kakao_account;
				console.log(kakao_account);
			  var kakaonickname = kakao_account.profile.nickname;    //카카오톡 닉네임을 변수에 저장
			      var kakao_email = kakao_account.email; 
			  
			      console.log(kakao_account.email);
			      console.log(kakao_account.profile.nickname);
			      
			  
			      //location.href = "http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/whereAreHU/user/loginChk?kakaonickname="
			    		  //+kakaonickname+"&kakao_email="+account_email); 
			     	 window.location.href="../list/mainPage.jsp?kakaonickname="
			    		  +kakaonickname+"&kakao_email="+kakao_email;		
			     	sessionStorage.setItem("username",kakaonickname);
			     	sessionStorage.setItem("user_email",kakao_email);
			      	//sessionStorage.getItem("user_email");
			     	//sessionStorage.getItem("username"); 가져오기 

			     	
					}
				});	
			}
		});
	}
	
   </script>


<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
	var naver_id_login = new naver_id_login("LzGGjtT_5CpyZZFjnLWk", "http://localhost:9090/whereAreHU/user/callback.jsp");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 2,40);
	naver_id_login.setDomain(".service.com");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
	$("#naver_id_login img").attr("src", "naver.png");
	//location.href="../list/mainPage.jsp";
</script>
<!-- // 네이버아이디로로그인 초기화 Script -->
</body>
</html>