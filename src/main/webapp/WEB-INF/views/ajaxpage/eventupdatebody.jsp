<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="main-div" class="container-fluid section-max-width">
<form id="form1" name="form1" method="post">
<fieldset>

<h4 align="center">Edit Event!</h4>

<div class="form-group">
  <label class=" control-label" for="event_Title">Title</label>  
  <div class="">
  <input id="event_Title" name="event_Title" type="text" placeholder="Title" class="form-control input-md" maxlength="15" value="${event.event_Title}">
    
  </div>
</div>

<div class="form-group">
  <label class=" control-label" for="event_Content">Description</label>
  <div class="">                     
    <textarea class="form-control" id="event_Content" rows="7" name="event_Content" maxlength="200">${event.event_Content}</textarea>
  </div>
</div>

<div class="form-group">
  <label class=" control-label" for="event_WhenBegins">Start Date</label>  
  <div class="">
  <input type="datetime-local" name="event_WhenBegins" id="event_WhenBegins" value="${event.event_WhenBegins}">  
  </div>
  <label class=" control-label" for="event_WhenEnds">End Date</label>  
  <div class="">
  <input type="datetime-local" name="event_WhenEnds" id="event_WhenEnds" value="${event.event_WhenEnds}">  
  </div>
</div>

<div class="form-group">
  <label class=" control-label" for="category_ID">Categories</label>
  <div class="">
    <select id="category_ID" name="category_ID" class="form-control">
      <option value="">카테고리</option>
	  <option value="1">사건사고</option>
   	  <option value="2">쇼핑정보</option>
 	  <option value="3">문화예술</option>
 	  <option value="4">키덜트</option>
 	  <option value="5">애기덜</option>
    </select>
  </div>
</div>
<input type="hidden" id ="event_ID" name="event_ID" value="${event.event_ID }">
<input type="hidden" id ="event_LocX" name="event_LocationX">
<input type="hidden" id ="event_LocY" name="event_LocationY">

<div class="form-group">
  <label class=" control-label" for="postcode">Find your place</label>
  <div class="">
	<input type="text" id="postcode" placeholder="우편번호">
	<input type="button" id="addressbtn" value="찾기">
	<input type="text" id="address" placeholder="주소" value="${event.event_Address}">
	<input type="text" id="address2" placeholder="상세주소">
  </div>  
</div>

<div class="form-group">
  <label class=" control-label" for="event_Picture">Upload your photo</label>
  <div class="">
    <input id="event_Picture" type="file" name="event_Picture">
  </div>
</div>
<input id="submitbtn" type="button" class="btn" value="EDIT!">
</fieldset>
</form>

<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
</div>
<<<<<<< HEAD
<script src="js/search.js"></script>
=======
<script type="text/javascript" src="js/search.js"></script>
>>>>>>> 901d1f1cf01d08a15fdbf000490b2b79476a5190
