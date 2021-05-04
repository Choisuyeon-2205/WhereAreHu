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
<link rel="stylesheet" href="assets/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<style>

*{
	color: black;
}
#select {
	font-weight: 500;
}

main {
	margin: 30px 30px;
}

body{
	background-image: url("image/gas_background2.jpg"); 
	background-repeat: no-repeat;
	height: 880px;
	background-size: 100% /* 그림 사이즈 딱 맞게~ */
}
#searchForm{
	height:300px;
}
.result_box{
	display: grid;
	grid-template-columns: 250px 20px 200px;
}
#section1 {
	padding: 1px 0 0 20px;
}
#section2{
	/*margin: 100px 100px 0 0;*/
}
.result_box{
	width: 80%;
	height: 700px;
	background-color: rgba(233, 233, 233, 0.8);
	padding: 20px 0;
	position: relative; /* 위치 이동 */
	top: 150px;
	left: 150px;
	border-radius: 6px; /* 모서리 둥글게 */
	box-shadow: 0 2px 2xp 0 rgb(214,214,214);
}


.main_search_link h1 {
	color: white;
	font-size: 22px;
}
table {
color: #333;
width: 1000px;
border-collapse:collapse; 
border-spacing: 0;
}
.tborder{
	padding-left : 800px;
}
td, th {
border: 1px solid transparent;
height: 30px;
transition: all 0.3s;
  color: white;
}
th {
background: #0a3d62;
font-weight: bold;
font-size: 13px;
width: 30px;
}
td {
background: #FAFAFA;
text-align: center;
}
tr:nth-child(even) td { background: #0a3d62; }
tr:nth-child(odd) td { background: #3c6382; }

tr:hover td{
    background: rgb(31, 171, 137);
    color: #FFF; 
    cursor: pointer;
}
.needed_left_space{
	margin-left: 60px;
	   width: 70%;
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
#inline{
	display: inline-block; 
}

.button {
  display: inline-block;
  padding: 15px 25px;
  font-size: 24px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: black;
  border: none;
  border-radius: 15px;
  /*box-shadow: 0 9px #999;*/

}

.button:hover {background-color: dimgrey;}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
 */

</style>



</head>
<body><!-- block: 사이즈 완전 딱 맞게, 즉 높이랑 넓이 모두 조정 / inline-block: 넓이는 줄고, 높이는 그대로! -->
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

		
		<section class = "result_box">
			<section id="section1"> <!-- 전체 안에 있는, 동시에 최상단으로부터는 아래에 있는 검색창 -->

				<h2>추가 검색 박스</h2><br>
				  <form id="searchForm">
				  	<h4 id="select">노선별 선택</h4>
				  		<div>
				  						  		
				  		<select name="route" >
						    <option value="all">모두 선택</option>
						    <c:forEach var="route" items="${routelist}" > 
						    	<option>${route}</option>
				  			</c:forEach>
						</select>
						</div>
					<br><br>
					<h4 id="select">주유소 여부</h4>
						<div>
						<input type="radio" id="isoil" name="oil" value="all" checked="checked"> 구분 없음
						<input type="radio" id="isoil" name="oil" value="yes"> O
						<input type="radio" id="isoil" name="oil" value="no"> X
						</div>
					<br><br>
					<h4 id="select">상행/하행 구분</h4>
						<div>
						<input type="radio" id="upndown" name="updown" value="all" checked="checked"> 모두 선택
						<input type="radio" id="upndown" name="updown" value="ascend"> 상행
						<input type="radio" id="upndown" name="updown" value="descend"> 하행
						</div>
						
						<br>
						<input type="button" class = "button" value="확인" id="okButton" style="font-size: 13px;">
				  </form>
			</section>
			
			<section id = "vertical" style="border-left: 2px solid black; margin-left: 20px;"></section>
			
			<section id="section2" style="overflow:scroll; width: 1020px; margin-left: 30px;">
			 			 <h2>검색 결과</h2>

			 
			 <div id="here"></div>
			
			</section>
		</section>

	
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
	</div>
</body>
</html>



				  