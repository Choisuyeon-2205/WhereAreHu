<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where? 휴식이 있는 곳!</title>
<link rel="shortcut icon" sizes="76x76" type="image/x-icon" href="image/small_logo_icon.png">
<link rel="stylesheet" href="../list/css/styles.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<style>


header{

	background-image: url("image/highway_3.jpg"); 
	background-repeat: no-repeat;
	height: 880px;
	background-size: 100% /* 그림 사이즈 딱 맞게~ */
}




.result_box{
	width: 80%;
	height: 550px;
	display: grid;
	grid-template-columns: 250px 30px auto;
	background-color: rgba(233, 233, 233, 0.8);
	padding: 20px 30px;
	position: relative; /* 위치 이동 */
	top: 20px;
	left: 100px;
	
	border-radius: 6px; /* 모서리 둥글게 */
	box-shadow: 0 2px 2xp 0 rgb(214,214,214);

}

.left_section{
	margin-left: 10px;
	padding: 40px 0;
	width: 200px;
}


.right_section{

	padding:0;
	margin:0;
	

	width: 800px;
	height: 400px;
}

.right_section p{
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


.main_search_link h1 {
	color: white;
	font-size: 22px;
}

td, th {
border: 1px solid transparent;
height: 30px;
transition: all 0.3s;
  color: #828282;
}

th {
background: #181818;
font-weight: bold;
font-size: 13px;
}

td {
background: #FAFAFA;
text-align: center;
}

tr:nth-child(even) td { background: #423e3e; }
tr:nth-child(odd) td { background: #181818; }

tr:hover td{
    background: rgb(31, 171, 137);
    color: #FFF; 
    cursor: pointer;
}

.button {
  display: inline-block;
  padding: 15px 25px;
  /*font-size: 24px;*/
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: black;
  border: none;
  border-radius: 15px;
  /*box-shadow: 0 9px #999;*/
  width: 200px;
  height: 50px;
}

.button:hover {background-color: dimgrey;}

.button:active {
  background-color: dimgrey;
  /*box-shadow: 0 5px #666;*/
  transform: translateY(4px);
}


</style>



</head>
<body><!-- block: 사이즈 완전 딱 맞게, 즉 높이랑 넓이 모두 조정 / inline-block: 넓이는 줄고, 높이는 그대로! -->
		<header> <!-- 전체 -->
		<nav class = "menu_section"> <!-- 최상단 ~ 로고 있는 부분 하나 / 메뉴 있는 부분 하나 해서 두 개로 나눔 -->
		  <div class = "logo"><button type="button" onclick=" location.href='../list/mainPage.jsp'"><img src="logo1.png" alt="로고가 있는 자리" width = "100" height = "44"></button><svg width="102" height="32" fill="currentcolor" style="display:inline-block"></svg></div>
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
		  	
		  
		  </div>
		</section>
		
		<section class = "result_box">
			<section id="section1"> <!-- 전체 안에 있는, 동시에 최상단으로부터는 아래에 있는 검색창 -->
			  <div class = "left_section">
				<h2>추가 검색 박스</h2><br>
				  <form id="searchForm">
				  	<h4>노선별 선택</h4>
				  		<div>
				  						  		
				  		<select name="route" >
						    <option value="all">모두 선택</option>
						    <c:forEach var="route" items="${routelist}" > 
						    	<option>${route}</option>
				  			</c:forEach>
						</select>
						</div>
					<br><br>
					<h4>주유소 여부</h4>
						<div>
						<input type="radio" id="isoil" name="oil" value="all" checked="checked"> 구분 없음
						<input type="radio" id="isoil" name="oil" value="yes"> O
						<input type="radio" id="isoil" name="oil" value="no"> X
						</div>
					<br><br>
					<h4>상행/하행 구분</h4>
						<div>
						<input type="radio" id="upndown" name="updown" value="all" checked="checked"> 모두 선택
						<input type="radio" id="upndown" name="updown" value="ascend"> 상행
						<input type="radio" id="upndown" name="updown" value="descend"> 하행
						</div>
						<br>
						<br>
						<br>
						<input type="button" class = "button" value="확인" id="okButton">
				  </form>
			  </div>
			</section>
			
			<section id = "vertical"></section>
			
			<section id="section2" style="overflow:scroll; width: 850px; height: 450px;">
			 
			 <h2>검색 결과</h2><br>
			 
			 <div id="here"></div>
			
			</section>
		</section>
	</header>
	
	<script>
	  $(function(){
		  //method="post" action="SearchRouteServlet"
		 $("#okButton").click(function(){
			 //alert( $("#searchForm").serialize())
			 $.ajax({
				 url:"searchResultRoute",
				 type:"post",
				 data: $("#searchForm").serialize(),
				 success:function(responseData){
					// alert(responseData);
					 $("#here").html(responseData);
				 }
			 });
		 });
	  });
	</script>
	
</body>
</html>



				  