<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script type="text/javascript">
        // 비밀번호 미입력시 경고창
        function checkValue(){
            if($("#user_pw2").val()==""){
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }
        	return true;
        }
    </script>
<meta charset="UTF-8">
<title>회원 탈퇴</title>

</head>
<body>
<section>
<form action="Deleteuser" method="post" onsubmit="return checkValue()">
Pw <input type="password" name="user_pw2" id="user_pw2">
<input type="submit" value="회원탈퇴" >

</form>
</section>
</body>
</html>