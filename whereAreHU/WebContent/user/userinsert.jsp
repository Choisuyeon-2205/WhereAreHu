<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form action="userInsert" method="post" >
ID:<input type="text" name="user_id"  ><br>
PW:<input type="password" name="user_pw"  ><br>
이름:<input type="text" name="user_name"  ><br>
연락처:<input type="text" name="user_phone"  ><br>
Email:<input type="text" name="user_email"  ><br>
<input type="submit" value="입력하기"><br>
</form>
</body>
</html>