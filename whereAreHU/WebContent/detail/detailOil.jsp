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
header, main {
  max-width: 1000px;
  margin: 24vh auto;
}

h1 {
  color: #1fab89;
  text-align: center;
  font-family: Source Sans Pro, sans-serif;
  font-size: 50px;
  display: inline-block;
}

#oil {
  text-align: center;
  background-color: #d7fbe8;
  width:1000px;
  display: inline-block;
  margin:auto;
}

p{
  font-size: 20px;
  font-family:'맑은 고딕';
}
</style>
<body>
<header>
	<h1>${oil.oil_name} 정보</h1>
	<c:if test="${oil.oislpg eq 'Y'}">
		<img src="../images/icon_LPG.png" width="50px" height="50px">
    </c:if>
    <p>운영시간: ${oil.oil_start} ~ ${oil.oil_end} </p>
</header>
<main>
    <div id="oil">
	    <p>방향: ${oil.oil_dire}</p>
	    <p>전화번호: ${oil.oil_tel}</p>
	    <p>정유사: ${oil.oil_firm}</p>
	    <p>휘발유 가격: ${oil.gprice}</p>
	    <p>경유 가격: ${oil.dprice}</p>
    </div>
  </main>
</body>
</html>