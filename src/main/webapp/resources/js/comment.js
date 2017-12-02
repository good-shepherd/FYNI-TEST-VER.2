/**
 * 
 */
$(document).ready(function(){
	$('#write-comment').on('click',function(){
		var comment_content = $('#comment_content').val();
		var event_ID = $('$eventid_forcomment').val();
		var comments = {"comment_Content": comment_content,"event_ID" : event_ID};
		$.ajax({
			url : "write-comment",
			data : comments,
			success : function(data){
				$('#comment-body').html(data);
			}
		});
		
	});
})