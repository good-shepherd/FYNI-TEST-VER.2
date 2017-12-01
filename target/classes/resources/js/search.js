function searchResult(event_ID) {
	$.ajax({
		 url : "eventRead.do",
		 type : 'post',
		 data : {"event_ID": event_ID},
		 success : function(result,status,xhr){
			 console.log(JSON.stringify(xhr));
			$("#main-div").replaceWith(result);
			var container = document.getElementById('map');
			var options = {
				center: new daum.maps.LatLng(33.450701, 126.570667),
				level: 3
			};
			var map = new daum.maps.Map(container, options);
		 }
	 });
}