/**
 * 
 */

$(document).ready(function(){
	$('#nav-search-btn').on('click', function () {
		var category_name = $('#nav-search-bar').val();
		var searchurl = "search?category_name=" + category_name;
		location.href = searchurl;
	});
});