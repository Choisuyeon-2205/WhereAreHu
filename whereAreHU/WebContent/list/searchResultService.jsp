<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where? 휴식이 있는 곳!</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../list/assets/css/main.css" />
<link rel="shortcut icon" sizes="76x76" type="image/x-icon" href="image/small_logo_icon.png">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../list/assets/js/jquery.tablesorter.min.js"></script>
<script src="../list/assets/js/jquery.tablesorter.widgets.min.js"></script>



<style>


body{
	background-image: url("image/serviceresult_back.jpeg"); 
	background-repeat: no-repeat;
	height: 880px;
	background-size: 100% /* 그림 사이즈 딱 맞게~ */
}
.result_box{
	width: 80%;
	height: 550px;
	margin : 100px 0 0 30px;
	background-color: rgba(215, 251, 232, 0.6);
	padding: 20px 30px;
	position: relative; /* 위치 이동 */
	top: 20px;
	left: 100px;
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
</style>
<noscript>
	<link rel="stylesheet" href="../list/assets/css/noscript.css" />
</noscript>	



</head>
<body class="index is-preload">
	<div id="page-wrapper" style="margin-left: 80px;">

		<!-- Header -->
		<header id="header" class="alt">
			<h1 id="logo">
				<a href="index.jsp"><strong> <span>whereR</span>Hu
				</strong> </a>
			</h1>
			<nav id="nav">
				<ul>
					<li class="current"><a href="index.jsp">Welcome</a></li>
					
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
				 <h2>검색 결과</h2>
			<section id="section2" style="overflow:scroll; width: 900px; height: 350px; margin-left: 140px;">
			 
	
			 
			 <h4 style="text-align: center; ">※ 테이블명을 누르면 정렬이 실행됩니다</h4>
			 <div id = "here">			 </div>
			  <table id="myTable" class="tablesorter" cellspacing="2" cellpadding="2" border="2" >
			 	<thead>
				  <tr class = "service_table">
				  		<th onclick="sortTable(0)" class="service1" ><span class="smalltext"><strong>휴게소명</strong></span></th>
						<th onclick="sortTable(1)" class="service2" ><span class="smalltext"><strong>추천수</strong></span></th>
				  </tr>
				  </thead>
				  <tbody>
				  <c:forEach var="search" items="${servicesearch}" > 
				  	<tr id = result_section onclick="location.href='../detail/selectDetail?area_num=${search.area_num }'" ><td>${search.area_name }</td><td>${search.thumbsup }</td></tr>
				  
				  </c:forEach>
				  </tbody>
				  




			  	
			  </table>
			
			</section>
		</section>
</div>
	
	<script>
	
/* 	$(function() {
		  $(".tablesorter").tablesorter({
			  widthFixed: false,
			  widgets: ['zebra', 'scroller'],
			  widgetOptions: {scroller_height: 500}
		  });
		  
		  $(window).bind('resize', window_resize);
		  $(window).bind('resizeEnd', function(e){
			  $(window).unbind('resize', window_resize);
		  	$('table.tablesorter').each(function(n,t){
		  		if(typeof t.resizeWidth === 'function') t.resizeWidth();
		  	});
		  	$(window).bind('resize', window_resize);
		  })
	});

	$(function() {
		  $(".tablesorter").tablesorter({ sortList: [[0,0], [1,0]] });
		}); */
	
		
	$(document).ready(function(){
		$("#myTable").tablesorter();
	});
		
	</script>
	

</body>
</html>



				  