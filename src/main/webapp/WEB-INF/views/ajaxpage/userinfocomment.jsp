<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="col-sm-12">
<c:forEach var="i" items = "${clist}" begin="0" end="${clistlen}">
	<div class="row">
		<div class="col-sm-2">
			<a href="">${i.user_ID}</a>
		</div>
		<div class="col-sm-8">
			<p>${i.comment_WrittenWhen}</p>
			<p>${i.comment_Content}</p>
		</div>
	</div>
</c:forEach>
</div>