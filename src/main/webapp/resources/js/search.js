/**
 * 
 */
function searchResult(event_ID) {
	// alert("펑션실행");
	$.ajax({
		 url : "eventRead.do",
		 data : {"event_ID": event_ID},
		 success : function(data){
			alert(data);
			$("#main-div").replaceWith(data);
		 }
	 });
}

$(document).ready(function(){
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});