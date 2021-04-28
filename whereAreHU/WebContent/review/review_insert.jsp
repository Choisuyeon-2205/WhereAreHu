<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.min.js" integrity="sha384-qlmct0AOBiA2VPZkMY3+2WqkHtIQ9lSdAsAn5RUJD/3vA5MKDgSGcdmIv4ycVxyn" crossorigin="anonymous"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="../review/dist/themes/fontawesome-stars.css">
<script type="text/javascript" src="../review/dist/jquery.barrating.min.js"></script>
<title>리뷰 입력</title>

<style>
	#revText
	{
		border-radius: 10px;
		margin: 0 0 20px 0;
	}
	
	.parent {
		position: relative;
		width: 650px;
		height: 300px;
		margin: 10px auto;
	}
	
	.child {
		position: absolute;
		left: 50%; 
		transform: translateX(-50%);
	}
	
	#instBtn {
		position: absolute;
		right: 0%;
	}
	
	div.br-widget {
		position: absolute;
		left: 50%; 
		margin-bottom: 10px;
		transform: translateX(-50%);
	}
	
	textarea {
		padding: 15px;
	}
	
	textarea:focus {outline:none;}
</style>
<script>
$(function() {
 		$('#revStar').barrating({
			theme : 'fontawesome-stars'
		});

 		$('#revStar').barrating({
			theme : 'fontawesome-stars',
			initialRating : 3
		}); 

 		$('#revStar').barrating({
			theme : 'fontawesome-stars',
			readonly : true
		});
 
		$.ajax({
			url : "../review/reviewList",
			type : "get",
			data : {
				"area_num" : "${area_num}"
			},
			success : function(responseData) {
				$("#revlist").html(responseData);
			},
			error : function() {
			}
		});
		
		$("#instBtn").on("click", function() {
			$("#revForm").ajaxForm({
				url : "../review/reviewInsert",
				type : "post",
				enctype : "multipart/form-data",
				processData : false,
				contentType : false,
				success : function(responseText) {
					$("#revlist").html(responseText);
					$("#revText").val('');
					$("#upload").val('');
					$('#revStar').barrating('clear');
				},
				error : function(e) {
					console.log(e);
				}
			});
		});
	});
</script>
</head>
<body>
<div id="content" class="parent">
	<form id="revForm" class="child">
		<select id="revStar" name="rate">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select><br>
		<textarea id="revText" name="review" cols="80" rows="6"></textarea><br>
		<input type="hidden" name="area_num" value=${sarea.area_num }>
		<input type="file" id="upload" name="photo">
		<button id="instBtn">등록하기</button>	
	</form>
</div>
<body>
</html>