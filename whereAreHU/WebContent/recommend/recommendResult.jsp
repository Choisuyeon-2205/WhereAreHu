<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#userid {
	color: blue;
	font-size: 25px;
}
table { border-collapse: separate; border-spacing: 1px; text-align: center; line-height: 1.5; margin: 20px 10px; }
table th { width: 155px; padding: 10px; font-weight: bold; vertical-align: top; color: #fff; background-color: #ce4869 ;}
table td { width: 155px; padding: 10px; vertical-align: top; border-bottom: 1px solid #ccc; background-color: #eee;}
h2, h5, table {
	text-align: center;
	margin: auto;
	margin-bottom: 50px;
}
</style>
</head>
<body>
<header>
	<h2><span id="userid">${sessionScope.user_id}</span>님의 맞춤 추천</h2>
	<h5>${rlist} 지역 [${method=="good"?"추천순":"큰 휴게소순"}] 결과</h5>
</header>
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
</body>
</html>