<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.2.1.min.js"></script>
<script>
	$.getJSON("listAll.do", function(data) {
		var str = "";
		$(data).each(function() {
			str += "<li data-event_Id='" + this.event_ID + "' class='regular-search-result'>"
				+ this.event_ID + ": " + this.event_Title + "</li>";
		});
		$("#resultList").html(str);
	});
</script>
</head>
<body>
	<ul id="resultList">
	</ul>
</body>
</html>