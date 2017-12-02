/**
 * 
 */

function navbarSearch() {
	var category_name = $('#nav-search-bar').val();
	var searchurl = "search?category_name=" + category_name;
	location.href = searchurl;
}

$(document).ready(function(){
	$('#nav-search-btn').on('click', navbarSearch);
	$('#nav-search-bar').keypress(function(e){if(e.which == 13){$('#nav-search-btn').click();}});
});