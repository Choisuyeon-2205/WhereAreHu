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
<link rel="shortcut icon" sizes="76x76" type="image/x-icon"
	href="../list/image/small_logo_icon.png">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	var like_me = ${like_me};
	
	$("#back").click(function(){
		window.history.back();
	});
	$("#like_button").on("click", function(){
		$(this).toggleClass("liked");
		$.ajax({
			url:"updateGood?user_id=${sessionScope.user_id}&area_num=${sarea.area_num}",
			type: "post",
			success: function(data){	
				alert(data);
				$("#like_num2").text(data);
			},
			error: function(){}
		});
	});
	
	if(like_me==1) {$("#like_button").toggleClass("liked"); like_me=0;}
	
	
	if(${fn:indexOf(sarea.area_name, '휴')}<=0)
		document.getElementById("buttons").style.display = "none"; 
	
});
</script>
<link rel="stylesheet" href="css/detailMain.css">
</head>
<body>
	<nav class="menu_section">
		<!-- 최상단 ~ 로고 있는 부분 하나 / 메뉴 있는 부분 하나 해서 두 개로 나눔 -->
		<div class="logo">
			<button type="button" onclick="location.href='../list/mainPage.jsp'">
				<img src="../list/image/logo1.png" alt="로고가 있는 자리" width="100"
					height="44">
			</button>
			<svg width="102" height="32" fill="currentcolor"
				style="display: inline-block"></svg>
		</div>
		<div class="menu">
			<ul class="login_and_out">
				<%
				Object user_id = session.getAttribute("user_id");
				if (user_id == null) {
				%>
				<li><button class="button_wrap" type="button"
						onclick="location.href='../user/loginChk'">로그인</button></li>
				<%
				} else {
				%>
				<li><button class="button_wrap" type="button"
						onclick="location.href='../mypage/MyPage.jsp'">마이페이지</button></li>
				<li><button class="button_wrap" type="button"
						onclick="location.href='../list/logout'">로그아웃</button></li>
				<%
				}
				%>
			</ul>
		</div>
	</nav>

	<div id="detailMain">
		<div class="header">
			<h1>${sarea.area_name}</h1>
			<div id="like">
				<div id="like_button">♥</div>
				<h5>
					<div id="like_num">좋아요 수: <span id="like_num2">${like_num}</span></div>
				</h5>
			</div>
		</div>
		<br>
		<div class="detail">
			<div class="et-detail" id="info">
				<h2>상세 정보</h2>
				<br>
				<span class="detail_span"> 주소: ${sarea.address}</span><br> 
				<span class="detail_span">노선: ${sarea.route}</span><br>
				<span class="detail_span">대표 전화번호: ${sarea.area_phone}</span><br>
				<span class="detail_span">지사명: ${sarea.fname}</span><br>
				<span class="detail_span">주유소/휴게소: ${sarea.isGas==1?"주유소":"휴게소"}</span><br> 
				<span class="detail_span">상/하행:${sarea.descend==1?"하행":"상행"}</span><br> 
				<span class="detail_span">소형차 주차대수: ${sarea.minicar}</span><br> 
				<span class="detail_span">대형차 주차대수: ${sarea.largecar}</span><br>
				<span class="detail_span">장애인 주차대수: ${sarea.othercar}</span><br>
			</div> 
			<div class="et-detail" id="map"> 
			<jsp:include page="../review/kakaoMap.jsp" />
			</div>
		</div>
		<div id="buttons">
			<input type="button" class="btns" id="food" value="대표음식"
				onclick="location.href='selectDetailFood?area_num=${sarea.area_num}&area_name=${sarea.area_name}'">
			<input type="button" class="btns" id="oil" value="주유소"
				onclick="location.href='selectDetailOil?area_num=${sarea.area_num}&area_name=${sarea.area_name}'" />
			<input type="button" class="btns" id="brand" value="브랜드매장"
				onclick="location.href='selectDetailBrand?area_num=${sarea.area_num}&area_name=${sarea.area_name}'" />
		</div>
		<div id="revinsert">

			<jsp:include page="../review/review_insert.jsp">
				<jsp:param name="rev" value="${review}" />
			</jsp:include>
		</div>
		<div id="revlist"></div>
	</div>
</body>
</html>