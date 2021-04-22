<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="./style.css">
</head>
<body width="100%" height="100%">

<form action="loginChk" method ="post" class="loginForm">	
<h2>LOGIN</h2>
<div class="idForm">
ID<input type="text" name="user_id" class="id"><br>
</div>

<div class="passForm">
PW<input type="password" name="user_pw" class="pw"><br>
</div>
<input type="submit" value="Login" class="btn" onclick="check()">
<form action="userinsert.jsp" method="post">
  <div class="bottomText">
   Don't you have ID?
<input type="submit" value="Signup" class="btn2">
</div>
</form>
</form>


</body>
</html>