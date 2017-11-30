<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<c:if test="${signupmsg eq 'failed'}">
  <script>
	alert("check your signup form");
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
          <input type="email" class="form-control" id="signup-user-id" placeholder="abcde@email.com" 
          pattern = "/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/"
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
        <input type="submit" class="btn btn-primary" id="signupbtn" value="Sign Up">
      </form>
    </div>
  </div>
  </div>
