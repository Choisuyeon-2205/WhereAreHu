<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>


</style>
<body>
	<div class="profile-user tab">
		<h1>회원정보 수정</h1>
		<form action ="changeByUserList" method="post">
			<ul id="ChangeInfo">
				<li><label for="user_id">아이디</label> 
				<input type="text"id="user_id" name = "user_id" value="${user_id}" readonly="readonly"></li>
				
				<li><label for="user_name">이름</label> 
				<input type="text" id="user_name" name = "user_name" value="${username}" readonly="readonly" ></li>
				
				<li><label for="user_pw">비밀번호</label> 
				<input type="text" id="user_pw" name = "user_pw" ></li>
				
				<li><label for="mail">이메일</label> 
				<input type="email" id="user_email" name = "user_email" ></li>
				
				<li><label for="phone">연락처</label> 
				<input type="tel" id="user_phone" name = "user_phone" ></li>
			</ul>
			<br>
				<div>
					<button class="changeButton1" type="submit">수정하기</button>
					<button class="changeButton2" type="reset">뒤로가기</button>
				</div>
		</form>
	</div>
</body>
</html>