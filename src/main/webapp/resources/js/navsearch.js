/**
 * 
 */

$(document).ready(function(){
	var searchAction = function () {
		var category_name = $('#nav-search-bar').val();
		var searchurl = "search?category_name=" + category_name;
		location.href = searchurl;
	}
	
	$('#nav-search-btn').on('click', searchAction);
});