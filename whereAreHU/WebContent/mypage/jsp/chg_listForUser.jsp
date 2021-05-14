<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	
.changeButton1, .changeButton2 {	
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
<body>
	<div class="profile-user tab" style="
			
			padding: 20px 360px;
		 	width: 100%;
		 	height : 500px;
		 	text-align: center;">
		<div style="background: rgba(233, 233, 233,0.7); height : 450px ">
		<br>
		<h1>회원정보 수정</h1>
		<form action ="changeByUserList" method="post" >
			<ul id="ChangeInfo" style = "">
				<li><label for="user_id">아이디</label> 
				<input type="text"id="user_id" name = "user_id" value="${user_id}" readonly="readonly" style="text-align: center; background-color: none"></li>
				<br>
				<li><label for="user_name">이름</label> 
				<input type="text" id="user_name" name = "user_name" value="${username}" readonly="readonly" style="text-align: center;" ></li>
				<br>
				<li><label for="user_pw">비밀번호</label> 
				<input type="text" id="user_pw" name = "user_pw" ></li>
				<br>
				<li><label for="mail">이메일</label> 
				<input type="email" id="user_email" name = "user_email" ></li>
				<br>
				<li><label for="phone">연락처</label> 
				<input type="tel" id="user_phone" name = "user_phone" ></li>
			</ul>
			<br>
			<br>
			
				<div>
					<button class="changeButton1" type="submit">수정하기</button>
					<button class="changeButton2" type="reset">취소하기</button>
				</div>
				
		</form>
		</div>
	</div>
</body>
</html>