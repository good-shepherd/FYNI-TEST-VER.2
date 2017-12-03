/**
 * 
 */



function cngpwd(){
	$.ajax({
		url : "cngpwd",
		success : function(data){
			$("#content_to_change").html(data);
		}
	})
}


function cngusercomment(){
	$.ajax({
		url : "cngcomment",
		success : function(data){
			$('#content_to_change').html(data);
		}
	})
}	


function cnguserlist(){
	$.ajax({
		url : "userlist",
		success : function(data){
			$("#content_to_change").html(data);
		}
	})
}

function cngingpwd(){
	$('#sign_up_form').submit();
}

function deldel(){
	var conf = confirm("정말 이 아이디를 삭제하시겠습니까?");
	if(conf == true){
		location.href = "delaccount";
	}
}

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

function deleteEvent(event_ID){
	var cnfmdel = confirm("진짜 삭제할거?????");
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