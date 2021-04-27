<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 입력</title>

<style>
	#review 
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
	
      $('#star_rate').barrating({
        theme: 'fontawesome-stars'
      });
      
      $('#star_rate').barrating({
    		theme: 'fontawesome-stars'
    		, initialRating: 3
    	});
      
      $('#star_rate').barrating({
    		theme: 'fontawesome-stars'
    		, readonly: true
      });
      
/*       $('#star_rate').barrating({
    		theme: 'fontawesome-stars'
    		, onSelect: function(value, text, event){
    			// 별점 클릭 후 처리는 여기서 코드
    			// 선택한 별점 값을 value로 받음
    		}
    	}); */
    	
    	$.ajax({
    		url: "../review/rev_list.jsp",
    		type: "get",
    		data: "revlist=" + $(revlist),
    		success: function(responseData) {
    			console.log(responseData);
    			$("#revlist").html(responseData);
    		},
    		error: function() {}
    	});
    	
    	$("#instBtn").on("click", function() {
    		$.ajax({
    			url: "../review/revewInsert",
    			type: "post",
    			data:$("#revForm").serialize(),
    			contentType: "multipart/form-data; charset=UTF-8",
    			success: function(responseData) {
    				console.log(responseData);
    				$("#revlist").html(responseData);
    				$("#review").text("");
    			},
    			error: function() {}
    		});
    	});
    	
});
</script>
</head>
<body>
<div id="content" class="parent">
	<form id="revForm" class="child" action="selectDetail" method="post" enctype="multipart/form-data">
		<select id="star_rate" name="rate">
			<option value="1.0">1</option>
			<option value="2.0">2</option>
			<option value="3.0">3</option>
			<option value="4.0">4</option>
			<option value="5.0">5</option>
		</select><br>
		<textarea id="review" name="review" cols="80" rows="6"></textarea><br>
		<input type="file" name="photo">
		<button id=instBtn>등록하기</button>
	</form>
</div>
<body>
</html>