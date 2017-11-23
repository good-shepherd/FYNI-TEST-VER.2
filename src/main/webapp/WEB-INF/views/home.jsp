<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript" src="js/login.js"></script>
</head>
<body>
	<input type="hidden" id="user_ID" name="user_ID">
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
				<ul class="nav navbar-nav navbar-left" id = "eventwriting">
					 <!-- 로그인 후 event write 활성화하는 곳-->
					 <!-- c:if는 처음에 로그인 안 되어 있으면(새로고침했을때) 아예 event write를 안띄움-->
					<c:if test="${user_ID != null }"> 
					<li><a id="wane" href="#" data-toggle="modal"
						data-target="#eventModal">Write an Event</a></li>
					</c:if>
					<!-- event write -->
					<li><a href="#">Events</a></li>
					<li><a href="#">Talk</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right" id ="showUserID">
				
					<!-- 새로고침이나 처음 홈페이지 진입을 위해 login을 띄우거나 userid를 띄우거나를 결정 -->
					<!-- ajax를 통해 로그인 성공 시 user_ID를 띄워 -->
					<c:if test="${user_ID == null }">
						<li><a href="#" id="login" data-toggle="modal"
							data-target="#myModal">Log In</a></li>
					</c:if>
					
					<c:if test="${user_ID != null }">
						<li><a href="#" id="userinfo">${user_ID }</a></li>
					</c:if>
					<li><a href="#">Sign Up</a></li>
					<!-- 여기까지 ajax -->
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
					<h4 class="modal-title" style="display: inline">LOG IN</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<label>ID</label> <input type="text" id="user_ID_Modal"> <br>
					 <label>PASSWORD</label><input type="password" id="user_PWD">
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

	<!-- 임시 이벤트 작성 폼 -->
	<div class="modal fade" id="eventModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title text-primary h1" style="display: inline">Event</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id = "eventf" enctype="multipart/form-data">
						<input type="hidden" value="${user_ID }">
						<!-- 드롭다운같은걸로다가 카테고리 선택하는거 추가하기 -->
						<label for="title">Title</label> 
						<input type="text" name = "title"> <br> 
						<label for="content">Content</label> 
						<textarea class="form-control" name = "content" id = "content" rows="3"></textarea><br>
						<label for="when">Duration</label>
						<input type="datetime" name="when"id="when">
						<label for="picture">Picture	Upload</label> 
						<input type="file" name="picture"> <br>
					</form>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="eventWritebtn">Write an event</button>
				</div>

			</div>
		</div>
	</div>

</body>
</html>