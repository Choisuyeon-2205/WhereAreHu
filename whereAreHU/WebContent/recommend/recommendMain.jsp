<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where? 휴식이 있는 곳!</title>
<link rel="shortcut icon" sizes="76x76" type="image/x-icon" href="../list/image/small_logo_icon.png">
<link rel="stylesheet" href="../list/css/styles.css"/>
<style>
header{
	background-image: url("../list/image/highway_3.jpg"); 
	background-repeat: no-repeat;
	height: 880px;
	background-size: 100% /* 그림 사이즈 딱 맞게~ */
}
.result_box{
	width: 70%;
	height: 600px;
	background-color: rgba(215, 251, 232, 0.6);
	border-radius: 6px; /* 모서리 둥글게 */
	box-shadow: 0 2px 2xp 0 rgb(214,214,214);
	text-align: center;
}
.middle_section , .left_section {
	margin-left: 50px;
	margin-top: 50px;
	padding: 20px;
	display: inline-block;
	width: 400px;
	text-align: left;
	background-color: rgba(255, 255, 255, 0.6);
	border-radius: 6px; /* 모서리 둥글게 */
	box-shadow: 0 2px 2xp 0 rgb(214,214,214);
}
input[type=checkbox] {
	margin: 10px;
}
#bottom{ 
	text-align: right;
}
.main_search_link{ 
	color:white; 
}
#bottom{
	margin-top: 10px;
	margin-right: 50px;
	margin-bottom: 10px;
}
#reset{
	width: 80px;
	height: 40px;
	margin-right: 20px;
	margin-left: 20px;
	font-size: 15px;
	background-color: lightgray;
	border-radius: 6px; /* 모서리 둥글게 */
}
#submit{
	width: 120px;
	height: 40px;
	font-size: 15px;
	background-color: lightgray;
	border-radius: 6px; /* 모서리 둥글게 */
}
</style>
<script>
function chkchk (form){ 
    var arr_form = document.getElementsByName('region'); 
    var num = 0; 
    for(var i=0; i<arr_form.length; i++){ 
        if(arr_form[i].checked){ 
            num++; 
        } 
    } 
    if(!num){ 
        alert('하나 이상 선택해주시기 바랍니다'); 
        return false; 
    } 
} 
</script> 
</head>
<body><!-- block: 사이즈 완전 딱 맞게, 즉 높이랑 넓이 모두 조정 / inline-block: 넓이는 줄고, 높이는 그대로! -->
		<header> <!-- 전체 -->
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
	
		 <!-- 전체 안에 있는, 동시에 최상단으로부터는 아래에 있는 검색창 -->
		<div class = "main_search_link">
			<h1>휴게소 추천</h1>
		</div>
		
		
		<form method="post" action="recommendAction"  onsubmit="return chkchk(this);">
		<section class = "result_box">
			<div class = "left_section">
				<input type="checkbox" name="region" value="서울"/>서울<br>
				<input type="checkbox" name="region" value="경기"/>경기<br>
				<input type="checkbox" name="region" value="부산"/>부산<br>
				<input type="checkbox" name="region" value="대구"/>대구<br>
				<input type="checkbox" name="region" value="울산"/>울산<br>
				<input type="checkbox" name="region" value="대전"/>대전<br>
				<input type="checkbox" name="region" value="인천"/>인천<br>
				<input type="checkbox" name="region" value="전북"/>전북<br>
				<input type="checkbox" name="region" value="전남"/>전남<br>
				<input type="checkbox" name="region" value="충북"/>충북<br>
				<input type="checkbox" name="region" value="충남"/>충남<br>
				<input type="checkbox" name="region" value="강원"/>강원<br>
				<input type="checkbox" name="region" value="경상북도"/>경상북도
			</div>
		
			<div class = "middle_section">
				<input type="radio" name="etc" value="good"/>추천순<br>
				<input type="radio" name="etc" value="size"/>크기순<br>
			</div>
			
			<p id="bottom"><input id="submit" type="submit" value="recommend"> <input id="reset" type="reset" value="reset"></p>
		</section>
		</form>
	</header>
	
	
</body>
</html>