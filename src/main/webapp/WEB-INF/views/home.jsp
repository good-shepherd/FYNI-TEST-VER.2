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
  <script type="text/javascript" src="js/index.js"></script>
  <title>Hello, FYNI</title>
  </head>
  <body>
   <nav id="top-navbar" class="navbar">
      <div class="container-fluid">        
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#topFixedNavbar1" aria-expanded="false"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
          <a class="navbar-brand" href="#">FYNI</a></div>        
       
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
	  
	  
<video autoplay loop poster class="bg" src="http://static.videezy.com/system/resources/previews/000/000/328/original/bokeh2.mp4">
</video>
<div class="bg-filter">
</div>
	  
<center>
<section class="section-max-width">

<div id="main-top-section" class="row">
<div id="landing-page-helloworld">
	<br><br><h1>Hello, FYNI!</h1>
</div>
	
<div id="main-search-bar" class="input-group">
		
	    <input id="main-search-input" type="text" class="form-control" placeholder="placeholder content" aria-describedby="contentaddon1">
	    <span id="main-search-button" class="input-group-addon">Search</span>
	    <!-- <span id="main-search-button" class="input-group-addon">Search</span> -->
	    
</div>
</div>
	
 
	  
</section>
</center>
	  

	  
<nav id="bottom-navbar" class="navbar">
  <div class="container-fluid">
	   		<div class="nav navbar-nav">
		   	<p>FYNI</p>
			</div>
  </div>
	  <!-- /.container-fluid -->
</nav>
  </body>
</html>