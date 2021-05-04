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
<link rel="stylesheet" href="../list/css/styles.css"/>
<link rel="stylesheet" href="assets/css/main.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../list/assets/js/jquery.tablesorter.min.js"></script>
<script src="../list/assets/js/jquery.tablesorter.widgets.min.js"></script>
<style>

main {
	margin: 30px 30px;
}

body{
	background-image: url("image/gas_background2.jpg"); 
	background-repeat: no-repeat;
	height: 880px;
	background-size: 100% /* 그림 사이즈 딱 맞게~ */
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
.tablesorter{
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

#text_result_h2{
	color : rgb(44, 44, 84);
	font-weight: bold;
}
</style>



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

		
		<section class = "result_box" style="text-align: center">
					<h2 id = "text_result_h2">검색 결과</h2><br>
			<div class = "needed_left_space" style="overflow:scroll; width: 1050px; height: 500px; margin-left: 150px">				
			

		
			<table id="myTable" class="tablesorter" id="table" cellspacing="2" cellpadding="2" border="2" >
				<thead>
			    <tr class = "oil_table">
					  	<th onclick="sortTable(0)" class="tcat" ><span class="smalltext" style="color: darkorange;"><strong>주유소명</strong></span></th>
						<th onclick="sortTable(1)" class="tcat" ><span class="smalltext" style="color: darkorange;"><strong>지역</strong></span></th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="oil" items="${oillist}" > 
						<tr id = result_section onclick="location.href='../detail/selectDetailOil?area_name=${oil.oil_name}'" ><td>${oil.oil_name}</td><td>${oil.oil_dire}</td></tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
			
		</section>

	
	</div>
	
	<script>
	
	$(document).ready(function(){
		$("#myTable").tablesorter();
	});
		
	
	</script>
</body>
</html>



				  
					
					