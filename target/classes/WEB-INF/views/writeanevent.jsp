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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f397917cb5ef99cfb9f9547f560e0bbf&libraries=services"></script>
<script src="js/navsearch.js"></script>
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
				<a class="navbar-brand" href="/app">FYNI</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="writeanevent">Write an Event</a></li>
				<li><a href="#">Talk</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li>
					<form class="navbar-form" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search" id="nav-search-bar">
							<span id="nav-search-btn" class="btn glyphicon-search"></span>
						</div>
					</form>
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
<form id="form1" name="form1" method="post" enctype="multipart/form-data" accept-charset="utf-8">
<fieldset>

<h4 align="center">Event Occured!</h4>

<div class="form-group">
  <label class=" control-label" for="event_Title">Title</label>  
  <div class="">
  <input id="event_Title" name="event_Title" type="text" placeholder="Title" class="form-control input-md" maxlength="15">
    
  </div>
</div>

<div class="form-group">
  <label class=" control-label" for="event_Content">Description</label>
  <div class="">                     
    <textarea class="form-control" id="event_Content" rows="7" name="event_Content" maxlength="330"></textarea>
  </div>
</div>

<div class="form-group">
  <label class=" control-label" for="event_WhenBegins">Start Date</label>  
  <div class="">
  <input type="datetime-local" name="event_WhenBegins" id="event_WhenBegins">  
  </div>
  <label class=" control-label" for="event_WhenEnds">End Date</label>  
  <div class="">
  <input type="datetime-local" name="event_WhenEnds" id="event_WhenEnds">  
  </div>
</div>

<div class="form-group">
  <label class=" control-label" for="category_ID">Categories</label>
  <div class="">
    <select id="category_ID" name="category_ID" class="form-control">
      <option value="">카테고리</option>
	  <option value="1">사건사고</option>
   	  <option value="2">쇼핑정보</option>
 	  <option value="3">문화예술</option>
 	  <option value="4">키덜트</option>
 	  <option value="5">애기덜</option>
    </select>
  </div>
</div>
<input type="hidden" id ="event_LocX" name="event_LocationX">
<input type="hidden" id ="event_LocY" name="event_LocationY">

<div class="form-group">
  <label class=" control-label" for="postcode">Find your place</label>
  <div class="">
	<input type="text" id="postcode" placeholder="우편번호">
	<input type="button" id="addressbtn" value="찾기">
	<input type="text" id="address" placeholder="주소" name="event_Address">
	<input type="text" id="address2" placeholder="상세주소">
  </div>  
</div>

<div class="form-group">
  <label class=" control-label" for="event_Picture">Upload your photo</label>
  <div class="">
    <input id="event_Picture" type="file" name="event_Picture">
  </div>
</div>
<input id="submitbtn" type="button" class="btn" value="Write event">
</fieldset>
</form>
</div>
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
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