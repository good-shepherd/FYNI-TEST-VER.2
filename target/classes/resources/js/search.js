function searchResult(event_ID) {
	$.ajax({
		 url : "eventRead.do",
		 type : 'post',
		 data : {"event_ID": event_ID},
		 success : function(result,status,xhr){
			$("#main-div").replaceWith(result);
			var container = document.getElementById('map');
			var y = parseFloat($("#locX").text());
			var x = parseFloat($("#locY").text());
			var options = {
				center: new daum.maps.LatLng(x, y),
				level: 3
			};
			var map = new daum.maps.Map(container, options);
			
			var markerPosition  = new daum.maps.LatLng(x, y); 

			var marker = new daum.maps.Marker({
			    position: markerPosition
			});

			marker.setMap(map);
		 }
	 });
}

$(document).ready(function(){

var index = document.querySelector('#coordlistsize').innerHTML;
var positions = [];
for (i = 0; i < index; i++) {
	var tmp = '#coord' + i;
	var coordtmp = document.querySelector(tmp).innerHTML;
	var ll = coordtmp.split(" ");
	var y = parseFloat(ll[0]);
	var x = parseFloat(ll[1]);
	positions[i] = 
	{ 
	  title: '음음' + i,
	  latlng: new daum.maps.LatLng(x, y)
	}
}
console.log(positions);

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new daum.maps.LatLng(37.38367502882813, 127.11225525089476), // 지도의 중심좌표
    level: 6 // 지도의 확대 레벨
};
var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커 이미지의 이미지 주소입니다
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new daum.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}
	
});