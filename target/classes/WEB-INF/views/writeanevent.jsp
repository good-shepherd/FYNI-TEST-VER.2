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
<link href="css/event.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/writeanevent.js"></script>
<title>Write an Event</title>
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
				<li><a href="writeanevent">Write an Event</a></li>
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
				<li><a href="login">Log In</a></li>
				<li><a href="signup">Sign Up</a></li>
			</ul>

		</div>
	</nav>


	<div class="container-fluid section-max-width">
		<h4>Event Occured!</h4>
		<form id="form1" name="form1" method="post">
			<div class="form-group">
				<label for="event_Title">Write the title of your event</label> <input
					type="text" class="form-control" name="write-event-title" id="event_Title" placeholder="Title">
			</div>
			<div class="form-group">
				<label for="event_Content">Write the content of your event</label>
				<textarea class="form-control" name="write-event-content"
					id="event_Content" style="resize: none;" rows="7"
					placeholder="content"></textarea>
			</div>
			<div class="form-group">
				<label for="input1">시간 : </label>
				<div class="input-group">
					<input type="datetime-local" name="starttime" id="stime"> 부터 <input
						type="datetime-local" name="endtime" id="etime"> 까지
				</div>
			</div>
			<!-- <div class="form-group">
				<label for="event_Picture">Show your Event</label> <input
					type="file" name="event-file" id="eventfile">
			</div> -->
			<button id="submitbtn" class="btn btn-primary">Write event</button>

		</form>
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