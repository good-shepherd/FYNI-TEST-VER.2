/**
 * 
 */
function write_event(){
	var comment_content = $('#comment_content').val();
	var event_ID = $('#eventid_forcomment').val();
	var comments = {"comment_Content": comment_content,"event_ID" : event_ID};
	$.ajax({
		url : "write-comment",
		data : comments,
		type : 'post',
		success : function(data){
			$('#comment-body').html(data);
			$('#comment_content').val("");
		}
	});
}
$(document).ready(function(){
})