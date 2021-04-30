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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="../review/imgbox.css">
<style>
table { width: 600px; margin: 20px auto; border-collapse: collapse; }
tr:nth-child(odd) {padding: 5px;}
tr:nth-child(even) { background-color:#FAFAFA; height: 100px; } 
.star {width: 120px; }
.writeinfo {color: gray; font-size: 11px;}
.writeDel { color: gray; font-size: 11px; text-align: right; }
.img1 {border:white; width: 120px; height: 120px; text-align: center; vertical-align:middle; }
.img2 {border:white; width: 120px; height: 120px; text-align: center; vertical-align:middle; cursor: pointer;}
#delRev { cursor: pointer; font-weight: normal;}
</style>
<script>
$(function() {
	$(".pic").on("click", function() {
			fnImgPop(this.src);
	});
		
	function fnImgPop(url){
		boximg.src=url
		imgbox.style.display="block";
	}	  
	
	$("#imgbox").on("click", function() {
			imgbox.style.display="none"
	});
	
});

	//리뷰 삭제
	function delRev(id, area) {
		if (confirm("정말 삭제하시겠습니까?")) {
			$.ajax({
				url : "../review/reviewDelete",
				type : "get",
				data : {
					"review_id" : id, 
					"area_num" : area
				},
				success : function(responseData) {
					$("#revlist").html(responseData);
				},
				error : function() {
				}
			});
		} else {
			
		}
	}
</script>
</head>
<body>
<c:set var="cPath" value="${pageContext.request.contextPath}/upload/"/>
<table>
<c:forEach var="rev" items="${revlist }">
<tr>
	<td class="star">
	<c:forEach var="i" step="1" begin="1" end="${rev.rate }">
	<img src="../review/star.png" width="15" height="15">
	</c:forEach>
	<c:forEach var="i" step="1" begin="${rev.rate }" end="4">
	<img src="../review/star2.png" width="15" height="15">
	</c:forEach> 
	</td>
	<td class="writeinfo">${rev.user_id } | ${rev.write_day }</td>
	<td class="writeDel">
	<c:if test="${rev.user_id == sessionScope.user_id}"><strong id="delRev" onclick="delRev(${rev.review_id}, '${rev.area_num }')">삭제</strong>
	</c:if></td>
	<td><c:if test="${rev.user_id != sessionScope.user_id}"></c:if></td>
</tr>
<tr>
	<td colspan="2">${rev.review }</td>
	<c:if test="${empty rev.photo }"><td class="img1"></td></c:if>
	<c:if test="${not empty rev.photo }"><td class="img2"><img src="${cPath }${rev.photo}" width="100px" height="100px" class="pic"></td></c:if>	
</tr>
</c:forEach>
</table>
<div id="imgbox">
	<img src="${cPath }/upload/${rev.photo}" alt="" id="boximg">
</div>
</body>
</html>