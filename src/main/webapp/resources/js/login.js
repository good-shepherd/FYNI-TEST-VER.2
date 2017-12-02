/**
 * 로그인 화면에서 ajax를 통한 login / signup 화면 교체 javascript
 */

function closeDaumPostcode() {
    // iframe을 넣은 element를 안보이게 한다.
	document.getElementById('layer').style.display = 'none';
}


function cngsignup(){
	$.ajax({
		url : "signupreq",
		success : function(data){
			$('#here-to-change').html(data);
		}
	});
}


function cnglogin(){
	$.ajax({
		url : "loginreq",
		success : function(data){
			$('#here-to-change').html(data);
		}
	});
}
$(document).ready(function(){
    $("#f_signup").on('submit', function() {
        if($('#profile').is(":checked") == true){
        	$('#profile').val(1);
        }else{
        	$('#profile').val(0);
        }
    })
	
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
	$("#findaddressbtn").on("click", function () {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
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
                    document.getElementById('signup_user_address').value = data.addressEnglish;
                    document.getElementById('user_LocX').value = result.x;
                    document.getElementById('user_LocY').value = result.y;	
                    document.getElementById('user_Addr').value = data.addressEnglish;
                });
//                document.getElementById('give_coord').value = coords;
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
        initLayerPosition();
    });
});




