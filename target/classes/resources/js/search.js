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

function closeDaumPostcode() {
    // iframe을 넣은 element를 안보이게 한다.
	document.getElementById('layer').style.display = 'none';
}

function deleteEvent(event_ID){
	var cnfmdel = confirm("삭제합니다");
	if (cnfmdel == true) {
		$.ajax({
			 url : "eventDelete.do",
			 type : 'post',
			 data : {"event_ID": event_ID},
			 success : function(data){
				 alert(data);
				 location.href = "/app";
			 }
		});
	}
}

function updateEvent(event_ID){
	alert(event_ID);
	$.ajax({
		url : "eventUpdate.do",
		type : 'post',
		data :
		{
			"event_ID" : event_ID
		},
		success : function(data) {
			alert(data);
			$("#main-div").replaceWith(data);
		}
		
	});
}

$(document).ready(function(){
	
	
	$('#submitbtn').on("click", function(e) {
		e.preventDefault();
		var event_Title = $("#event_Title").val();
		var titleValidation = event_Title.trim();
		var event_Content = $("#event_Content").val();
		var contentValidation = event_Content.trim();
		var event_WhenBegins = $("#event_WhenBegins").val();
		var event_WhenEnds = $("#event_WhenEnds").val();
		var category_ID = $("#category_ID").val();
		var event_Address = $("#address").val();
		var event_LocX = $("#event_LocX").val();
		var event_LocY = $("#event_LocY").val();
		
		if ("" == event_WhenBegins || "" == event_WhenEnds) {
			alert("날짜 다시 입력 ㄱㄱ");
		} else if (0 == event_LocX && 0 == event_LocY) {
			alert("주소입력하세용");
		} else if ("" == category_ID) {
			alert("카테고리입력하세용");
		} else if("" == titleValidation || "" == contentValidation) {
			alert("제목이나 내용을 입력하세용ㅎㅎ")
		} 
		$.ajax({
			 url : "eventUpdate.go",
			 type : 'post',
			 data : 
			 {
				 "event_ID" : $("#event_ID").val(),
				 "event_Title" : event_Title,
				 "event_Content" : event_Content,
				 "event_WhenBegins" : event_WhenBegins,
				 "event_WhenEnds" : event_WhenEnds,
				 "category_ID" : category_ID,
				 "event_Address" : event_Address,
				 "event_LocX" : event_LocX,
				 "event_LocY" : event_LocY
				 // "event_Picture" : $("#eventfile").files()
			 },
			  success : function(data){
				 alert(data);
				 $("#main-div").replaceWith(data);
			 },
			 error : function(){
				 alert("failed");
			 }
		 });
		//else
    });
	
	
	// http://postcode.map.daum.net/guide
	var element_layer = document.getElementById('layer');
	var geocoder = new daum.maps.services.Geocoder();
	function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
	
	$("#addressbtn").on("click", function () {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        var result = results[0]; //첫번째 결과의 값을 활용
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        $('#give_coord').val(coords);
                        console.log($('#give_coord').val());
                    }
                    document.getElementById('event_LocX').value = result.x;
                    document.getElementById('event_LocY').value = result.y;
                });
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address').value = fullAddr;
                // document.getElementById('addressEnglish').value = data.addressEnglish;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    });
	
var index = document.querySelector('#coordlistsize').innerHTML;
var positions = [];
for (i = 0; i < index; i++) {
	var tmp1 = '#coord' + i;
	var tmp2 = '#search-event-title' + i;
	var coordtmp = document.querySelector(tmp1).innerHTML;
	var ll = coordtmp.split(" ");
	var y = parseFloat(ll[0]);
	var x = parseFloat(ll[1]);
	positions[i] = 
	{ 
	  title: document.querySelector(tmp2).innerHTML + i,
	  latlng: new daum.maps.LatLng(x, y)
	}
}

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new daum.maps.LatLng(37.500589, 127.036441), // 지도의 중심좌표
    level: 11 // 지도의 확대 레벨
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