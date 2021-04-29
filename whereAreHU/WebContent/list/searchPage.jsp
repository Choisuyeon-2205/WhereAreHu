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

	background-image: url("image/highway_5.jpg"); 
	background-repeat: no-repeat;
	height: 880px;
	background-size: 100% /* 그림 사이즈 딱 맞게~ */
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
	background: rgb(215,251,232);
	transition: all .5s ease-out;
}

.main_search_link ul a:hover::after{
	width: 100%;
}

.main_search_link ul a {
	text-decoration: none; /* 링크 밑줄 제거 */
	color: rgb(248,248,248);
	font-weight: 800; /* 글자 굵기 설정 */
	position: relative;
	padding: 6px 12px;
	
}




.search_box{
	width: 630px;
	display: inline-block;
	background-color: rgba(215, 251, 232, 0.6);
	padding: 20px 30px;
	position: relative; /* 위치 이동 */
	top: 50px;
	left: 400px;
	
	border-radius: 6px; /* 모서리 둥글게 */
	box-shadow: 0 2px 2xp 0 rgb(214,214,214);

}

.search_input{
	height: 45px;
	width: 460px;
	color: rgb(100, 98, 98);
	font-size: 15px;
	border: 1px solid rgb(230,227,227);
	
	margin-top:10px;
	padding-left:10px;
}

.search_button a{
	text-decoration: none;
	list-style-type : none; 
	color: white;
}



</style>



</head>
<body><!-- block: 사이즈 완전 딱 맞게, 즉 높이랑 넓이 모두 조정 / inline-block: 넓이는 줄고, 높이는 그대로! -->
		<header> <!-- 전체 -->
		<nav class = "menu_section"> <!-- 최상단 ~ 로고 있는 부분 하나 / 메뉴 있는 부분 하나 해서 두 개로 나눔 -->
		  <div class = "logo"><button type="button" onclick=" location.href='../list/mainPage.jsp'"><img src="logo1.png" alt="로고가 있는 자리" width = "100" height = "44"></button><svg width="102" height="32" fill="currentcolor" style="display:inline-block"></svg></div>
		  <div class = "menu">
		  	<ul class = "login_and_out">
		  	<%
		  		Object user_id = session.getAttribute("user_id");
		  	%>
						
			<%
				if(user_id == null){
			%> 
		  		<li><button class = "button_wrap" type = "button" onclick = "location.href='../user/loginChk'">로그인</button></li>

		  	<%
				} else {
		  	%>
		  		<li><button class = "button_wrap" type = "button" onclick = "location.href='../mypage/MyPage.jsp'">마이페이지</button></li>
		  		<li><button class = "button_wrap" type = "button" onclick = "location.href='logout'">로그아웃</button></li>
		  	<%
				}
		  	%>	
		  		
		  	</ul>
		  </div>
		</nav>
	

		<section> <!-- 전체 안에 있는, 동시에 최상단으로부터는 아래에 있는 검색창 -->
		  <div class = "main_search_link">
		  	<ul>
		  		<li><a href="../list/searchResultOil" class="_p4ul2ts" >주유소 조회</a></li>
		  		<li><a href="/s/experiences/online" class="_p4ul2ts" >고속도로별 조회</a></li>
		  	</ul>
		  
		  </div>
		</section>
	
		<section> <!-- 전체 안에 있는, 동시에 최상단으로부터는 아래에 있는 검색창 -->
		  <div class = "search_box">
		  	<div class = "search_title">휴게소 검색</div>

		  		
		  			
		  	<form action = "searchResult">
		  		<input name = "search" class = "search_input" type = "text" placeholder = "검색하실 위치, 장소 혹은 휴게소를 검색해주세요">
		  		
			  	<div class = "search_button">
			  		<input type = "submit" value = "검색">
			  	</div>
		  	</form>
		  	
		  </div>
		</section>
	</header>
	
	
</body>
</html>