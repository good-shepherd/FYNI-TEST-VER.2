<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach var="i" items="${list}" begin="0" end="${listlen }">
	<a id="list-individual-item" href="javascript:searchResult(${i.event_ID})" class="list-group-item">
		<div class="row">
			<div class="col-sm-8">
			<h4 class="list-group-item-heading">${i.event_Title}</h4>
			<p class="list-group-item-text">${i.event_Content}</p>
			</div>
			<div class="col-sm-4">${i.event_Address}</div>
		</div>
		</a>
</c:forEach>