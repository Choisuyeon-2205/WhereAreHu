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
	
	
	
<!-- 이 페이지에서 사용할 것은 헤더 안으로 집어 넣으세요~ -->




	</header>
	
	<main> <!-- 전체 파트 아래 ~ 일단 만들기는 했음 하단에서 연결 링크를 만드는~? 나도 잘 모름 -->
		<section>
		  <div class = "sec_title">대충 타이틀 1</div>
		  <div class = "card_box"><!-- 섹션 내 구획 4  -->
		  	<div class = "card"> <!-- 각 구획 별로 사진 1 + 텍스트 1 예정 -->
		  		<div class = "card_img"></div>
		  		<div class = "card_content">주유소 현황</div>
		  	</div>
		  	<div class = "card"> <!-- 각 구획 별로 사진 1 + 텍스트 1 예정 -->
		  		<div class = "card_img"></div>
		  		<div class = "card_content">브랜드별 음식 찾기</div>
		  	</div>
		  	<div class = "card"> <!-- 각 구획 별로 사진 1 + 텍스트 1 예정 -->
		  		<div class = "card_img"></div>
		  		<div class = "card_content">음식 현황</div>
		  	</div>
		  	<div class = "card"> <!-- 각 구획 별로 사진 1 + 텍스트 1 예정 -->
		  		<div class = "card_img"></div>
		  		<div class = "card_content">기타</div>
		  	</div>
		  </div>
		</section>
	
	
		<section> <!-- 수면실 등 편의시설 정리 섹션 => 차후에 분리 예정~ -->
			<div class = "sec_title">대충 제목인 듯</div>
			<div class = "choo_box"> <!-- 박스 별로 편의시설 이미지를 삽입한 후에 사진 누르면 검색되는 식으로~? -->
				<div class = "choo_image"></div>
				<div class = "choo_image"></div>
				<div class = "choo_image"></div>
				<div class = "choo_image"></div>
				<div class = "choo_image"></div>
			</div>
		</section>
	
	
		<section> <!-- ㅅㅂ 여기는 뭐냐 그 뭐였지 아 휴게소 검색 후에 나온 결과 진이랑 이름이랑 별점 어쩌구 같이 ~  -->
			<div class = "sec_title">여기는 휴게소 검색 결과에 따른 휴게소 이름, 별점, 어쩌구 넣으면 좋을 듯</div> <!-- 이 섹션도 두 개로 분류됨. 하나는 타이틀  -->
			<div class = "home_box"> <!-- 다른 하나는 8개의 휴게소 상세보기를 싸고 있는 큰 박스(물론 타이틀 아래~)ㄴ -->
			 	
			 	<div class = "home"> <!-- 각각의 휴게소 상세보기! 물론 크게는 2개로 구분 -->
			 		<div class = "home_img1"></div> <!-- 상단의 이미지(1)  -->
			 		<div class = "home_info">  <!-- 하단의 상세정보(2,3,4)  -->
			 			<div class = "info1">연중무휴 운영 중</div>
			 			<div class = "info2">서울만남휴게소</div>
			 			<div class = "info3"><!-- 마지막 정보 칸에도 별+좋아요 수+추가정보(?)로 총 셋으로 구획  -->
			 				<span class = "star">⭐⭐⭐⭐⭐</span>
			 				<span class = "count">추천 수 : 899</span>
			 				<span class = "type">이용자수 전체 1위</span>
			 			</div>
			 		</div>
			 	</div>
			 			 	
			 	<div class = "home"> <!-- 각각의 휴게소 상세보기! 물론 크게는 2개로 구분 -->
			 		<div class = "home_img2"></div> <!-- 상단의 이미지(1)  -->
			 		<div class = "home_info">  <!-- 하단의 상세정보(2,3,4)  -->
			 			<div class = "info1">연중무휴 운영 중</div>
			 			<div class = "info2">서울만남휴게소</div>
			 			<div class = "info3"><!-- 마지막 정보 칸에도 별+좋아요 수+추가정보(?)로 총 셋으로 구획  -->
			 				<span class = "star">⭐⭐⭐⭐⭐</span>
			 				<span class = "count">추천 수 : 899</span>
			 				<span class = "type">이용자수 전체 1위</span>
			 			</div>
			 		</div>
			 	</div>
			 	
			 	<div class = "home"> <!-- 각각의 휴게소 상세보기! 물론 크게는 2개로 구분 -->
			 		<div class = "home_img3"></div> <!-- 상단의 이미지(1)  -->
			 		<div class = "home_info">  <!-- 하단의 상세정보(2,3,4)  -->
			 			<div class = "info1">연중무휴 운영 중</div>
			 			<div class = "info2">서울만남휴게소</div>
			 			<div class = "info3"><!-- 마지막 정보 칸에도 별+좋아요 수+추가정보(?)로 총 셋으로 구획  -->
			 				<span class = "star">⭐⭐⭐⭐⭐</span>
			 				<span class = "count">추천 수 : 899</span>
			 				<span class = "type">이용자수 전체 1위</span>
			 			</div>
			 		</div>
			 	</div>
			 	
			 	
			 	<div class = "home"> <!-- 각각의 휴게소 상세보기! 물론 크게는 2개로 구분 -->
			 		<div class = "home_img4"></div> <!-- 상단의 이미지(1)  -->
			 		<div class = "home_info">  <!-- 하단의 상세정보(2,3,4)  -->
			 			<div class = "info1">연중무휴 운영 중</div>
			 			<div class = "info2">서울만남휴게소</div>
			 			<div class = "info3"><!-- 마지막 정보 칸에도 별+좋아요 수+추가정보(?)로 총 셋으로 구획  -->
			 				<span class = "star">⭐⭐⭐⭐⭐</span>
			 				<span class = "count">추천 수 : 899</span>
			 				<span class = "type">이용자수 전체 1위</span>
			 			</div>
			 		</div>
			 	</div>
			 	
			 	
			 	<div class = "home"> <!-- 각각의 휴게소 상세보기! 물론 크게는 2개로 구분 -->
			 		<div class = "home_img5"></div> <!-- 상단의 이미지(1)  -->
			 		<div class = "home_info">  <!-- 하단의 상세정보(2,3,4)  -->
			 			<div class = "info1">연중무휴 운영 중</div>
			 			<div class = "info2">서울만남휴게소</div>
			 			<div class = "info3"><!-- 마지막 정보 칸에도 별+좋아요 수+추가정보(?)로 총 셋으로 구획  -->
			 				<span class = "star">⭐⭐⭐⭐⭐</span>
			 				<span class = "count">추천 수 : 899</span>
			 				<span class = "type">이용자수 전체 1위</span>
			 			</div>
			 		</div>
			 	</div>
			 	
			 	
			 	<div class = "home"> <!-- 각각의 휴게소 상세보기! 물론 크게는 2개로 구분 -->
			 		<div class = "home_img6"></div> <!-- 상단의 이미지(1)  -->
			 		<div class = "home_info">  <!-- 하단의 상세정보(2,3,4)  -->
			 			<div class = "info1">연중무휴 운영 중</div>
			 			<div class = "info2">서울만남휴게소</div>
			 			<div class = "info3"><!-- 마지막 정보 칸에도 별+좋아요 수+추가정보(?)로 총 셋으로 구획  -->
			 				<span class = "star">⭐⭐⭐⭐⭐</span>
			 				<span class = "count">추천 수 : 899</span>
			 				<span class = "type">이용자수 전체 1위</span>
			 			</div>
			 		</div>
			 	</div>
			 	
			 	
			 	<div class = "home"> <!-- 각각의 휴게소 상세보기! 물론 크게는 2개로 구분 -->
			 		<div class = "home_img7"></div> <!-- 상단의 이미지(1)  -->
			 		<div class = "home_info">  <!-- 하단의 상세정보(2,3,4)  -->
			 			<div class = "info1">연중무휴 운영 중</div>
			 			<div class = "info2">서울만남휴게소</div>
			 			<div class = "info3"><!-- 마지막 정보 칸에도 별+좋아요 수+추가정보(?)로 총 셋으로 구획  -->
			 				<span class = "star">⭐⭐⭐⭐⭐</span>
			 				<span class = "count">추천 수 : 899</span>
			 				<span class = "type">이용자수 전체 1위</span>
			 			</div>
			 		</div>
			 	</div>
			 	
			 	
			 	<div class = "home"> <!-- 각각의 휴게소 상세보기! 물론 크게는 2개로 구분 -->
			 		<div class = "home_img8"></div> <!-- 상단의 이미지(1)  -->
			 		<div class = "home_info">  <!-- 하단의 상세정보(2,3,4)  -->
			 			<div class = "info1">연중무휴 운영 중</div>
			 			<div class = "info2">서울만남휴게소</div>
			 			<div class = "info3"><!-- 마지막 정보 칸에도 별+좋아요 수+추가정보(?)로 총 셋으로 구획  -->
			 				<span class = "star">⭐⭐⭐⭐⭐</span>
			 				<span class = "count">추천 수 : 899</span>
			 				<span class = "type">이용자수 전체 1위</span>
			 			</div>
			 		</div>
			 	</div>
			 	
			 	
			 	
			 	
			 	
			</div>
		</section>
	</main>
</body>
</html>