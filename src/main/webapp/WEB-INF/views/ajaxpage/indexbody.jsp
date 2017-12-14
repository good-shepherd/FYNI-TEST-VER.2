<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="main-div" class="container-fluid section-max-width">
<video autoplay loop poster class="bg" src="http://static.videezy.com/system/resources/previews/000/000/328/original/bokeh2.mp4">
</video>
<div class="bg-filter">
</div>
<center>
	<section class="section-max-width section-min-height">
		<div id="main-top-section" class="row">
			<div id="landing-page-helloworld">
			<br><br><h1>Hello, FYNI!</h1>
			</div>
			<div id="main-search-bar" class="input-group">
		   		<input id="main-search-input" type="text" class="form-control" placeholder="placeholder content" aria-describedby="contentaddon1">
	    		<span id="main-search-button" class="input-group-addon">Search</span>
			</div>
		</div>
	</section>
</center>
</div>
<script>
var searchAction = function searchbypage() {
	var category_name = $('#main-search-input').val();
	var searchurl = "search?category_name=" + category_name + "&page=1";
	location.href = searchurl;
}
$('#main-search-button').on('click', searchAction);
$('#searchNav').on('click', searchNavAction);
$('#main-search-input').keypress(function(e){if(e.which == 13){$('#main-search-button').click();}});
</script>
