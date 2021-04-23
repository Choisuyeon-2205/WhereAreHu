<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${area_name}의 대표메뉴</h1>
<table>
	<tr>
		<td>음식이름</td><td>음식설명</td><td>음식가격</td><td>음식BEST여부</td>
	</tr>
	<c:forEach var="food" items="${foodlist}">
	<tr>
		<td>${food.getFood_name()}</td>
		<td>${food.getFood_context()}</td>
		<td>${food.getFood_cost()}</td>
		<td>${food.getFood_best()}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>