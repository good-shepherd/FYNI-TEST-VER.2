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
				 "event_When_s" : $("#stime").val(),
				 "event_When_e" : $("#etime").val()
				 
			 },
			  success : function(data){
				 alert(data);
			 }
		 });
		
		
		
	    });
	
	
	
	
	
	
});