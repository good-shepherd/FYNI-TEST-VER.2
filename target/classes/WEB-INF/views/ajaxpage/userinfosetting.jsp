<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="row">
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
    		<form role="form" id="sign_up_form" method="post" action="cngingpwd">
    			<h2 class="sign_up_title">New password</h2>
    			<div class="form-group">
    				<input type="password" name="user_PWD" id="cngedpwd" class="form-control input-lg" placeholder="New password" tabindex="4">
    			</div>
    			<div class="row">
    				<div class="col-xs-12 col-md-12"><a href="javascript:cngingpwd()" class="btn btn-success btn-block btn-lg">Save</a></div>
    			</div>
    		</form>
    	</div>
    </div>