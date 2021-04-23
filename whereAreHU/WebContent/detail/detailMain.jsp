<%@page import="model.ServiceAreaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴게소 상세정보 조회</title>
<%
ServiceAreaVO sarea= (ServiceAreaVO)request.getAttribute("sarea");
%>
<script>
$(function(){
	$("#back").click(function(){
		window.history.back();
	});
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
</style>
</head>
<body>
	<img src="../images/back.png" id="back" width="30px" height="30px">
	<div class="header">
		<h1>${sarea.getArea_name()}</h1>
		<h4>♥</h4>
		<h5>좋아요</h5>
	</div>
	<hr>
	<div class="detail">
		<span class="et-detail" id="info">
			<h2>상세 정보</h2><br>
			주소: ${sarea.getAddress()}<br>
			노선: ${sarea.getRoute()}<br>
			대표 전화번호: ${sarea.getArea_phone()}<br>
			지사명: ${sarea.getFname()}<br>
			<% String str= sarea.getIsGas()==1?"주유소":"휴게소"; %>
			주유소/휴게소: <%=str %><br>
			<% String str2= sarea.getDescend()==1?"하행":"상행"; %>
			상/하행: <%=str2 %><br>
			대표 전화번호: ${sarea.getMinicar()}<br>
			소형차 주차대수: ${sarea.getLargecar()}<br>
			대형차 주차대수: ${sarea.getOthercar()}<br>
			장애인 주차대수: ${sarea.getThumbsup()}<br>
		</span>
		<span class="et-detail" id="map">
			<h1>지도api</h1><br>
			<h3>something about 지도api</h3>
		</span>
	</div>
	<div class="buttons">
		<input type="button" id="food" value="대표음식" onclick="location.href='selectDetailFood?area_num=${sarea.getArea_num()}&area_name=${sarea.getArea_name()}'"/> 
		<input type="button" id="oil" value="주유소" /> 
		<input type="button" id="brand" value="브랜드매장" />
	</div>
	<%--
	<jsp:include page="../review/reviewMain.jsp"></jsp:include>
	 --%> 
</body>
</html>