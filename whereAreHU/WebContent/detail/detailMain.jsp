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
<style>
#inline{
	display: inline-block; 
}
#detailMain{
	margin-top: 500px;
}
#buttons{
	margin:50px 0 100px 0;
}
</style>
<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/detailMain.css">
</head>
<body class="index is-preload" style="padding-left: 180px">
		<!-- Header -->
		<header id="header" class="alt">
			<h1 id="logo">
				<a href="../list/index.jsp"><strong> <span>whereR</span>Hu
				</strong> </a>
			</h1>
			<nav id="nav">
				<ul>
					<li class="current"><a href="../list/index.jsp">Welcome</a></li>
					
					   <c:if test="${(not empty sessionScope.kakaonick) or (not empty sessionScope.user_id) or (not empty sessionScope.navername)}">
					 <%--   		<c:if test="${not empty sessionScope.kakaonick }"> <p>${sessionScope.kakaonick}님 환영합니다</p></c:if> --%>
					  		 <c:if test="${not empty sessionScope.user_id }"> <p id="inline">${sessionScope.user_id}님 환영합니다</p></c:if>
					  		  <c:if test="${not empty sessionScope.navername }"> <p id="inline">${sessionScope.navername}님 환영합니다</p></c:if>
					   
							<li class="submenu"><a href="#">menu</a>
								<ul>
								<li class="submenu"><a href="#">LookUP</a>
									<ul>
										<li><a href="#"> gas station</a></li>
										<li><a href="#">highway</a></li>
									</ul>
								<li><a href="../list/searchPage.jsp">Search</a></li>
								<li><a href="../mypage/MyPage.jsp">MyPage</a></li>
								<li><a href="https://edu.kosta.or.kr">Contact</a></li>

						</ul>
						<li><a href="logout" class="button primary">Logout</a></li>
					   </c:if>
					   
					   
					   <c:if test="${(empty sessionScope.user_id) and (empty sessionScope.kakaonick) and (empty sessionScope.navername)}">
					   <p id="inline">비회원</p>
						<li><a href="../user/loginChk" class="button primary">Login</a></li>
					  </c:if>
				</ul>
			</nav>
		</header>
	
	<div id="detailMain">
		<div class="header2">
			<h1 id="area_name">${sarea.area_name}</h1>
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
				<span class="detail_span">주소: ${sarea.address}</span><br> 
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