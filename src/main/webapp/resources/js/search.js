function searchResult(event_ID) {
	$.ajax({
		 url : "eventRead.do",
		 type : 'post',
		 data : {"event_ID": event_ID},
		 success : function(result,status,xhr){
			 console.log(result);
			 console.log("========================================");
			 console.log(xhr);
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