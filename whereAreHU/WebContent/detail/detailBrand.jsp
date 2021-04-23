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
		<td>브랜드명</td><td>브랜드내용</td><td>오픈시간</td><td>마감시간</td>
	</tr>
	<c:forEach var="brand" items="${brandlist}">
	<tr>
		<td>${brand.getBrand_name()}</td>
		<td>${brand.getBrand_text()}</td>
		<td>${brand.getBrand_start()}</td>
		<td>${brand.getBrand_end()}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>