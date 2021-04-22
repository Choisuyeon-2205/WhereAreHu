<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">

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
		<h1>Signup PAGE</h1>
		<hr>
		ID:<input type="text" name="user_id" id="user_id" value="">
		<button type="button" class="id_overlap_button" onclick="id_check()">중복검사</button><br>
		 PW:<input type="password" name="user_pw" id="pw" value=""><br>
		PW confirm:<input type="password" name="user_pw" id="pw2" value=""><br>
		이름:<input type="text" name="user_name"><br> 
		연락처:<input type="text" name="user_phone"><br> 
		Email:<input type="text" name="user_email"><br> 
		<input type="submit" value="회원가입" onclick="pw_check()"><br>
		<input type="button" value="BACK" onClick="history.go(-1)"> 
	</form>

</body>
</html>