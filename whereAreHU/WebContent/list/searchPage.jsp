<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where? 휴식이 있는 곳!</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="shortcut icon" sizes="76x76" type="image/x-icon" href="image/small_logo_icon.png">



<style>

body{
	background-size: cover;        
	background-image: url("../list/image/backimg3.jpg");
	background-size: cover; 
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

<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>

</head>
<body class="index is-preload">
	<div id="page-wrapper">
				<!-- Header -->
		<header id="header" >
			<h1 id="logo">
				<a href="index.html"><strong> <span>whereR</span>Hu
				</strong> </a>
			</h1>
			<nav id="nav">
				<ul>
					   <c:if test="${not empty sessionScope.user_id}">
  						 <p>${username}님 환영합니다<p>
 						 	<li class="submenu"><a href="#">menu</a>
						<ul>

							<li class="submenu"><a href="#">LookUP</a>ㅠ
								<ul>
									<li><a href="#"> gas station</a></li>
									<li><a href="#">highway</a></li>
								</ul>
							<li><a href="#">Search</a></li>
							<li><a href="../mypage/MyPage.jsp">MyPage</a></li>
							<li><a href="contact.html">Contact</a></li>

						</ul></li>
						<li><a href="logout" class="button primary">Logout</a></li>
						
   					  </c:if>
   					  
					   <c:if test="${empty sessionScope.user_id}">
					   <p>비회원<p>
					  
					
					<li><a href="../user/loginChk" class="button primary">Login</a></li>
					</c:if>
		

				</ul>
			</nav>
		</header>

	

		<section> <!-- 전체 안에 있는, 동시에 최상단으로부터는 아래에 있는 검색창 -->
		  <div class = "main_search_link">
		  	<ul>
		  		<li><a href="../list/searchResultOil" class="_p4ul2ts" >주유소 조회</a></li>
		  		<li><a href="../list/searchResultRoute" class="_p4ul2ts" >고속도로별 조회</a></li>
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

	
	</div>
</body>
</html>