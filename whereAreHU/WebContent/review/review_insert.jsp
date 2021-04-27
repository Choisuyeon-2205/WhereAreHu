<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 입력</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<link rel="stylesheet" href="review/dist/themes/fontawesome-stars.css" />
<script type="text/javascript" src="review/dist/jquery.barrating.min.js"></script>
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
	
	input[type="submit"] {
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
   });
</script>
</head>
<body>
<div id="content" class="parent">
	<form class="child" action="reviewInsert" method="post" enctype="multipart/form-data">
		<select id="star_rate" name="rate">
			<option value="1.0">1</option>
			<option value="2.0">2</option>
			<option value="3.0">3</option>
			<option value="4.0">4</option>
			<option value="5.0">5</option>
		</select><br>
		<textarea id="review" name="review" cols="80" rows="6"></textarea><br>
		<input type="file" name="photo">
		<input type="submit" value="등록하기">
	</form>
</div>
</body>
</html>