<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where? 휴식이 있는 곳!</title>
<link rel="shortcut icon" sizes="76x76" type="image/x-icon" href="image/small_logo_icon.png">
<link rel="stylesheet" href="css/styles.css"/>



<style>

header{ 
	background-image: url("image/main_background.jpg"); /* 메인사진 : 덕양휴게소 전경 */
	height: 880px;
	background-size: 100%; /* 그림 사이즈 딱 맞게~ */
	background-repeat: no-repeat; 
}


/* 커서 액션 활성화 */
.main_search_link ul a::after{
	content:"";
	position: absolute;
	bottom: 0;
	left: 50%;
	transform: translateX(-50%);
	width: 0;
	height: 4px;
	background: rgb(157,243,196);
	transition: all .5s ease-out;
}

.main_search_link ul a:hover::after{
	width: 100%;
}


.main_left_text{
	width: 400px;
	padding: 180px 0 0 30px;
}

.main_left_text span{
	display: block;
	text-align: left;
	vertical-align: middle;
	text-align: left;
	
	color: white;
}

.main_text1{
	font-size: 40px;
}



</style>


</head>
<body><!-- block: 사이즈 완전 딱 맞게, 즉 높이랑 넓이 모두 조정 / inline-block: 넓이는 줄고, 높이는 그대로! -->


	<header> <!-- 전체 -->
		<nav class = "menu_section"> <!-- 최상단 ~ 로고 있는 부분 하나 / 메뉴 있는 부분 하나 해서 두 개로 나눔 -->
		  <div class = "logo"><button type="button"><img src="logo1.png" alt="로고가 있는 자리" width = "100" height = "44"></button><svg width="102" height="32" fill="currentcolor" style="display:inline-block"></svg></div>
		  <div class = "menu">
		  	<ul class = "login_and_out">
		  	<%
		  		Object user_id = session.getAttribute("user_id");
		  	%>
						
			<%
				if(user_id == null){
			%> 
		  		<li><button class = "btn" type = "button" onclick = "location.href='../user/loginChk'">로그인</button></li>

		  	<%
				} else {
		  	%>
		  		<li><button class = "btn" type = "button" onclick = "location.href='../mypage/MyPage.jsp'">마이페이지</button></li>
		  		<li><button class = "btn" type = "button" onclick = "location.href='logout'">로그아웃</button></li>
		  	<%
				}
		  	%>	
		  		
		  	</ul>
		  </div>
		</nav>
	
	
	
		<section> <!-- 전체 안에 있는, 동시에 최상단으로부터는 아래에 있는 검색창 -->
		  <div class = "main_search_link">
		  	<ul>
		  		<li><a href="../list/searchPage.jsp" class="_p4ul2ts">조회</a></li>
		  		<li><a href="../list/searchPage.jsp" class="_p4ul2ts">조회</a></li>
		  	</ul>
		  
		  </div>
		
		  <div class = "main_box">
		  	<div class = "main_title">전국 모든 휴게소와 관련된 정보</div>
		  </div>
		</section>
		
		<section>
			<div class = "main_left_text">
				<span class = "main_text1">뭔가 엄청 거창한 말</span>
				<span class = "main_text2">두 번째로 거창한 말</span>
				<span class = "main_text3">세 번째로 거창한 말</span>
				<span class = "main_text4">이상한 말</span>
			</div>
		</section>
		
	</header>
	
	
</body>
</html>