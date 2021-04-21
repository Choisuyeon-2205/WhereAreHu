<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<link rel="stylesheet" href="dist/themes/fontawesome-stars.css" />
<script type="text/javascript" src="dist/jquery.barrating.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<select id="example">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
</select>

<script type="text/javascript">
   $(function() {
      $('#example').barrating({
        theme: 'fontawesome-stars'
      });
      
      $('#example').barrating({
    		theme: 'fontawesome-stars'
    		, initialRating: 3
    	});
      
      $('#example').barrating({
    		theme: 'fontawesome-stars'
    		, readonly: true
    	});
      
      $('#example').barrating({
    		theme: 'fontawesome-stars'
    		, onSelect: function(value, text, event){
    			// 별점 클릭 후 처리는 여기서 코드
    			// 선택한 별점 값을 value로 받음
    		}
    	});
   });
</script>
</body>
</html>