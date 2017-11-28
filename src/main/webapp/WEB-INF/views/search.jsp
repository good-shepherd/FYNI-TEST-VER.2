<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/index.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/search.js"></script>
<title>Search Events ${category_name }</title>
</head>
<body>
	<nav id="top-navbar" class="navbar">
		<div class="container-fluid">
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
	</nav>
	<div class="row">
		<div id="search-result-list" class="col-sm-8">
			<div id="resultList" class="list-group">
				<c:forEach var="i" items="${list}" begin="1" end="10">
					<a id="list-individual-item" href="#" class="list-group-item">
						<div class="row">
							<div class="col-sm-8">
								<h4 class="list-group-item-heading">${i.event_Title }</h4>
								<p class="list-group-item-text">${i.event_Content }</p>
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


	<nav id="bottom-navbar" class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="nav navbar-nav">
				<p>FYNI</p>
			</div>
		</div>
	</nav>

</body>
</html>