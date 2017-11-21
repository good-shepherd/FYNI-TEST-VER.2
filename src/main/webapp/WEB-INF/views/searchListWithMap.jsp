<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Insert title here</title>
</head>
<body>

	<div id="map" style="width: 500px; height: 500px;"></div>
	<script>
		var map = new naver.maps.Map('map',
			{
				center : new naver.maps.LatLng(37.3595704, 127.105399),
				zoom : 10
			});
	</script>
</body>
</html>