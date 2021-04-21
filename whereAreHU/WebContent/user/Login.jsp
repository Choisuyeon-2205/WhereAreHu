<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">LOGIN PAGE</h1>

<table>


<form action="loginChk" method ="post">
<tr><td>UserID:</td><td><input type="text" name="user_id"></td></tr><br><br>
<tr><td>Password:</td><td><input type="password" name="user_pw"></td></tr><br><br>
</table><br>
<input type="submit" value="Login">

</form>
<table>
<tr><td>

<form action="create.jsp" method="post"></td></tr>
<tr><td><p> 계정이 없으신가요?  </p></td>
<td><input type="submit" value="Signup"></td></tr>
</table>

</form>

</body>
</html>