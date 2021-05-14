<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 좋아요 목록</title>
  <style>
    table, th, td {
      border:2px double #ccc;
      border-collapse: collapse;
    }
    th, td { padding:10px 20px; }
  </style>

</head>
<body>
	<c:set var="cPath" value="${pageContext.request.contextPath }" />
	<div class="profile-good tab"  >
		<h1>내가누른 좋아요 확인하기</h1>
		<table class="goodCheck">
			<thead>
				<tr style="background: #62d2a2">
					<th>휴게소 이름</th>
					<th>휴게소 주소</th>
					<th>휴게소 추천</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="good" items="${arealist}">
				<tr style="background: rgba(233, 233, 233,0.7)">
					<td>${good.area_name }</td>
					<td>${good.address }</td>
					<td>${good.thumbsup }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>