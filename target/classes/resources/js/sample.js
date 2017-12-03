/**
 * 
 */

function cngusercomment(){
	$.ajax({
		url : "cngcomment",
		success : function(data){
			$('#content_to_change').html(data);
		}
	})
}	