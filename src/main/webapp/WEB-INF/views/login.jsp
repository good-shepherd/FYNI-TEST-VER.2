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
  <link href="css/login.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">	
<!--   	ac81df297f1dc0feb920924398032745 -->
<title>Log In</title>
</head>
<body>
<nav id="top-navbar" class="navbar">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#topFixedNavbar1" aria-expanded="false"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
          <a class="navbar-brand" href="/app">FYNI</a></div>        
          <ul class="nav navbar-nav">
            <li><a href="writeanevent">Write an Event</a></li>
            <li><a href="#">Talk</a></li>
          </ul>
         <ul class="nav navbar-nav navbar-right">		   
           <li><a href="javascript:cnglogin()">Log In</a></li>
			  <li><a href="javascript:cngsignup()">Sign Up</a></li>
          </ul>
      </div>      	
</nav>
<div class="container" id="here-to-change">
	<c:if test="${msg eq 'failed'}">
	  <script>
		alert("check your Email or Password");
	  </script>
	</c:if>	
  <div class="row">
    <div class="main">
      <h3>Please Log In, or <a href="javascript:cngsignup()">Sign Up</a></h3>
      <div class="row">
        <div class="col-xs-6 col-sm-6 col-md-6">
          <a href="#" class="btn btn-lg btn-primary btn-block">Facebook</a>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-6">
          <a href="#" class="btn btn-lg btn-info btn-block">Google</a>
        </div>
      </div>
      <div class="login-or">
        <hr class="hr-or">
        <span class="span-or">or</span>
      </div>
      <form role="form" id = "f" name="f" method="post" action="login.do">
        <div class="form-group">
          <label for="inputUsernameEmail">Email</label>
          <input type="text" class="form-control" id="inputUsernameEmail" name="user_ID"
          pattern = "^[A-Za-z0-9._]+@[A-Za-z0-9.-]+\.[a-z]{2,4}$">
        </div>
        <div class="form-group">
          <a class="pull-right" href="#">Forgot password?</a>
          <label for="inputPassword">Password</label>
          <input type="password" class="form-control" id="inputPassword" name="user_PWD">
        </div>
        <div class="checkbox pull-right">
          <label>
            <input type="checkbox">
            Remember me </label>
        </div>
        <input type="submit" class="btn btn-primary" id="loginbtn" value="Log in">
      </form>
    </div>
  </div>
</div>

<nav id="bottom-navbar" class="navbar navbar-inverse">
	   <div class="container-fluid">
	   		<div class="nav navbar-nav">
		   	<p>FYNI</p>
			</div>
	   </div>
</nav>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/login.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f397917cb5ef99cfb9f9547f560e0bbf&libraries=services"></script>
</body>
</html>