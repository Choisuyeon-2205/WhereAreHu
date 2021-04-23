<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${oil.getOil_name()} 정보</h1>
방향: ${oil.getOil_dire()}<br>
전화번호: ${oil.getOil_tel()}<br> 
정유사: ${oil.getOil_firm()}<br>
lpg주유소인지: ${oil.getOislpg()}<br>
휘발유 가격: ${oil.getGprice()}<br>
경유 가격: ${oil.getDprice()}<br>
lpg 가격: ${oil.getLprice()}<br>
오픈시간: ${oil.getOil_start()}<br>
마감시간: ${oil.getOil_end()}<br>
</body>
</html>