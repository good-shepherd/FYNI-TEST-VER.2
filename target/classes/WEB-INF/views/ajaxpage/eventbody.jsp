<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container-fluid section-max-width">
	<div class="row">
		<div class="col-sm-8">
			<div class="col-sm-4">
				<h4>${event.event_Title}</h4>
			</div>
			<div class="col-sm-4">
				<a href="">${event.user_ID} </a>
				<p>조회수 ${event.event_Hit }, 추천수 ${event.event_Up }, 코멘트수</p>
			</div>
			<div class="col-sm-4">카테고리 ${event.category_ID }</div>
			<div class="col-sm-12">
				<img class="img-responsive max" src="images/colors.png" alt="" />
			</div>
			<div class="col-sm-6">
				<label class="control-label" for="event_WhenBegins">Start
					Date</label>
				<p id="event_WhenBegins">${event.event_WhenBegins}</p>
			</div>
			<div class="col-sm-6">
				<label class="control-label" for="event_WhenEnds">End Date</label>
				<p id="event_WhenEnds">${event.event_WhenEnds}</p>
			</div>
			<div class="col-sm-12">
				<p>주소: ${event.event_Address}</p>
				<p>내용: ${event.event_Content}</p>
				<c:if test="${user_ID == event.user_ID}">				   
					<input type="button" value="삭제" id="eventDelete" onclick="javascript:deleteEvent(${event.event_ID})">
					<input type="button" value="수정" id="eventUpdate" onclick="javascript:updateEvent(${event.event_ID})">
	     	    </c:if>
				<p hidden id="locX">${event.event_LocationX}</p>
				<p hidden id="locY">${event.event_LocationY}</p>
			</div>
			<c:if test="${user_id != null }">
				
				<input type="hidden" value="${event.event_ID }" id="eventid_forcomment">
				<div class="col-sm-12">
					<hr>
					<div class="row">
						<h4>코멘트 작성하기</h4>
						<div class="input-group">
							<textarea placeholder="내용을 작성하세요" id="comment_content" cols="87"rows="3" style="resize:none;display:block;"></textarea>
						</div>
						<button type="button" class="btn btn-primary pull-right" id="write-comment">코멘트 작성</button>
					</div>
				</div>
			</c:if>
			<!-- 코멘트 부분 -->
			<div id ="comment-body">
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
			</div>
		</div>
		<div id="map" class="col-sm-4" style="min-height: 400px;"></div>
	</div>
</div>


