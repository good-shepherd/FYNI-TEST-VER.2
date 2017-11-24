<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/index.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=NpUtXPkJkj1DI50B8uA9"></script>
<title>Insert title here</title>
<script type="text/javascript" src="js/login.js"></script>
<script>
$(document).ready(function(){
var map = new naver.maps.Map('main_map',
	{
		center : new naver.maps.LatLng(37.3595704, 127.105399),
		zoom : 10
	});
});
	
</script>
</head>
<body>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-8">
					<ul id="resultList" class="modal-text-color">
					<c:forEach var="i" items="${list}" begin="1" end="10">
					<li>
					${i.event_Title }					
					</li>
					 </c:forEach>
					</ul>
				</div>
				<div id="main_map" class="col-md-4">
				</div>
			</div>
		</div>
	
	<!-- Login modal-->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" style="display: inline">LOG IN</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body modal-text-color">
					<label for="user_ID_Modal">ID</label> <input type="text" id="user_ID_Modal"> <br>
					 <label>PASSWORD</label><input type="password" id="user_PWD">
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="loginbtn">LOG IN</button>
				</div>

			</div>
		</div>
	</div>
	<!-- modal modal modal modal -->

	<!-- 임시 이벤트 작성 폼 -->
	<div class="modal fade" id="eventModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title text-primary h1" style="display: inline">Event</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body modal-text-color">
					<form id = "eventf" enctype="multipart/form-data">
						<input type="hidden" value="${user_ID }">
						<!-- 드롭다운같은걸로다가 카테고리 선택하는거 추가하기 -->
						<label for="title">Title</label> 
						<input type="text" name = "title"> <br> 
						<label for="content">Content</label> 
						<textarea class="form-control" name = "content" id = "content" rows="3"></textarea><br>
						<label for="when">Duration</label>
						<input type="datetime" name="when"id="when">
						<label for="picture">Picture	Upload</label> 
						<input type="file" name="picture"> <br>
					</form>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="eventWritebtn">Write an event</button>
				</div>

			</div>
		</div>
	</div>

</body>
</html>