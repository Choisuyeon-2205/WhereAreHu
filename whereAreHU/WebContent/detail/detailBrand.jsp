<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where? 휴식이 있는 곳!</title>
<link rel="shortcut icon" sizes="76x76" type="image/x-icon" href="../list/image/small_logo_icon.png">
</head>
<style>
body{
	background-color: lightgray;
}
* {
  box-sizing: border-box;
  padding: 0;
}

header {
  max-width: 1000px;
  margin: 15vh auto;
}

h1 {
  text-align: center;
  font-family: Source Sans Pro, sans-serif;
  font-size: 35px;
}
header p {
 text-align: center;
}

.cards {
  text-align: center;
  list-style: none;
  width:1600px;
}

.card {
  margin: 1rem;
  padding: 1rem;
  background-color: #F0B6B6;
  border-radius: 0.5rem;
  box-shadow: 0 0 6rem rgba(black, 0.1);
  width:450px;
  list-style-type: none;
  display: inline-block;
  * {
    margin-bottom: 1rem;
  }
}
 #brandMain {
	background:#fff;
	border:1px solid #222;
	padding: 20px;
	width: 1600px;	
	margin:30px auto;
}
.wrapper {

  /*This part is important for centering*/
  display: flex;
  align-items: center;
  justify-content: center;
}
.typing-demo {
  width: 44ch;
  animation: typing 2s steps(22), blink .5s step-end infinite alternate;
  white-space: nowrap;
  overflow: hidden;
  border-right: 3px solid;
  font-family: monospace;
  font-size: 1em;
}
@keyframes typing {
  from {
    width: 0
  }
} 
@keyframes blink {
  50% {
    border-color: transparent
  }
}
</style>
<body>
<div id="brandMain">
<header>
  <h1>${area_name}의 브랜드매장</h1>
  <div class="wrapper">
    <div class="typing-demo">
      ${area_name}와 함께 즐거운 여행 되세요!
    </div>
  </div>
</header>
<main>
  <ul class="cards">
  	<c:forEach var="brand" items="${brandlist}">
    <li class="card">
      <h2>${brand.brand_name}</h2>
      <p>${brand.brand_text}</p>
      <p>오픈시간:&nbsp${brand.brand_start}</p>
      <p>마감시간:&nbsp${brand.brand_end}</p>
    </li>
    </c:forEach>
  </ul>
</main>
</div>
</body>
</html>