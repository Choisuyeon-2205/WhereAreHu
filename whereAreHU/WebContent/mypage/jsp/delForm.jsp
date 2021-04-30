<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<style>
.xkfxhl {	
	border: 0;
    padding: 10px;
   
    border-radius: 3px;
    background: #62d2a2;
    color: #fff;
    font-family: "Bree Serif";
    font-size: 1rem;
    margin: 5px 2px;
    cursor: pointer;
    outline: none;
    margin-bottom: 10px;
    transition: background 0.3s ease-in-out;
    box-shadow: 0px 5px 7px 0px rgb(0 0 0 / 30%);
}
</style>
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
<div class="profile-out tab" style="
			 padding: 20px 360px;
		 	 width: 100%;
		 	 height : 500px;
		 	 text-align: center;">
<div style=" height: 400px; background: rgba(233, 233, 233, 0.7)">
<br>
<h1>회원 탈퇴</h1>
<section>
<form action="Deleteuser" method="post" onsubmit="return checkValue()">
<br>
비밀번호 <input type="password" name="user_pw2" id="user_pw2">
<br>
<br>
<br>
저희 서비스 만족 하셨나요?
<br>
<textarea id="hasil" name="hasil" rows="7" cols="38" style="resize: none" placeholder="따듯한 한마디 감사합니다."></textarea>



</form>


<input class="xkfxhl" type="submit" value="회원탈퇴" >
</section>
</div>
</div>
</body>
</html>