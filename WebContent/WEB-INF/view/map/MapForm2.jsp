<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>마커 클러스터러 사용하기</title>
    
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
<p style="margin-top:-12px">
    사용한 데이터를 보시려면 
    <em class="link">
       <a href="/json/map_db.json" target="_blank">여기를 클릭하세요!</a>
    </em>
</p>
<div id="map" style="width:100%;height:350px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7c2e004c3ba14106ee968537c64eb82&libraries=clusterer"></script>
<script>
    var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center : new kakao.maps.LatLng(37.548048, 126.844711), // 지도의 중심좌표 
        level : 5 // 지도의 확대 레벨 
    });
    
    // 마커 클러스터러를 생성합니다 
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 10 // 클러스터 할 최소 지도 레벨 
    });
 
    // 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
    $.get("/js/map_db.json", function(data) {
        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
       var markers = $(data.positions).map(function(i, position) {
            return new kakao.maps.Marker({
                position : new kakao.maps.LatLng(position.LAT, position.LNG)
            });
        });

        // 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers);
    });
    
    kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
    	 var level = map.getLevel()-1;



         // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다

         map.setLevel(level, {anchor: cluster.getCenter()});

     });

</script>
</body>
</html>