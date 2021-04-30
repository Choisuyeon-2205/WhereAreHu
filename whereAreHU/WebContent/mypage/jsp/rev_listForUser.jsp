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
 <style>
    table, th, td {
      border:1px solid #ccc;
      border-collapse: collapse;
    }
    th, td { padding:10px 20px; }
  </style>
<body>
	<c:set var="cPath" value="${pageContext.request.contextPath }" />
	<div class="profile-reviews tab" >
		<h1>내가쓴 리뷰 확인하기</h1>
		<table class="reviewCheck" >
			<thead style="background: rgba(233, 233, 233, 1)">
				<tr>
					<th>리뷰 번호</th>
					<th>회원ID</th>
					<th>휴게소 번호</th>
					<th>별점</th>
					<th>작성일자</th>
					<th>사진</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="rev" items="${revlist }">
				<tr style="background: rgba(233, 233, 233,0.7)">
					<td>${rev.review_id }</td>
					<td>${rev.user_id }</td>
					<td>${rev.area_num }</td>
					<td>${rev.rate }</td>
					<td>${rev.write_day }</td>
					<td><img src="${cPath }/upload/${rev.photo}" width="100px"
						height="100px" />
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
		
</body>
</html>