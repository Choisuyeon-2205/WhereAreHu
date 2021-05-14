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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="../review/dist/themes/fontawesome-stars.css">
<script type="text/javascript" src="../review/dist/jquery.barrating.min.js"></script>
<title>리뷰 입력</title>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

<style>
	#revText
	{
		border-radius: 10px;
		margin: 0 0 20px 0;
		width: 800px;
		font-size: 0.9em;
	}
	
	.parent {
		position: relative;
		width: 650px;
		height: 200px;
		margin: 30px auto;
	}
	
	.child {
		position: absolute;
		left: 50%; 
		transform: translateX(-50%);
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
	
	#instBtn {
		width: 90px;
		height: 30px;
		padding: 1px 6px;
		position: absolute;
		right: 0%;
		cursor: pointer;
		min-width: auto;
		line-height: normal;
		font-size: 0.7em;
	}
	#upload{
		cursor: pointer;
		font-size: 0.8em;
	}
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
 
 		//리뷰 조회 ajax
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
 		
		//리뷰 입력 ajax 		
	   $("#instBtn").on("click", function(){
		    // Get form
	        var form = $('#revForm')[0];

		    // Create an FormData object 
	        var data = new FormData(form);

		   $.ajax({
	            type: "POST",
	            enctype: 'multipart/form-data',
	            url: "../review/reviewInsert",
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            success: function (data) {
	            	$("#revlist").html(data);
					$("#revText").val('');
					$("#upload").val('');
					$('#revStar').barrating('clear');
	            },
	            error: function (e) {
	                console.log("ERROR : ", e);
	            }
	        });
	   });

		//로그인 상태가 아닌데 리뷰 작성을 누를 시 자동 redirect
		$("#revText").on("click", function() {
			if (${empty sessionScope.user_id}) { //session값이 비었는지 확인해줌
				location.replace('../user/loginChk');
			}
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
		<textarea id="revText" name="review" cols="80" rows="6" placeholder="여기에 리뷰를 작성해주세요. 별점 체크도 필수!"></textarea><br>
		<input type="hidden" name="area_num" value=${sarea.area_num }>
		<input type="file" id="upload" name="photo">
		<input type="button" id="instBtn" value="등록하기">
	</form>
</div>
<body>
</html>