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
#oil_header { font:  'Source Sans Pro', Arial, sans-serif; background: #becccc; text-transform: uppercase; color: #fff; text-align: center; letter-spacing: -3px; padding-top: 20px; padding-bottom: 20px; }
body {
	background-color: lightgray;
}
h1 {
  text-shadow:     0 1px 0 hsl(174,5%,80%),
                   0 2px 0 hsl(174,5%,75%),
                   0 3px 0 hsl(174,5%,70%),
                   0 4px 0 hsl(174,5%,66%),
                   0 5px 0 hsl(174,5%,64%),
                   0 6px 0 hsl(174,5%,62%),
                   0 7px 0 hsl(174,5%,61%),
                   0 8px 0 hsl(174,5%,60%),
                   0 0 5px rgba(0,0,0,.05),
                  0 1px 3px rgba(0,0,0,.2),
                  0 3px 5px rgba(0,0,0,.2),
                 0 5px 10px rgba(0,0,0,.2),
                0 10px 10px rgba(0,0,0,.2),
                0 20px 20px rgba(0,0,0,.3);
}
#oil {
  text-align: center;
  width:1000px;
  display: inline-block;
  margin:auto;
}

p{
  font-size: 20px;
  font-family:'맑은 고딕';
}
#oilMain {
	background:#fff;
	border:1px solid #222;
	padding: 20px;
	width: 1100px;	
	margin:30px auto;
}
#oil_header{
	text-align: center;
}
main{
	text-align: center;
}
</style>
<body>
<div id="oilMain">
<header id="oil_header">
	<div id="title"><h1>${oil.oil_name} 정보</h1></div>
	<c:if test="${oil.oislpg eq 'Y'}">
		<img src="images/icon_LPG.png" width="50px" height="50px">
    </c:if>
    <p>운영시간: ${oil.oil_start} ~ ${oil.oil_end} </p>
</header><br>
<main>
    <div id="oil">
	    <p>방향: ${oil.oil_dire}</p>
	    <p>전화번호: ${oil.oil_tel}</p>
	    <p>정유사: ${oil.oil_firm}</p>
	    <p>휘발유 가격: ${oil.gprice}</p>
	    <p>경유 가격: ${oil.dprice}</p>
    </div>
 </main>
</div>
</body>
</html>