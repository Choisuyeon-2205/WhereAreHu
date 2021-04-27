<%@page import="model.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 목록</title>
<style>
table, td { border: 1px solid gray; border-collapse: collapse; }
td { padding: 5px; }
tr:first-of-type { background-color: green; }
</style>
</head>
<body>
<c:set var="cPath" value="${pageContext.request.contextPath }"/>
<table>
<tr><td>리뷰 번호</td><td>회원ID</td><td>휴게소 번호</td><td>별점</td><td>글쓴 날짜</td><td>사진</td></tr>
<c:forEach var="rev" items="${revlist }">
<tr>
	<td>${rev.review_id }</td>
	<td>${rev.user_id }</td>
	<td>${rev.area_num }</td>
	<td>${rev.rate }</td>
	<td>${rev.write_day }</td>
	<td><img src="${cPath }/upload/${rev.photo}" width="100px" height="100px"/>
</tr>
<tr>
	<td colspan="6">${rev.review }</td>
</tr>
</c:forEach>
</table>
</body>
</html>