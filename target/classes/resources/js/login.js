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
'  <form role="form">'+
    '<div class="form-group">'+
      '<label for="inputUsernameEmail">Email</label>'+
      '<input type="text" class="form-control" id="inputUsernameEmail">'+
    '</div>'+
    '<div class="form-group">'+
      '<a class="pull-right" href="#">Forgot password?</a>'+
      '<label for="inputPassword">Password</label>'+
      '<input type="password" class="form-control" id="inputPassword">'+
    '</div>'+
    '<div class="checkbox pull-right"> '+
      '<label> '+
        '<input type="checkbox"> '+
        'Remember me </label> '+
    '</div> '+
    '<button type="submit" class="btn btn-primary"> '+
      'Log In ' +
    '</button> ' +
  '</form> '+
'</div>' + 
'</div>'

var signupform = 
	'<div class="col-md-4 col-md-offset-4"> '+
	'<div class="row">' +
	'<div class="main">' +
	'  <h3>Sign Up for FYNI</h3>' +
	'  <div class="row"> ' + 
	'    <div class="col-xs-6 col-sm-6 col-md-6">'+
	'<a href="#" class="btn btn-lg btn-primary btn-block">Facebook</a>' +
	'</div>'+
	'<div class="col-xs-6 col-sm-6 col-md-6">' + 
	'<a href="#" class="btn btn-lg btn-info btn-block">Google</a>' +
	'</div>'+
	'</div>'+
	'<div class="login-or">'+
	'<hr class="hr-or">'+
	'<span class="span-or">or</span>'+
	'</div>'+
	'<form role="form">'+
	'<div class="form-group">'+
	'<label for="signup-user-id">Email</label>'+
	'<input type="text" class="form-control" id="signup-user-id"'+
	'name="user_ID">'+
	'</div>'+
	'<div class="form-group">'+
	'<label for="inputPassword">Password</label>'+
	'<input type="password" class="form-control" id="signup-user-pwd"'+
	'name="user_PWD">'+
	'</div>'+
	'<div class="form-group">'+
	'<label for="inputPassword">Nickname</label>'+
	'<input type="password" class="form-control" id="signup-user-nickname"'+
	'name="user_PWD">'+
	'</div>'+
	'<div class="form-group">'+
	' <label for="inputPassword">Default Location</label><small> optional</small>'+
	'<input type="text" style="border-radius:3px" id="signup-user-address"'+
	'name="user_Address" disabled>'+
	'<button class="btn-primary pull-right" style="border-radius:3px">Find address</button>'+
	'</div>'+
	'<div class="checkbox pull-right">'+
	'<label><input type ="checkbox">프로필 공개</label>' + 
	'</div>'+ 
	'<button type="submit" class="btn btn-primary"> '+
	'Sign Up ' + 
	'  </button>' + 
	'</form> '+
	'</div>' +
	'</div>' + 
	'</div>';

function cngsignup(){
	$.ajax({
		context : $('#here-to-change').html(signupform)
	});
}

function cnglogin(){
	$.ajax({
		context : $('#here-to-change').html(loginform)
	});
}
$(document).ready(function(){
});



