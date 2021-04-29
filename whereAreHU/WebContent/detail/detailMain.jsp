<%@page import="model.ServiceAreaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where? 휴식이 있는 곳!</title>
<link rel="shortcut icon" sizes="76x76" type="image/x-icon" href="../list/image/small_logo_icon.png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	var like_me = ${like_me};
	var insertYn= 0;
	
	$("#back").click(function(){
		window.history.back();
	});
	$("#like_button").on("click", function(){
		if(like_me===1){
			$(this).css("background-color", "lightgray");
			insertYn=0;
		}else {
			$(this).css("background-color", "red");
			insertYn=1;
		}
		$.ajax({
			url:"updateGood?user_id=${sessionScope.user_id}&area_num=${sarea.area_num}",
			data:{"insertYn":insertYn},
			type: "post",
			success: function(data){	
				$("#like_num").text(data.like);
				location.reload();
			},
			error: function(){}
		});
	});
	if(like_me===1)
		$("#like_button").css("background-color", "red");
	
	
	if(${fn:indexOf(sarea.area_name, '휴')}<=0)
		document.getElementById("buttons").style.display = "none"; 
	
});
</script>
<style>
.header, .detail, #buttons {
	text-align: center;
}

h1 {
	font-weight: bold;
	font-family: "맑은 고딕 bold";
	font-size: 60px;
}

h1, h2, h3, h4, h5 {
	display: inline-block;
}

h4 {
	color: red;
}

span{
	display: inline-block;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-right: 100px;
	background-color: #d7fbe8;
	padding: 15px;
	padding-left: 100px;
	padding-right: 100px;
	border-radius: 10px;
}

input[type=button] {
	background-color: lightgray;
	padding: 20px;
	padding-left: 40px;
	padding-right: 40px;
	border-left: 30px;
	margin-left: 100px;
	margin-top: 15px;
	border-radius: 10px;
	font-size: 20px;
}

#buttons {
	background-color: #1fab89;
	height: 100px;
	border-radius: 10px;
}

p {
	font-family: "맑은 고딕";
}

#revlist {
	width: 800px;
	margin: 10px auto;
}
#like_button {
	color="red";
}
#like {
	padding: 10px;
	background-color: #1fab89;
}
#login_header {
	float: right;
	
}
.header{
	background-color : rgba(172, 172, 172, 0.7);
}

*{
	/* 헤더에 배경사진 적용하면 그림파일 특성상 넣으면서 여백이 생김 -> padding과 margin으로 여백 없도록 하기! */
	padding:0px;
	margin:0px;
	box-sizing: border-box;
}
.logo button{
	background-color : white;
	color: white;
	width: 100px;
	height: 44px;
	font-size: 15px;
	font-weight: 700;
	border-radius: 6px;
	border: 0;
    background-color: rgba( 255, 255, 255, 0 );
	cursor: pointer; /* 커서 들이대면 커서가 변경됨 */
}
.menu_section{
	display: grid;
	grid-template-columns: auto auto; /* 1:1 비율로 나누어줌 (=1fr 1fr) */
	justify-content: space-between; /* 양끝으로 가게 만들어~ */
	background-color : rgba(172, 172, 172, 0.7);
}
.logo{
	color: white;
	font-size: 35px;
	font-weight: 800;
	margin: 12px 0 0 20px /* 12 3 6 9시 방향 띄우기 */
}
/* 로그인 버튼 관련 */
.button_wrap{
  background-color: white;
  color: black;
  text-align: center;
  padding: 0.3em 1em;
  text-decoration: none;
  border-radius: 8px;
}
.button_wrap:hover{
  color:white;
  background-color: rgb(31,171,137);
}
.button_wrap .icon{
  display: none;
}
button_wrap:link{
  text-decoration: none;
}
.menu ul{
	display: grid;
	grid-template-columns: auto auto auto; /* 3개라서 auto를 3번 준다 */
	grid-gap: 30px; /* ul마다 30px씩 떨어뜨림! */
	list-style-type : none; /* 링크 누르면 색 변하는 거 제거 */
	
	margin: 20px 20px 0 0 /* 12 3 6 9시 방향 띄우기 */
}
.menu ul a {
	text-decoration: none; /* 링크 밑줄 제거 */
	color: white;
	font-weight: 800; /* 글자 굵기 설정 */
}
</style>
</head>
<body>
	<nav class = "menu_section"> <!-- 최상단 ~ 로고 있는 부분 하나 / 메뉴 있는 부분 하나 해서 두 개로 나눔 -->
		 <div class = "logo"><button type="button"><img src="../list/image/logo1.png" alt="로고가 있는 자리" width = "100" height = "44"></button><svg width="102" height="32" fill="currentcolor" style="display:inline-block"></svg></div>
		 <div class = "menu">
		  <ul class = "login_and_out">
		  	<%
		  		Object user_id = session.getAttribute("user_id");
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
	<div class="header">
		<h1>${sarea.area_name}</h1>
		<div id="like">
			<button type="button" id="like_button">♡</button>
			<h5><div id="like_num">좋아요 수: ${like_num}</div></h5>
		</div>
	</div>
	<hr>
	<div class="detail">
		<span class="et-detail" id="info">
			<h2>상세 정보</h2><br>
			주소: ${sarea.address}<br>
			노선: ${sarea.route}<br>
			대표 전화번호: ${sarea.area_phone}<br>
			지사명: ${sarea.fname}<br>
			주유소/휴게소: ${sarea.isGas==1?"주유소":"휴게소"}<br>
			상/하행: ${sarea.descend==1?"하행":"상행"}<br>
			대표 전화번호: ${sarea.minicar}<br>
			소형차 주차대수: ${sarea.largecar}<br>
			대형차 주차대수: ${sarea.othercar}<br>
			장애인 주차대수: ${sarea.thumbsup}<br>
		</span>
		<span class="et-detail" id="map">
			<jsp:include page="../review/kakaoMap.jsp" />
		</span>
	</div>
	<div id="buttons">
		<input type="button" id="food" value="대표음식" 
		onclick="location.href='selectDetailFood?area_num=${sarea.area_num}&area_name=${sarea.area_name}'"> 
		<input type="button" id="oil" value="주유소" onclick="location.href='selectDetailOil?area_num=${sarea.area_num}&area_name=${sarea.area_name}'"/> 
		<input type="button" id="brand" value="브랜드매장" onclick="location.href='selectDetailBrand?area_num=${sarea.area_num}&area_name=${sarea.area_name}'"/>
	</div>
	<div id="revinsert">
	
	<jsp:include page="../review/review_insert.jsp">
		<jsp:param name="rev" value="${review}" />
	</jsp:include>  
	</div>
	<div id="revlist">
	</div>
</body>
</html>