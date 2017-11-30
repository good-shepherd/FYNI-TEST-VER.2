<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
	<c:if test="${signupmsg eq 'failed'}">
	  <script>
		alert("check your Email or Password");
	  </script>
	</c:if>	
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
      <form role="form" id = "f" name="f" action="signup.do" method="post">
        <div class="form-group">
          <label for="signup-user-id">Email</label>
          <input type="text" class="form-control" id="signup-user-id" placeholder="fyni@email.com" 
          pattern = "^[A-Za-z0-9._]+@[A-Za-z0-9.-]+.[a-z]{2,4}$" title="아이디" name="user_ID">
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
          <input type="hidden" id="user_Addr" name="user_Address">
          <input type="hidden" id ="user_LocX" name="user_LocationX">
          <input type="hidden" id ="user_LocY" name="user_LocationY">
		  <input type="button" class="btn-primary pull-right" style="border-radius:3px" id="findaddressbtn" value="Find address">
        </div>
		<div class="checkbox pull-right">
          <label><input type ="checkbox">프로필 공개</label>
        </div>
        <input type="submit" class="btn btn-primary" id="signupbtn" value="Sign Up">
      </form>
    </div>
  </div>
  </div>
  <script src="js/login.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9adfd866378fae45cd319d667002054e&libraries=services"></script>