<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
  
  <script src="js/login.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f397917cb5ef99cfb9f9547f560e0bbf&libraries=services"></script>