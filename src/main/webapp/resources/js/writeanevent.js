/**
 * 
 */


$(document).ready(function(){
	
	$("#submitbtn").on("click", function(e) {
		e.preventDefault();
		alert($("#event_Title").val());
		$.ajax({
			 url : "eventCreate.do",
			 type : 'post',
			 data : 
			 {
				 "event_Title" : $("#event_Title").val(),
				 "event_Content" : $("#event_Content").val(),
				 "event_WhenBegins" : $("#stime").val(),
				 "event_WhenEnds" : $("#etime").val(),
				 // "event_Picture" : $("#eventfile").files()
			 },
			  success : function(data){
				 alert(data);
			 }
		 });
		
		
		
	    });
	
	
	
	
	
	
});