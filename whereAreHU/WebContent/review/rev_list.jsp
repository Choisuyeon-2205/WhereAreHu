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
table, td {border: 1px solid gray; border-collapse: collapse; }
table { width: 720px; margin: 20px auto; text-align: center;}
td { width: 120px; padding: 5px; }
tr:nth-child(odd) td:nth-child(odd) { background-color: #d7fbe8; }
/* tr td:last-of-type { width: 150px; } */
tr:nth-child(even) { height: 100px; }
.star {color: #cc9900;}
</style>
</head>
<body>
<c:set var="cPath" value="${pageContext.request.contextPath }"/>
<table>
<c:forEach var="rev" items="${revlist }">
<tr>
	<%-- <td>${rev.review_id }</td> --%>
	<td>아이디</td>
	<td>${rev.user_id }</td>
	<%-- <td>${rev.area_num }</td> --%>
	<td>별점</td>
	<td class="star"><c:choose> 
		<c:when test="${rev.rate == '1'}">★☆☆☆☆</c:when>
		<c:when test="${rev.rate == '2'}">★★☆☆☆</c:when>
		<c:when test="${rev.rate == '3'}">★★★☆☆</c:when>
		<c:when test="${rev.rate == '4'}">★★★★☆</c:when>
		<c:when test="${rev.rate == '5'}">★★★★★</c:when>
	</c:choose></td>
	<td>작성일</td>
	<td>${rev.write_day }</td>
	
</tr>
<tr>
	<c:if test="${empty rev.photo }"><td colspan="6">${rev.review }</td></c:if>
	<c:if test="${not empty rev.photo }">
	<td colspan="5">${rev.review }</td>
	<td ><img src="${cPath }/upload/${rev.photo}" width="100px" height="100px"/></td>
	</c:if>
</tr>
</c:forEach>
</table>
</body>
</html>