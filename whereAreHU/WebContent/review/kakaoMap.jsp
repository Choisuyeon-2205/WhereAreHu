<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>
    
</head>
<body>
<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
        </a>
    </em>
</p>
<div id="map" style="width:100%;height:350px;"></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c56a6eb2f52326a2d1fc7cc609c535ad&libraries=services"></script>
<script>
$(function() {
	//위의 내용에서 session에서 area_num을 조건문으로 일치하는 sVarAddr을 얻어 addr에 저장해서 주소를 얻는 식으로 설계 중  
	var url = "http://data.ex.co.kr/openapi/restinfo/hiwaySvarInfoList?key=9631752245&type=json";
	$.getJSON(url, function (responseData) {
		var arr = responseData["list"];
		for (var data in arr) {
			var elt = arr[data];
			<%session.setAttribute("area_num", "000485");%> //이 부분을 세션으로 전달 받으면 삭제
			var aNum = <%=(String) session.getAttribute("area_num")%> //현재 세션에 저장된 휴게소 번호 불러옴
			for (key in elt) {
				if(key == "svarCd" && elt[key] == aNum) {
					//console.log(elt[key]); //해당하는 key값 확인
					//console.log(elt["svarAddr"]); //해당 area_num을 가진 요소의 주소값 확인
					var stopAddr = elt["svarAddr"];
					var stopName = elt["svarNm"];
					//console.log(stopAddr); //addr에 주소값이 들어갔는지 확인
				}
			};
		}
		
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	//geocoder.addressSearch(addr, function(result, status) {
	geocoder.addressSearch(stopAddr, function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			var msg = 'https://map.kakao.com/link/to/' + stopAddr + ',' + result[0].y + ',' + result[0].x;
			console.log(msg);
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            //content: '<div style="width:150px;text-align:center;padding:6px 0;">' + stopName + '</div>',
	            content: '<a href="' + msg + '">길찾기</a>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});
	})
	
});
</script>
</body>
</html>