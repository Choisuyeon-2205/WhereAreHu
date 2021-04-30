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
	<table class="right_section" id="table" cellspacing="3" cellpadding="3"
		border="3">

		<tr class="service_table">
			<th onclick="sortTable(0)" class="service1"><span
				class="smalltext"><strong>휴게소명</strong></span></th>
			<th onclick="sortTable(1)" class="service2"><span
				class="smalltext"><strong>주소</strong></span></th>
			<th onclick="sortTable(2)" class="service2"><span
				class="smalltext"><strong>추천 수</strong></span></th>

		</tr>
		<c:forEach var="route" items="${routelist}">
			<tr id=result_section
				onclick="location.href='../detail/selectDetail?area_num=${route.area_num }'">
				<td>${route.area_name }</td>
				<td>${route.address }</td>
				<td>${route.thumbsup }</td>
			</tr>


		</c:forEach>





	</table>
</body>
</html>