<%@page import="model.ServiceAreaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴게소 상세정보 조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	var like_me = ${like_me};
	
	$("#back").click(function(){
		window.history.back();
	});
	$("#like").on("click", function(){
		alert("*" + like_me + "*");
		if(like_me===1){
			$(this).css("background-color", "lightgray");
		}else{
			$(this).css("background-color", "red");
		}
		$.ajax({
			url:"updateGood?user_id=oh&area_num=000485",
			type: "post",
			success: function(data){	
				alert(data);
				$("#like_num").text(data.like);
				location.reload();
			},
			error: function(){}
		});
	});
	if(like_me===1)
		$("#like").css("background-color", "red");
});
</script>
<style type="text/css">
.header, .detail, .buttons {
	text-align: center;
	margin-top: 10px;
}

h1 {
	font-weight: bold;
	font-family: "맑은 고딕 bold";
	font-size: 60px;
}

h1, h2, h3, h4, h5 {
	display: inline-block;
}

h4 {
	color: red;
}

span {
	display: inline-block;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-right: 100px;
	background-color: #d7fbe8;
	padding: 15px;
	padding-left: 100px;
	padding-right: 100px;
	border-radius: 10px;
}

input[type=button] {
	background-color: lightgray;
	padding: 20px;
	padding-left: 40px;
	padding-right: 40px;
	border-left: 30px;
	margin-left: 100px;
	margin-top: 15px;
	border-radius: 10px;
	font-size: 20px;
}

.buttons {
	background-color: #1fab89;
	height: 100px;
	border-radius: 10px;
}

p {
	font-family: "맑은 고딕";
}
#rev{
	font-family: "Cooper Blk BT";
	font-size: 20px;
}

#revlist {
	width: 800px;
	margin: 10px auto;
	position: relative;
}

table {
	width: 700px;
	margin: 0 auto;
	position: absolute;
}
td {
	text-align: center;
}
#like {
	color="red";
}
</style>
</head>
<body>
	<img src="images/back.png" id="back" width="30px" height="30px">
	<div class="header">
		<h1>${sarea.area_name}</h1>
		<c:if test="${like_me!=-1 }">
			<button type="button" id="like">♡</button>
		</c:if>
		<h5>좋아요 수: <span id="like_num">${like_num}</span></h5>
		<div><jsp:include page="../common/header.jsp"/></div>
	</div>
	<hr>
	<div class="detail">
		<span class="et-detail" id="info">
			<h2>상세 정보</h2><br>
			주소: ${sarea.address}<br>
			노선: ${sarea.route}<br>
			대표 전화번호: ${sarea.area_phone}<br>
			지사명: ${sarea.fname}<br>
			주유소/휴게소: ${sarea.isGas==1?"주유소":"휴게소"}<br>
			상/하행: ${sarea.descend==1?"하행":"상행"}<br>
			대표 전화번호: ${sarea.minicar}<br>
			소형차 주차대수: ${sarea.largecar}<br>
			대형차 주차대수: ${sarea.othercar}<br>
			장애인 주차대수: ${sarea.thumbsup}<br>
		</span>
		<span class="et-detail" id="map">
			<jsp:include page="../review/kakaoMap.jsp" />
		</span>
	</div>
	<div class="buttons">
		<input type="button" id="food" value="대표음식" 
		onclick="location.href='selectDetailFood?area_num=${sarea.area_num}&area_name=${sarea.area_name}'"> 
		<input type="button" id="oil" value="주유소" onclick="location.href='selectDetailOil?area_num=${sarea.area_num}&area_name=${sarea.area_name}'"/> 
		<input type="button" id="brand" value="브랜드매장" onclick="location.href='selectDetailBrand?area_num=${sarea.area_num}&area_name=${sarea.area_name}'"/>
	</div>
	<div id="revlist">
	<jsp:include page="../review/rev_list.jsp">
		<jsp:param name="revlist" value="${revlist}" />
	</jsp:include>
	</div>
</body>
</html>