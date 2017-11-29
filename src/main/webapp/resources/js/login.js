/**
 * 로그인 화면에서 ajax를 통한 login / signup 화면 교체 javascript
 */

var loginform = 
'<div class="row">'+
'<div class="main">' + 
'  <h3>Please Log In, or <a href="javascript:cngsignup()">Sign Up</a></h3>' +
  '<div class="row">' + 
    '<div class="col-xs-6 col-sm-6 col-md-6"> ' +
      '<a href="#" class="btn btn-lg btn-primary btn-block">Facebook</a>' + 
    '</div>' + 
    '<div class="col-xs-6 col-sm-6 col-md-6">'+
     ' <a href="#" class="btn btn-lg btn-info btn-block">Google</a>'+
    '</div>'+
  '</div>'+
  '<div class="login-or">'+
    '<hr class="hr-or">'+
    '<span class="span-or">or</span>'+
  '</div>'+
'  <form role="form" id="f"  name="f" method="post" action="login.do">'+
    '<div class="form-group">'+
      '<label for="inputUsernameEmail">Email</label>'+
      '<input type="text" class="form-control" id="inputUsernameEmail" name="user_ID">'+
    '</div>'+
    '<div class="form-group">'+
      '<a class="pull-right" href="#">Forgot password?</a>'+
      '<label for="inputPassword">Password</label>'+
      ' <input type="password" class="form-control" id="inputPassword" name="user_PWD">'+
    '</div>'+
    '<div class="checkbox pull-right"> '+
      '<label> '+
        '<input type="checkbox"> '+
        'Remember me </label> '+
    '</div> '+
    '<button type="button" class="btn btn-primary" id="loginbtn"> '+
      'Log In ' +
    '</button> ' +
  '</form> '+
'</div>' + 
'</div>'

var signupform = 
'	 <div class= " col-md-4 col-md-offset-4">' +
'<div class="row" >' +
'  <div class="main"> '+
'    <h3>Sign Up for FYNI</h3> '+
'    <div class="row">'+
'      <div class="col-xs-6 col-sm-6 col-md-6">'+
'        <a href="#" class="btn btn-lg btn-primary btn-block">Facebook</a>'+
'      </div>'+
'      <div class="col-xs-6 col-sm-6 col-md-6">'+
'        <a href="#" class="btn btn-lg btn-info btn-block">Google</a>'+
'      </div>'+
'    </div>'+
'    <div class="login-or">'+
'      <hr class="hr-or">'+
'      <span class="span-or">or</span>'+
'    </div>'+
'    <form role="form" id = "f" name="f">'+
'      <div class="form-group">'+
'        <label for="signup-user-id">Email</label>'+
'        <input type="text" class="form-control" id="signup-user-id"'+
'				 name="user_ID">'+
'      </div>'+
'      <div class="form-group">'+
'        <label for="signup-user-pwd">Password</label>'+
'        <input type="password" class="form-control" id="signup-user-pwd"'+
'				 name="user_PWD">'+
'      </div>'+
'		<div class="form-group">'+
'        <label for="signup-user-nickname">Nickname</label>'+
'        <input type="text" class="form-control" id="signup-user-nickname"'+
'				 name="user_Nickname">'+
'      </div>'+
'		<div class="form-group"> '+
'        <label for="inputPassword">Default Location</label><small> optional</small>'+
'        <input type="text" style="border-radius:3px" id="signup-user-address"'+
'		  name="user_Address" disabled>'+
'		  <input type="button" class="btn-primary pull-right" style="border-radius:3px" id="findaddressbtn"'+ 
'		  data-toggle="modal" data-target="#mapModal" value="Find address">'+
'      </div>'+
'		<div class="checkbox pull-right">'+
'        <label><input type ="checkbox">프로필 공개</label>'+
'      </div>'+
'      <input type="button" class="btn btn-primary" id="signupbtn" value="Sign Up">'+
'    </form>'+
'  </div>'+
'</div>'+
'</div>'+
'	<div class="modal fade" id="mapModal">'+
'	  <div class="modal-dialog modal-lg">'+
'	    <div class="modal-content">'+
'	      <!-- Modal Header -->'+
'	      <div class="modal-header">'+
'	        <h4 class="modal-title">Select your Default Address</h4>'+
'	      </div>'+
'	      <div class="modal-body col-md-6">'+
'	      </div>'+
'	      <div class="modal-footer">'+
'	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>'+
'	      </div>'+
'	    </div>'+
'	  </div>'+
'	</div>';


$(document).ready(function(){
	$('#loginbtn').on('click',function(){
		$('#f').action = "login.do";
		$('#f').method = "post";
		$('#f').submit();
	});
	$('#signupbtn').on('click',function(){
		$('#f').action = "signup.do";
		$('#f').method = "post";
		$('#f').submit();
	});
});



