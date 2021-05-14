<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where? 휴식이 있는 곳!</title>
<link rel="shortcut icon" sizes="76x76" type="image/x-icon" href="../list/image/small_logo_icon.png">
<link rel="stylesheet" href="../list/css/styles.css"/>
<link rel="stylesheet" href="../list/assets/css/main.css" />

<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
</style>

<style>

*{
font-family: 'Do Hyeon', sans-serif;
}

body{
	background-image: url("../list/image/main_background.jpg"); 
	background-repeat: no-repeat;
	height: 880px;
	background-size: 100% /* 그림 사이즈 딱 맞게~ */
}
.result_box{
	width: 700px;
	height: 620px;
	margin : 100px 0 0 30px;
	background-color: rgba(215, 251, 232, 0.8);
	padding: 20px 30px;
	position: relative; /* 위치 이동 */
	top: 20px;
	left: 30px;
	border-radius: 6px; /* 모서리 둥글게 */
	box-shadow: 0 2px 2xp 0 rgb(214,214,214);
}
.result_box h2{
	color:black;
	margin : 10px 0 0 50px;
	text-align: center;
	font-weight: 700;
}


.tablesorter{
	padding:0;
	margin:0;	
	width: 800px;
	height: 400px;
}

.tablesorter p{
	color:white;
	padding: 10px;
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
#section2{
    margin: 30px;
    padding: 30px;
    width: 70%;    
}
td, th {
border: 1px solid transparent;
height: 30px;
transition: all 0.3s;
  color: #BDC581;
}

th {
background: #0a3d62;
font-weight: bold;
font-size: 13px;
color:#27ae60
}

td {
background: #FAFAFA;
text-align: center;
}

tr:nth-child(even) td { background:#0a3d62; }
tr:nth-child(odd) td { background: #3c6382; }

tr:hover td{
    background: rgb(31, 171, 137);
    color: #FFF; 
    cursor: pointer;
}
#inline{
	display: inline-block; 
}

.left_section, .middle_section{
	display: inline-block; 
}

.middle_section{
	margin-left : 300px;
	margin-bottom: 10px;
}
#bottom{
	text-align: center;
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
<noscript>
	<link rel="stylesheet" href="../list/assets/css/noscript.css" />
</noscript>	
</head>
<body class="index is-preload">
	<div id="page-wrapper">

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
								<li><a href="../list/searchPage.jsp">Search</a>
								<li><a href="../recommend/recommendMain.jsp">Recommend</a></li>
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
	
	
		 <!-- 전체 안에 있는, 동시에 최상단으로부터는 아래에 있는 검색창 -->

		
		<div class = "main_search_link">
			

		<form method="post" action="recommendAction"  onsubmit="return chkchk(this);">
		<section class = "result_box" style="color: black;
    margin-left: 450px;">
		<h1 style="text-align: center; font-family: 'Do Hyeon', sans-serif;">휴게소 추천</h1>
			<div class = "left_section" style=" font-family: 'Do Hyeon', sans-serif;">
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
		
			<div class = "middle_section" style=" font-family: 'Do Hyeon', sans-serif;">
				<input type="radio" name="etc" value="good"/>추천순<br>
				<input type="radio" name="etc" value="size"/>크기순<br>
			</div>
			
			<p id="bottom"><input id="submit" type="submit" value="recommend"> <input id="reset" type="reset" value="reset"></p>
		</section>
		</form>

			</div>
	</div>
</body>
</html>