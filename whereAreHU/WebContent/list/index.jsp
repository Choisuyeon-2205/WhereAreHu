<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>


<title>Main</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="shortcut icon" sizes="76x76" type="image/x-icon" href="image/small_logo_icon.png">



<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>
<style>

#inline{
	display: inline-block; 
}

</style>


<body class="index is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<header id="header" class="alt">
			<h1 id="logo">
				<a href="index.jsp"><strong> <span>whereR</span>Hu
				</strong> </a>
			</h1>
			<nav id="nav">
				<ul>
					<li class="current"><a href="index.html">Welcome</a></li>
					
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

		<!-- Banner -->
		<section id="banner">

			<div class="inner">

				<header>
					<h2>WhereRHU</h2>
				</header>
				<p>
					Find your <strong>RestArea</strong>, a free <br /> responsive <br />
					by <a href="">hereHuGO</a>.
				</p>
				<footer>
					<ul class="buttons stacked">
						<li><a href="../list/searchPage.jsp"
							class="button fit scrolly">Search RestArea</a></li>
					</ul>
				</footer>

			</div>

		</section>

		<!-- Main -->
		<article id="main">

			<header class="special container" style="padding-top: 0px;">

				<!-- <span class="icon solid fa-chart-bar"> -->

				<img alt="돋보기" src="images/search.png">


				<h2>
					<strong>차별화된 서비스</strong>
				</h2>
				<p>전국 모든 휴게소의 정보를 사람들과 공유해 보세요.
			</header>




			<!-- Two -->
			<section class="wrapper style1 container special">
				<div class="row">
					<div class="col-4 col-12-narrower">

						<section>
							<span class="icon solid featured fa-check"></span>
							<header>
								<h3>조건별 검색기능</h3>

							</header>
							<p>휴게소를 원하는 조건으로 찾아보세요.</p>
						</section>
					</div>
					<div class="col-4 col-12-narrower">

						<section>
							<span class="icon solid featured fa-check"></span>
							<header>
								<h3>별점 및 좋아요 기능</h3>
							</header>
							<p>사람을이 선호하는 휴게소를 찾을 수 있습니다.</p>
						</section>

					</div>
					<div class="col-4 col-12-narrower">

						<section>
							<span class="icon solid featured fa-check"></span>
							<header>
								<h3>리뷰 기능</h3>
							</header>
							<p>다른 사람들의 휴게소 경험담을 들어보고 공유하세요 .</p>
						</section>
					</div>
				</div>
			</section>

			<!-- Three -->
			<section class="wrapper style3 container special">

				<header class="major">
					<h2>
						<strong>올해의 휴게소를 소개합니다.</strong>
					</h2>
				</header>

				<div class="row">
					<div class="col-6 col-12-narrower">

						<section>
							<a href="#" class="image featured"><img src="images/hs.jpg"
								alt="" /></a>
							<header>
								<h3>횡성휴게소</h3>
							</header>
							<p style="text-align: left">강원도 횡성은 겨울올림픽 개최지로 향하는 관문이다. 하여
								휴게소 중 이례적으로 대중교통 환승시설을 설치했다. 휴게소 곳곳을 올림픽 주요 경기 종목과 수호랑·반다비를 닥종이
								인형으로 만들어 전시했다. 미니 컬링존에서 컬링 체험도 가능하다. 한우, 한지 등 횡성을 대표하는 6가지 특산물을
								주제로 한 홍보관도 구경할 수 있다. 전국 고속도로 음식 중 베스트 음식 20에 꼽힌 한우떡더덕 스테이크도 판다.</p>
						</section>

					</div>
					<div class="col-6 col-12-narrower">

						<section>
							<a href="#" class="image featured"><img src="images/pc.jpg"
								alt="" /></a>
							<header>
								<h3>평창 휴게소</h3>
							</header>
							<p style="text-align: left">평창휴게소는 올림픽 주무대인 평창 용평면에 있다. 보통
								대관령을 넘어가기 전에 잠시 쉬었다 가는 곳인데 올림픽 기간에는 그냥 지나치기 아쉽다. 올림픽 기간에만 한정
								판매하는 ‘올림픽 한정 메뉴’를 선보인다. 겨울철 동해에서 먹는 도치알탕을 평창휴게소 상행선에서 맛볼 수 있다.
								하행선에서는 도루묵탕을 판다. 눈꽃샐러드돈까스도 올림픽 한정 메뉴다. 한국이 금메달을 획득할 때마다 커피 사이즈를
								업그레이드 해주거나 간식을 추가로 제공하는 이벤트도 있다.</p>
						</section>

					</div>
				</div>
				<div class="row">
					<div class="col-6 col-12-narrower">

						<section>
							<a href="#" class="image featured"><img src="images/nr.jpg"
								alt="" /></a>
							<header>
								<h3>내린천휴게소</h3>
							</header>
							<p style="text-align: left">강원도 인제 내린천휴게소는 2017년 6월 개통한
								서울양양고속도로 동홍천~양양 구간에 있다. 국내 최초로 고속도로 상공에 지어진 휴게소여서 외관부터 독특하다. 휴게소
								아래로 차들이 통행하는 아주 이색적인 장면이 연출돼 꼭 한번 들러볼 만한 휴게소로 손꼽힌다. 휴게소 3·4층에
								자리한 홍보관에서는 한국에서 가장 긴 터널인 인제양양터널 등을 소개하고 해당고속도로를 이용할 때 참고할 수 있는
								관광지도도 볼 수 있다. 전망대에서는 강원도 인제의 산자락을 감상하며 신선한 공기를 쐴 수 있다.</p>
						</section>

					</div>
					<div class="col-6 col-12-narrower">

						<section>
							<a href="#" class="image featured"><img src="images/dp.jpg"
								alt="" /></a>
							<header>
								<h3>덕평휴게소</h3>
							</header>
							<p style="text-align: left">즐길거리가 많은 덕평휴게소는 밤에 가도 좋다. 지난해 빛
								테마파크 ‘별빛정원 우주’을 개장했다. 첨단 조명을 활용해 정원·숲·우주공간 등을 표현한 10가지 콘텐트로
								구성했다. 남자화장실 소변기에는 소변의 속도와 양을 측정해주는 시설이 있다. 산책하기 좋은 러브벤치 공원, 애견을
								위한 공간 ‘달려라 코코’도 인기다. 애견의 역사와 기원까지 설명하고 견종별 특징까지 알려주는 애견박물관도 있다.
								올림픽 기간에는 입장권 소지고객에게 소고기국밥을 3000원에 할인 판매한다.</p>
						</section>

					</div>
				</div>

				<footer class="major">
					<ul class="buttons">
						<li><a href="#" class="button">See More</a></li>
					</ul>
				</footer>

			</section>

		</article>

		<!-- CTA -->
		<section id="cta">

			<header>
				<h2>여행을 떠날 준비가 되셨나요?</h2>
				<p>여행을 즐기기전 다양한 전국 각지에 있는 휴게소를 찾아보세요.</p>
			</header>

		</section>

		<!-- Footer -->
		<footer id="footer">

			<ul class="icons">
				<li><a href="https://twitter.com/"
					class="icon brands circle fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="https://www.facebook.com/"
					class="icon brands circle fa-facebook-f"><span class="label">Facebook</span></a></li>
				<li><a href="https://www.google.co.kr/"
					class="icon brands circle fa-google-plus-g"><span class="label">Google+</span></a></li>
				<li><a href="https://github.com/"
					class="icon brands circle fa-github"><span class="label">Github</span></a></li>
				<li><a href="https://support.dribbble.com/hc/en-us"
					class="icon brands circle fa-dribbble"><span class="label">Dribbble</span></a></li>
			</ul>

			<ul class="copyright">
				<li>&copy; Herehugo</li>
				<li>Design: <a>정훈, 성덕</a></li>
			</ul>

		</footer>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>