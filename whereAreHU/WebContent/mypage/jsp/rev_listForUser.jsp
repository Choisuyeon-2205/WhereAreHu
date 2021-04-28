<%@page import="model.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 리뷰 목록</title>
<style>
</style>
</head>
<body>
	<c:set var="cPath" value="${pageContext.request.contextPath }" />
	<div class="profile-reviews tab">
		<h1>내가쓴 리뷰 확인하기</h1>
		<table class="reviewCheck">
			<thead>
				<tr>
					<td>리뷰 번호</td>
					<td>회원ID</td>
					<td>휴게소 번호</td>
					<td>별점</td>
					<td>작성일자</td>
					<td>사진</td>
				</tr>
			</thead>
			
			<c:forEach var="rev" items="${revlist }">
				<tr>
					<td>${rev.review_id }</td>
					<td>${rev.user_id }</td>
					<td>${rev.area_num }</td>
					<td>${rev.rate }</td>
					<td>${rev.write_day }</td>
					<td><img src="${cPath }/upload/${rev.photo}" width="100px"
						height="100px" />
				</tr>
				<tr>
					<td colspan="6">${rev.review }</td>
				</tr>
			</c:forEach>
		</table>
		</div>
		
</body>
</html>