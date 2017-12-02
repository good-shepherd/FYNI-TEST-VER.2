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

function deldel(){
	var conf = confirm("정말 이 아이디를 삭제하시겠습니까?");
	if(conf == true){
		location.href = "delaccount";
	}
}