<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주소로 장소 표시하기</title>

</head>
<body>
	<div id="map" style="width: 100%; height: 350px;"></div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c56a6eb2f52326a2d1fc7cc609c535ad&libraries=services"></script>
	<script>
$(function() {
	//위의 내용에서 session에서 area_num을 조건문으로 일치하는 sVarAddr을 얻어 addr에 저장해 해당 위치를 자동으로 얻어냄  

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
	
	var stopAddr = "${sarea.address}";

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	//geocoder.addressSearch(addr, function(result, status) {
	geocoder.addressSearch(stopAddr, function(result, status) {
	
		function f1(msg) {
			 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		        	content: '<div style="width:150px;text-align:center;padding:6px 0;"> ${sarea.area_name} <br><a href="' + msg + '">길찾기</a></div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);	
		}
		
		
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	    	 if (navigator.geolocation) {
	    		    
	    		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    		    navigator.geolocation.getCurrentPosition(function(position) {
	    		        
	    		        var myLoc = position.coords.latitude + ',' + position.coords.longitude;
						var msg = "https://map.kakao.com/link/from/현위치," + myLoc + "/to/${sarea.area_name }," + result[0].y + "," + result[0].x;
						f1(msg);
	    		     });
	    		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

	    				//var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);  
						var msg = "https://map.kakao.com/link/to/${sarea.area_name }," + result[0].y + "," + result[0].x;
						f1(msg);
	    		}	   
	     } 
		    
	});
});
	
</script>
</body>
</html>