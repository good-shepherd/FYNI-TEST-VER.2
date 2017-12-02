<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="col-sm-12">
	<hr>
	<div class="row">
<c:forEach var="i" items = "${list } " begin="0" end="${listlen }">
		<div class="col-sm-2">
			<a href="">${i.user_ID }</a>
		</div>
		<div class="col-sm-8">
			<p>${i.comment_When }</p>
			<p>${i.coment_Content }</p>
			<div class="row">
			</div>
			</div>
			<div class="col-sm-2">추천 or 비추천 (도움? or 안도)</div>
</c:forEach>
	</div>
</div>