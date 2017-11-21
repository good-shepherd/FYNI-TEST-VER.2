<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>

/* w3school's template */
body {
	font: 20px Montserrat, sans-serif;
	line-height: 1.8;
	color: #f5f6f7;
}

p {
	font-size: 16px;
}

.margin {
	margin-bottom: 45px;
}

.bg-1 {
	background-color: #1abc9c; /* Green */
	color: #ffffff;
}

.bg-2 {
	background-color: #474e5d; /* Dark Blue */
	color: #ffffff;
}

.bg-3 {
	background-color: #ffffff; /* White */
	color: #555555;
}

.bg-4 {
	background-color: #2f2f2f; /* Black Gray */
	color: #fff;
}

.container-fluid {
	padding-top: 70px;
	padding-bottom: 70px;
}

.navbar {
	padding-top: 15px;
	padding-bottom: 15px;
	border: 0;
	border-radius: 0;
	margin-bottom: 0;
	font-size: 12px;
	letter-spacing: 5px;
}

.navbar-nav  li a:hover {
	color: #1abc9c !important;
}

/* search bar */
#custom-search-input {
	margin: 0;
	margin-top: 10px;
	padding: 0;
}

#custom-search-input .search-query {
	padding-right: 3px;
	padding-right: 4px \9;
	padding-left: 3px;
	padding-left: 4px \9;
	/* IE7-8 doesn't have border-radius, so don't indent the padding */
	margin-bottom: 0;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

#custom-search-input button {
	border: 0;
	background: none;
	/** belows styles are working good */
	padding: 2px 5px;
	margin-top: 2px;
	position: relative;
	left: -28px;
	/* IE7-8 doesn't have border-radius, so don't indent the padding */
	margin-bottom: 0;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	color: #D9230F;
}

.search-query:focus+button {
	z-index: 3;
}

<!-- 안보이게 하기 -->
.invis {
	display : none;
}
</style>
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
					<li><a href="#">Write an Event</a></li>
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
	
	<div id="searchBody">
	<!-- First Container -->
	<div class="container-fluid bg-1 text-center">
		<div class="h1">Things to do in your area</div>
		<div id="custom-search-input">
			<div class="input-group col-sm-6 col-sm-offset-3">
				<input type="text" class="search-query form-control"
					placeholder="Search" /> <span class="input-group-btn">
					<button class="btn btn-danger" type="button">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</span>
			</div>
		</div>
		<h3>Category List Category List Category List Category List</h3>
	</div>

	<!-- Second Container -->
	<div class="container-fluid bg-2 text-center">
		<h3 class="margin">What Am I?</h3>
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
			eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
			ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
			aliquip ex ea commodo consequat.</p>
		<a href="#" class="btn btn-default btn-lg"> <span
			class="glyphicon glyphicon-search"></span> Search
		</a>
	</div>
	
	<!-- Third Container (Grid) -->
	<div class="container-fluid bg-3 text-center">
		<h3 class="margin">Where To Find Me?</h3>
		<br>
		<div class="row">
			<div class="col-sm-4">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
					do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			</div>
			<div class="col-sm-4">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
					do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			</div>
			<div class="col-sm-4">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
					do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			</div>
		</div>
	</div>
	</div>
	<!-- Footer -->
	<footer class="container-fluid bg-4 text-center">
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