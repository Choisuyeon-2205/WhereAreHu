<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script 	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
</script>
  <link rel="stylesheet" type="text/css" href="./style2.css">
<meta charset="UTF-8">
<title>Sign up</title>

<script>

	function pw_check() {
		var password1 = $("#pw").val();
		var password2 = $("#pw2").val();
		if (password1 != password2) {
			alert("비밀번호가 일치하지 않습니다.");
			$('#pw2').val('');
			$('#pw2').focus();
		}
	}

	function id_check() {
		var user_id = $("#user_id").val();

		$.ajax({
			type : "POST",
			url : "Confirm",
			data : {
				"user_id" : $('#user_id').val()
			},
			success : function(aa) {
				if (aa == "true") {
					alert("중복된 아이디입니다.");
					$('#user_id').val('');
					$('#user_id').focus();
				} else {
					alert("사용가능한 아이디입니다.");
				}
			}
		});
	}
</script>
</head>

<body>

	<form action="userInsert" method="post">


    <h1>Sign up</h1>
       <legend> <span class="number">v</span> Your Basic Info</legend>
	<div>
	<a>
		ID:<input type="text" name="user_id" id="user_id" value="">
		</a><a>
		<button type="button" class="btn1" onclick="id_check()">Check</button><br>
</a>
</div>
		 PW:<input type="password" name="user_pw" id="pw" value=""><br>
		PW confirm:<input type="password" name="user_pw" id="pw2" value=""><br>
		Name:<input type="text" name="user_name"><br> 
		Tel:<input type="text" name="user_phone"><br> 
		Email:<input type="text" name="user_email"><br> 
		<input type="submit" value="Sign up" onclick="pw_check()" class ="aa"><br>
		<input type="button" value="BACK" onClick="history.go(-1)"class ="aa"> 

	</form>


</body>
</html>