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
  <link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">	
  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/login.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f397917cb5ef99cfb9f9547f560e0bbf"></script>
<title>Login/Signup</title>
</head>
<body>
<nav id="top-navbar" class="navbar">
      <div class="container-fluid">        
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#topFixedNavbar1" aria-expanded="false"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
          <a class="navbar-brand" href="/app">FYNI</a></div>        
          <ul class="nav navbar-nav">
            <li><a href="#">Write an Event</a></li>
            <li><a href="#">Talk</a></li>
          </ul>
         <ul class="nav navbar-nav navbar-right">		   
           <li><a href="javascript:cnglogin()">Log In</a></li>
			  <li><a href="javascript:cngsignup()">Sign Up</a></li>
          </ul>
      </div>      
</nav>
<div class="container" id="here-to-change">
 <div class= " col-md-4 col-md-offset-4">
  <div class="row" >
    <div class="main">
      <h3>Sign Up for FYNI</h3>
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
      <form role="form" id = "f" name="f">
        <div class="form-group">
          <label for="signup-user-id">Email</label>
          <input type="text" class="form-control" id="signup-user-id"
				 name="user_ID">
        </div>
        <div class="form-group">
          <label for="signup-user-pwd">Password</label>
          <input type="password" class="form-control" id="signup-user-pwd"
				 name="user_PWD">
        </div>
		<div class="form-group">
          <label for="signup-user-nickname">Nickname</label>
          <input type="text" class="form-control" id="signup-user-nickname"
				 name="user_Nickname">
        </div>
		<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
			<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
		</div>
		<div class="form-group">
          <label for="inputPassword">Default Location</label><small> optional</small>
          <input type="text" style="border-radius:3px" id="signup_user_address" disabled>
          <input type="hidden" id="give_coord" name="user_Address">
		  <input type="button" class="btn-primary pull-right" style="border-radius:3px" id="findaddressbtn" 
		  data-toggle="modal" data-target="#mapModal" value="Find address">
        </div>
		<div class="checkbox pull-right">
          <label><input type ="checkbox">프로필 공개</label>
        </div>
        <input type="button" class="btn btn-primary" id="signupbtn" value="Sign Up">
      </form>
    </div>
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


</body>
</html>