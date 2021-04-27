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

	background-image: url("image/highway_3.jpg"); 
	background-repeat: no-repeat;
	height: 880px;
	background-size: 100% /* 그림 사이즈 딱 맞게~ */
}


.main_search_link{
	top: 20px;
	left: 400px;
	
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


.result_box{
	width: 80%;
	height: 550px;
	display: grid;
	grid-template-columns: 250px 30px auto;
	background-color: rgba(215, 251, 232, 0.6);
	padding: 20px 30px;
	position: relative; /* 위치 이동 */
	top: 20px;
	left: 100px;
	
	border-radius: 6px; /* 모서리 둥글게 */
	box-shadow: 0 2px 2xp 0 rgb(214,214,214);

}

.left_section{
	margin-left: 90px;
}

.left_section ul{
	height: 100px;

}


.left_section ul li{
	list-style:none;
	line-height: 70px;
	
	
}
.left_section ul li a{
	color: hotpink;
	text-decoration: none;
	list-style-type : none;

	
	cursor: pointer;
}

.right_section{
	background-color: rgba(68,114,196, 0.4);
	padding:0;
	margin:0;
	

	width: 800px;
	height: 400px;
}

.right_section p{
	color:white;
	padding: 20px;
	line-height:35px;
}
::-webkit-scrollbar{
	widht:25px;
}
::-webkit-scrollbar-track{
	border:7px solid #232943;
	box-shadow: inset 0 0 2.5px 2px rgba(0,0,0,0.5);
}
::-webkit-scrollbar-thumb{
	background: #f00;
	border-radius: 3px;
}


#vertical{
	width: 5px;
	height: 80%;
	background-color: black;
}

#section1{
    width: 20%;

}

#section2{
    margin: 30px;
    padding: 30px;
    width: 70%;
    
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
		  <div class = "main_search_link">
		  	<ul>
		  		<li><a href="/s/experiences/online" class="_p4ul2ts">지역별 조회</a></li>
		  		<li><a href="/s/experiences/online" class="_p4ul2ts">고속도로별 조회</a></li>
		  	</ul>
		  
		  </div>
		</section>
		
		<section class = "result_box">
			<section id="section1"> <!-- 전체 안에 있는, 동시에 최상단으로부터는 아래에 있는 검색창 -->
			  <div class = "left_section">
			  
				<ul>
					<li><a href="#">abc</a></li>
					<li><a href="#">cdb</a></li>
					<li><a href="#">efd</a></li>
					<li><a href="#">gwt</a></li>
					<li><a href="#">sdc</a></li>
					<li><a href="#">bzjo</a></li>
				</ul>
			  	
			  </div>
			</section>
			
			<section id = "vertical"></section>
			
			<section id="section2">
			  <div class = "right_section" style="overflow:scroll; width: 800px; height: 400px;">
			 	<h2>검색 결과</h2>
			 	<table>
			 		<thead>
			 			<tr>
			 				<th>휴게소명</th>
			 				<th>주소</th>
			 				<th>고속도로</th>
							<th>추천 수</th>
			 			</tr>
			 		</thead>
			 	
			 	</table>
			  	
			  </div>
			
			</section>
		</section>
	</header>
	
	
</body>
</html>



