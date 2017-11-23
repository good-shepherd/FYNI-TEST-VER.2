/**
 * 
 */


$(document).ready(function(){
	$('#loginbtn').click(function(){
		var userID = $('#user_ID_Modal').val();
		var userPWD = $('#user_PWD').val();

		$.ajax({
			url : 'login.do',
			type : 'POST',
			data : {
				'user_ID' : userID,
				'user_PWD' : userPWD
			},
			success : function(a,b,c){
				if(a == 'fail'){
					alert("login failed!");
					$('user_ID').val("");
					$('user_PWD').val("");
				}else{
					$('#user_ID').val(a);
					$('#myModal').modal('hide');
					$('#login').addClass('invis');
					$('#userinfo').removeClass('invis');
					$('#eventwriting').html('<li><a id="wane" href="#" data-toggle="modal"data-target="#eventModal">Write an Event</a></li><li><a href="#">Events</a></li>'
							+'<li><a href="#">Talk</a></li>');
					$("#showUserID").html('<li><a href="#" id="userinfo">${user_ID}</a></li><li><a href="#">Sign Up</a></li>');
				}
			}
		});
	}); //로그인버튼 클릭시
	
	//
	 $('#eventWritebtn').on('click', function () {
		$.ajax({
			url : "eventCreate.do",
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			data : $('#eventf').serialize,
			type : 'POST',
			success : function (a,b,c){
				if(a == "fail"){
					alert("생성에 실패했습니다.")	;
				}else if(a == "success"){
					$('#eventModal').modal('hide');
					alert("이벤트가 생성되었습니다.");
				}
			}
			});
	}); 
		
	
	 var searchAction = function (){
			var category_name = $('#searchMain').val();		
			$.ajax({
				url : "eventReadByCategory.do",
				data : {"category_name": category_name},
				success : function(data){
						// alert(data.toString());
							var str = "";
							$(data).each(function() {
								str += "<li data-event_Id='" + this.event_ID + "' class='regular-search-result'>"
									+ this.event_ID + ": " + this.event_Title + "</li>";
							});
							$("#resultList").html(str);
				}
			});
		}
	
	$('#searchbtn').on('click', searchAction);
	$('#searchMain').keypress(function(e){if(e.which == 13){$('#searchbtn').click();}});
        
});
