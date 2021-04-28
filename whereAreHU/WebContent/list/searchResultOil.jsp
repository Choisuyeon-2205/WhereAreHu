<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where? 휴식이 있는 곳!</title>
<link rel="shortcut icon" sizes="76x76" type="image/x-icon" href="image/small_logo_icon.png">
<link rel="stylesheet" href="css/styles.css"/>



<style>

main {
	margin: 30px 30px;
}


header{

	background-image: url("image/gas_background2.jpg"); 
	background-repeat: no-repeat;
	height: 880px;
	background-size: 100% /* 그림 사이즈 딱 맞게~ */
}




.result_box{
	width: 80%;
	height: 550px;
	display: grid;
	grid-template-columns: 350px 30px auto;
	background-color: rgba(215, 251, 232, 0.6);
	padding: 20px 0;
	position: relative; /* 위치 이동 */
	top: 20px;
	left: 100px;
	
	border-radius: 6px; /* 모서리 둥글게 */
	box-shadow: 0 2px 2xp 0 rgb(214,214,214);

}



.left_section{
	display: inline-block;
	padding:0;
	margin:0;

}

.left_section p{
	padding: 10px;
	line-height:20px;
}

#result_section::after{
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

#result_section:hover::after{
	width: 100%;
}

#result_section {
	text-decoration: none; /* 링크 밑줄 제거 */
	color: rgb(248,248,248);
	font-weight: 800; /* 글자 굵기 설정 */
	position: relative;
	padding: 6px 12px;
	
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




#section2{
    margin: 30px;
    padding: 30px;
    width: 70%;
    
}

.main_search_link h1 {
	color: white;
	font-size: 22px;
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
		  	<h1>조회 결과</h1>
		  
		  </div>
		</section>
		
		<section class = "result_box">
			<section id="section1"> <!-- 전체 안에 있는, 동시에 최상단으로부터는 아래에 있는 검색창 -->
							<h3>검색 결과</h3>
			  <div class = "left_section" style="overflow:scroll; width: 330px; height: 450px;">

				  <main>
				  <c:forEach var="oil" items="${oillist}" > 
				  	<div >
				  		<p><a id = result_section href="../detail/selectDetailOil?area_name=${oil.oil_name}" >주유소명: ${oil.oil_name}</a></p>
				  	</div>
				  </c:forEach>
				  


				  </main>
			  </div>
			</section>
			
			<section id = "vertical"></section>
			
			<section id="section2">
			  <div class = "right_section" style="overflow:scroll; width: 600px; height: 400px;">
			 	<h2>검색 결과</h2>
				  <main>
				  

				  


				  </main>

			  	
			  </div>
			
			</section>
		</section>
	</header>
	
	
</body>
</html>



				  