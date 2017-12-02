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
				<p hidden id="locX">${event.event_LocationX}</p>
				<p hidden id="locY">${event.event_LocationY}</p>
			</div>
			<div class="col-sm-12">
				<hr>
				<div class="row">
					<div class="col-sm-2">
						<a href="">누구누구</a>
					</div>
					<div class="col-sm-8">
						<p>코멘트작성시간</p>
						<p>내용</p>
						<div class="row">
							<div class="col-sm-4">
								<img class="img-responsive"
									src="images/Carousel_Placeholder.png" alt="" />
							</div>
							<div class="col-sm-4">
								<img class="img-responsive"
									src="images/Carousel_Placeholder.png" alt="" />
							</div>
							<div class="col-sm-4">
								<img class="img-responsive"
									src="images/Carousel_Placeholder.png" alt="" />
							</div>
						</div>


					</div>
					<div class="col-sm-2">추천 or 비추천 (도움? or 안도)</div>
				</div>
				<hr>

			</div>

		</div>
		<div id="map" class="col-sm-4" style="min-height: 400px;"></div>
	</div>
</div>