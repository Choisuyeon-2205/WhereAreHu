<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 페이지</title>
<style>
h1 { color: green; }
</style>
</head>
<body>
<c:forEach var="review" items="${reviewlist}">
    <li>
      <h2>${review.review_id}</h2>
      <p>${review.user_id}</p>
      <p>가격: ${review.review}</p>
    </li>
</c:forEach>
</body>
</html>