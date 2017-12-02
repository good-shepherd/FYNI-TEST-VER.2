/**
 * 
 */


$(document).ready(function(){
	$('#loginbtn').click(function(){
		var userID = $('#user_ID_Modal').val();
		var userPWD = $('#user_PWD').val();
		$('#user_ID_Modal').attr({
			autofocus : "autofocus"
		}
		);
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
					$('#eventwriting').html(
							'<li class="nav-item"><a id="wane" href="#" data-toggle="modal"data-target="#eventModal">Write an Event</a></li>'+
							'<li class="nav-item"><a href="#">Events</a></li>' +
							'<li class="nav-item"><a href="#">Talk</a></li>' + 
							'<li id="afterSearchbar" class="nav-item"></li>');
					$("#showUserID").html('<li><a href="#" id="userinfo">' + userID + 
										  '</a></li><li><a href="#">Sign Up</a></li>');
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
		
	
	 /*var searchAction = function (){
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
		}*/
	 
	 
	 var searchNavAction = function (){
		 var category_name = $('#searchNav').val();
		 $.ajax({
			 url : "eventReadByCategory.do",
			 data : {"category_name": category_name},
			 success : function(data){
//				  alert(data.toString());
//				 var str = "";
//				 $(data).each(function() {
//					 str += 
//						 "<li class='container-fluid'>" +
//						 	"<div class='row'>" +
//						 		"<div class='col-md-8' >" + this.event_Title.trim() + "</div>" +
//						 	"<div class='col-md-4'>" + this.location_ID + "</div>" +
//						 	"<div class='col-xs-12'>" + "코멘트들~~~~~" + "</div>" +
//						 	"</div>" +
//						 "</li>";
//				 });
				 $("#resultList").html(data);
			 }
		 });
	 }
	 
	 /*var searchAction = function (){
		 var category_name = $('#main-search-input').val();
		 var temp = '<input id="searchNav" type="text" class="search-query form-control" placeholder="Search" />'
		 $.ajax({
			 url : "eventReadByCategory.do",
			 data : {"category_name": category_name},
			 success : function(data){
				 // alert(data.toString());
				 var str = "";
				 $(data).each(function() {
					 str += "<li class='container-fluid'><div class='row'><div class='col-md-8' >" + this.event_Title.trim() + "</div><div class='col-md-4'>"
					 + this.location_ID + "</div><div class='col-xs-12'>" + "코멘트들~~~~~" + "</div></div></li>";
				 });
				 //location.href = 'template.jsp';
				 $("#search-result").html(data);
				 //$('#afterSearchbar').html(temp);
				 
			 }
		 });
	 }*/
	var searchAction = function () {
		var category_name = $('#main-search-input').val();
		var searchurl = "search?category_name=" + category_name;
		location.href = searchurl;
	}
	 
	$('#main-search-button').on('click', searchAction);
	$('#searchNav').on('click', searchNavAction);
	$('#main-search-input').keypress(function(e){if(e.which == 13){$('#main-search-button').click();}});
	
        
});
