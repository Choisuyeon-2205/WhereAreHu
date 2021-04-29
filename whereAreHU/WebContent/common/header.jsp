<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.logininfo{border: 5px dotted green; float: right}
</style>

</head>
<body>
<div class ="logininfo">
	<c:if test="${not empty sessionScope.user_id}">
	<p>${username}님 환영합니다<p>
	<p><a href = "../user/logout">로그아웃</a><p>
	</c:if>
	<c:if test="${empty sessionScope.user_id}">
	<p>비회원<p>
	<p><a href = "../user/loginChk">로그인</a><p>
	</c:if>
	
</div>
</body>
</html>