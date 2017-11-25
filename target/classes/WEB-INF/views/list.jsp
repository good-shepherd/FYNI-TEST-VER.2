<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
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
<script>
	$(document).ready(function() {
		var map = new naver.maps.Map('main_map', {
			center : new naver.maps.LatLng(37.3595704, 127.105399),
			zoom : 10
		});
	});
</script>
</head>
<body>
	<nav id="top-navbar" class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#topFixedNavbar1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">FYNI</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="#">Write an Event</a></li>
					<li><a href="#">Talk</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li>
						<form class="navbar-form" role="search">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Search">
							</div>
							<button type="submit" class="btn glyphicon-search"></button>
						</form>
					</li>
					<li><a href="#">Log In</a></li>
					<li><a href="#">Sign Up</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<div class="row">
		<div id="search-result-list" class="col-sm-8">
			<div id="resultList" class="list-group">
			<c:forEach var="i" items="${list}" begin="1" end="10">
				<a id="list-individual-item" href="#" class="list-group-item">
					<div class="row">
						<div class="col-sm-8">
							<h4 class="list-group-item-heading">${i.event_Title }</h4>
							<p class="list-group-item-text">${i.event_Content }	</p>
						</div>
						<div class="col-sm-4">${i.location_ID }</div>
					</div>
				</a> 
				</c:forEach>
			</div>
		</div>
		<div id="search-result-map" class="col-sm-4">
			<img src="images/placeholdermap.jpg" class="img-responsive"
				alt="Placeholder image">
		</div>
	</div>


	<nav id="bottom-navbar"
		class="navbar navbar-inverse navbar-fixed-bottom">
		<div class="container-fluid">
			<div class="nav navbar-nav">
				<p>FYNI</p>
			</div>
		</div>
		<!-- /.container-fluid -->
	</nav>
</body>
</html>