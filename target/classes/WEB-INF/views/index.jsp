<!-- template for all pages -->
<!-- only includes top and bot navbars -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/index.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
rel="stylesheet">
<title>Hello, FYNI</title>
</head>
<body>
<nav id="top-navbar" class="navbar">
	<div class="container-fluid">        
		<div class="navbar-header">
			<a class="navbar-brand" href="#">FYNI</a>
		</div>        
		<ul class="nav navbar-nav">
			<li><a href="writeanevent">Write an Event</a></li>
			<li><a href="#">Talk</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
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

</div>

<nav id="bottom-navbar" class="navbar">
	<div class="container-fluid">
		<div class="nav navbar-nav">
			<p>FYNI</p>
		</div>
	</div>
</nav>

</body>
</html>