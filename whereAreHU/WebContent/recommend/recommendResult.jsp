<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../list/assets/css/main.css" />
<style>
#userid {
	color: rgb(72, 52, 212);
	font-size: 50px;
	font-weight: bold;
}
table { border-collapse: separate; border-spacing: 1px; text-align: center; line-height: 1.5; margin: 20px 10px; }
table th { width: 155px; padding: 10px; font-weight: bold; vertical-align: top; color: black; background-color: #ce4869 ;}
table td { width: 155px; padding: 10px; vertical-align: top; border-bottom: 1px solid black; background-color: #eee;}
h2, h5, table {
	text-align: center;
	margin: auto;
	margin-bottom: 50px;
}
body{
	background-image: url("../list/image/serviceresult_back.jpeg"); 
	background-repeat: no-repeat;
	height: 880px;
	background-size: 100% /* 그림 사이즈 딱 맞게~ */
}
#inline{
	display: inline-block; 
}
.recom_result{
	margin-top: 100px;
}
#text_color_result{
	color: white;
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




<section class = "recom_result">
	<h2 id = "text_color_result"><span id="userid">${sessionScope.user_id}</span>님의 맞춤 추천</h2>
	<h5 id = "text_color_result">${rlist} 지역 [${method=="good"?"추천순":"큰 휴게소순"}] 결과</h5>
</section>
<main>
<table>
  <thead>
	<tr>
		<th>주유소코드</th><th>이름</th><th>주소</th><th>연락처</th><th>노선</th><th>주차대수</th><th>좋아요수</th>
	</tr>
  </thead>
  <tbody>
	<c:forEach  var="sarea" items="${sareas}">
	<tr>
		<td><a href="../detail/selectDetail?area_num=${sarea.area_num}">${sarea.area_num}</a></td>
		<td>${sarea.area_name}</td>
		<td>${sarea.address}</td>
		<td>${sarea.area_phone}</td>
		<td>${sarea.route}</td>
		<td>${sarea.minicar+sarea.largecar+sarea.othercar}</td>
		<td>${sarea.thumbsup}</td>
	</tr>
	</c:forEach>
  </tbody>
</table>
</main>
</div>
</body>
</html>