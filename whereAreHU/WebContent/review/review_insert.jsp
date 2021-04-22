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
<form action="reviewInsert" method="post" enctype="multipart/form-data">
	<select id="star_rate" name="star_rate">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
	</select><br>
	<label for="review">리뷰 입력</label><br>
	<textarea id="review" name="review" cols="80" rows="5"></textarea><br>
	<label for="photo">사진 업로드</label><br>
	<input type="file" name="photo">
	<input type="submit" value="등록하기">
</form>
</body>
</html>