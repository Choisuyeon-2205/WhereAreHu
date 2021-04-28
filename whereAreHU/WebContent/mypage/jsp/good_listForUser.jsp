<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 좋아요 목록</title>
<style>
</style>
</head>
<body>
	<c:set var="cPath" value="${pageContext.request.contextPath }" />
	<div class="profile-good tab">
		<h1>내가누른 좋아요 확인하기</h1>
		<table class="goodCheck">
			<thead>
				<tr>
					<td>휴게소 이름</td>
					<td>휴게소 주소</td>
					<td>휴게소 추천</td>
				</tr>
			</thead>

			<c:forEach var="good" items="${arealist}">
				<tr>
					<td>${good.area_name }</td>
					<td>${good.address }</td>
					<td>${good.thumbsup }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>