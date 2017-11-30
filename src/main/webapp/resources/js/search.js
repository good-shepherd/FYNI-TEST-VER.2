function searchResult(event_ID) {
	$.ajax({
		 url : "eventRead.do",
		 type : 'post',
		 data : {"event_ID": event_ID},
		 success : function(data){
			$("#main-div").replaceWith(data);
		 }
	 });
}