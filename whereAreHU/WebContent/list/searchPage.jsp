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


header{ /* 지금 사용하고 있지 않음... */
	
	background-repeat: no-repeat;
	height: 880px;
	background-size: 100% /* 그림 사이즈 딱 맞게~ */
}





</style>

</head>
<body><!-- block: 사이즈 완전 딱 맞게, 즉 높이랑 넓이 모두 조정 / inline-block: 넓이는 줄고, 높이는 그대로! -->
	<header> <!-- 전체 -->
		<nav class = "menu_section"> <!-- 최상단 ~ 로고 있는 부분 하나 / 메뉴 있는 부분 하나 해서 두 개로 나눔 -->
		  <div class = "logo"><button type="button"><img src="logo1.png" alt="로고가 있는 자리" width = "100" height = "44"></button><svg width="102" height="32" fill="currentcolor" style="display:inline-block"></svg></div>
		  <div class = "menu">
		  	<ul>
		  		<li><a href="#">메뉴1</a></li>
		  		<li><a href="#">메뉴2</a></li>
		  		<li><a href="#">메뉴3</a></li>
		  		<li><a href="#"><svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 25px; width: 25px; fill: currentcolor;"><path d="m16 .7c-8.437 0-15.3 6.863-15.3 15.3s6.863 15.3 15.3 15.3 15.3-6.863 15.3-15.3-6.863-15.3-15.3-15.3zm0 28c-4.021 0-7.605-1.884-9.933-4.81a12.425 12.425 0 0 1 6.451-4.4 6.507 6.507 0 0 1 -3.018-5.49c0-3.584 2.916-6.5 6.5-6.5s6.5 2.916 6.5 6.5a6.513 6.513 0 0 1 -3.019 5.491 12.42 12.42 0 0 1 6.452 4.4c-2.328 2.925-5.912 4.809-9.933 4.809z"></path></svg></a></li>
			  </ul>
		  </div>
		</nav>
	
	
	
		<section> <!-- 전체 안에 있는, 동시에 최상단으로부터는 아래에 있는 검색창 -->
		  <div class = "search_box">
		  	<div class = "search_title">대충 텍스트 있는 곳</div>
		  	<table>
		  		<tr>
		  			<tb colspan="2">
		  				<input class = "search_input" type = "text" placeholder = "검색하실 위치, 장소 혹은 휴게소를 검색해주세요">
		  			</tb>
		  		</tr>
		  		<tr>
		  			<tb colspan="2"> <!-- 이쪽은 아마 빼고 헤더의 메뉴에 관련 내용을 넣을 듯하다 -->
		  				<select class = "search_input">
		  					<option>전부 조회</option>
		  					<option>상행선</option>
		  					<option>하행선</option>
		  				</select>
		  			</tb>
		  		</tr>
		  	</table>
		  	
		  	
		  	<div class = "search_button">
		  		<button>검색</button>
		  	</div>
		  	
		  	
		  </div>
		</section>
	</header>
	
	
</body>
</html>