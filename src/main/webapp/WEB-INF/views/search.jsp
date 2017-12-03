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
<script src="js/navsearch.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f397917cb5ef99cfb9f9547f560e0bbf&libraries=services"></script>
<script src="js/comment.js"></script>
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
				<a class="navbar-brand" href="/app">FYNI</a>
			</div>

			<ul class="nav navbar-nav">
				<li><a href="writeanevent">Write an Event</a></li>
				<li><a href="#">Talk</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li>
					<div class="navbar-form" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search" id="nav-search-bar">
							<span id="nav-search-btn" class="btn glyphicon-search"></span>
						</div>
					</div>
				</li>
				 <c:if test="${user_ID == null }">				   
		           <li><a href="login">Log In</a></li>
					  <li><a href="signup">Sign Up</a></li>
		         </c:if>
				 <c:if test="${user_ID != null }">
				 	<li><a href="userinfo">${user_ID }</a>
				 	<li><a href="logout">Log out</a>
				 </c:if>
			</ul>

		</div>
	</nav>
	
	<div id="main-div" class="container-fluid section-max-width">
		<div id="search-result-list" class="col-sm-8">
			<div id="resultList" class="list-group">
				<c:forEach var="i" items="${list}" begin="0" end="${listsize}">
					<a id="list-individual-item" href="javascript:searchResult(${i.event_ID})" class="list-group-item">
						<div class="row">
							<div class="col-sm-8">
								<h4 class="list-group-item-heading">${i.event_Title}</h4>
								<p class="list-group-item-text">${i.event_WhenBegins} - ${i.event_WhenEnds}</p>
							</div>
							<div class="col-sm-4">${i.event_Address}</div>
						</div>
					</a>
				</c:forEach>
				<p hidden id="coordlistsize">${coordlistsize}</p>
				<c:forEach var="k" items="${coordlist}" begin="0" end="${coordlistsize}" varStatus="loop">
					<p hidden id="coord${loop.index}">${k}</p>
				</c:forEach>
			</div>
		</div>
			<div id="map" class="col-sm-4" style="min-height: 400px;"></div>
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