<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>무제 문서</title>
<link href="css/userinfo.css" type="text/css" rel="stylesheet">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
  <link href="css/index.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">	
  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/userinfo.js"></script>
  <title>My Information</title>
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
<div class="container-fluid">
    <div class="row profile">
		<div class="col-md-3 pull-left">
			<div class="profile-sidebar">
				<!-- SIDEBAR USER TITLE -->
				<div class="profile-usertitle">
					<div class="profile-usertitle-name">
						${user_ID }
					</div>
					<div class="profile-usertitle-job">
						${user_Nickname }
					</div>
				</div>
				<!-- END SIDEBAR USER TITLE -->
				<!-- SIDEBAR MENU -->
				<div class="profile-usermenu">
					<ul class="nav">
						<li class="active"><a href="javascript:cnguserlist()" data-target-id="profile"><i class="glyphicon glyphicon-user"></i> Profile</a></li>
                    	<li><a href="javascript:cngpwd()" data-target-id="change-password"><i class="glyphicon glyphicon-lock"></i> Change Password</a></li>
                    	<li><a href="javascript:deldel()" data-target-id="settings"><i class="glyphicon glyphicon-cog"></i> withdrawal</a></li>
                    	<li><a href="logout" data-target-id="logout"><i class="glyphicon glyphicon-log-out"></i> Logout</a></li>
					</ul>
				</div>
				<!-- END MENU -->
			</div>
		</div>
		<div class="col-md-9">
            <div class="profile-content" id="content_to_change">
            	<c:forEach var="i" items="${list}" begin="0" end="${listlen }">
					<a id="list-individual-item" href="javascript:searchResult(${i.event_ID})" class="list-group-item">
						<div class="row">
							<div class="col-sm-8">
								<h4 class="list-group-item-heading">${i.event_Title}</h4>
								<p class="list-group-item-text">${i.event_Content}</p>
							</div>
							<div class="col-sm-4">${i.event_Address}</div>
						</div>
					</a>
				</c:forEach>
            </div>
		</div>
	</div>
</div>
  <script src="js/userinfo.js"></script>
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
