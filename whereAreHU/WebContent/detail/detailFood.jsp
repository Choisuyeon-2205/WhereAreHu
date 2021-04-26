<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
* {
  box-sizing: border-box;
  padding: 0;
}

header {
  max-width: 1000px;
  margin: 24vh auto;
}

h1 {
  color: #1fab89;
  text-align: center;
  font-family: Source Sans Pro, sans-serif;
  line-height: 3em;
  font-size: 50px;
  line-height: 1.1;
}
h2 {
	display: inline-block;
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
  background-color: #d7fbe8;
  border-radius: 0.5rem;
  box-shadow: 0 0 6rem rgba(black, 0.1);
  width:450px;
  list-style-type: none;
  display: inline-block;
  * {
    margin-bottom: 1rem;
  }
}
</style>
<body>
<header>
<h1>${area_name}의 대표메뉴</h1>
</header>
<hr>
<main>
  <ul class="cards">
  	<c:forEach var="food" items="${foodlist}">
    <li class="card">
      <h2>${food.food_name}</h2>
      <c:if test="${food.food_best eq 'Y'}">
		<img src="../images/thumb2.png" width="50px" height="50px">
   	  </c:if>
      <p>${food.food_context}</p>
      <p>가격: ${food.food_cost}</p>
    </li>
    </c:forEach>
  </ul>
</main>
</body>
</html>