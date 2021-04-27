<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(function() {
		$("#button").on("click", function(){
			//json은 원하는 데이터만 가져오도록 할 수 있어야함
			$(this).css("background-color", "red");
			$.ajax({
				url:"updateGood?user_id=oh&area_num=000485",
				type: "post",
				success: function(responseData){
					
				},
				error: function(){}
			});
		});
	});
	
</script>
<style>
button {
	color="red";
}
</style>


</head>
<body>
<h1>Simple Like Button Effect</h1>
<h2>(Just Click The Heart)</h2>
<button type="button" id="button">♡</button>
</body>
</html>