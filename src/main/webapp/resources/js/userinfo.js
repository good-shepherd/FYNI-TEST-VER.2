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