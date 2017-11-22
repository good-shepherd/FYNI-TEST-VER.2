<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/index.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=NpUtXPkJkj1DI50B8uA9"></script>
<title>Insert title here</title>
<script>
$(document).ready(function(){
	$('#loginbtn').click(function(){
		var userID = $('#user_ID').val();
		var userPWD = $('#user_PWD').val();
		$.ajax({
			url : '',
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
					$('#myModal').modal('hide');
					$('#login').addClass('invis');
					$('#userinfo').removeClass('invis');
				}
			}
		});
	}); //로그인버튼 클릭시
	
	
	
	/* $('#wane').on('click', function () {
		$.ajax({
			url : "eventCreate.do",
			success : function (){
				$("#searchBody").html()
			}
		
			})
		
	
		
	}); */
		
	
	
	$('#searchbtn').on('click',function(){
		$.ajax({
			url : "listAll.do",
			success : function(data){
					//alert($('#searchMain'));
					//$.getJSON("listAll.do", function(data) {
						var str = "";
						$(data).each(function() {
							str += "<li data-event_Id='" + this.event_ID + "' class='regular-search-result'>"
								+ this.event_ID + ": " + this.event_Title + "</li>";
						});
						$("#resultList").html(str);
					
					/* $('#searchBody').html(a); */
			}
		});
	});
});



</script>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">FYNI</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-left">
					<li><a id="wane" href="#">Write an Event</a></li>
					<li><a href="#">Events</a></li>
					<li><a href="#">Talk</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${user_ID == null }">
						<li><a href="#" id="login" data-toggle="modal"
							data-target="#myModal">Log In</a></li>
					</c:if>
					<c:if test="${user_ID != null }">
						<li><a href="#" id="userinfo">유저아이디</a></li>
					</c:if>
					<li><a href="#">Sign Up</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div id="searchBody" class="bg-1">
	<ul id="resultList">
	</ul>
	<!-- First Container -->
	<div class="container-fluid text-center">
		<div class="h1">Things to do in your area</div>
		<div id="custom-search-input">
			<div class="input-group col-sm-6 col-sm-offset-3">
				<input id="searchMain" type="text" class="search-query form-control"
					placeholder="Search" /> <span class="input-group-btn">
					<button class="btn btn-danger" type="button" id="searchbtn">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</span>
			</div>
		</div>
		<h3>Category List Category List Category List Category List</h3>
	</div>
	</div>
	<!-- Footer -->
	<footer class="container-fluid bg-4 text-center navbar-fixed-bottom">
		<p>FYNI.</p>
	</footer>

	<!-- modal modal modal modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">LOG IN</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<label>ID</label> <input type="text"> <br>
					<label>PASSWORD</label> <input type="password">
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="loginbtn">LOG IN</button>
				</div>

			</div>
		</div>
	</div>
	<!-- modal modal modal modal -->


</body>
</html>