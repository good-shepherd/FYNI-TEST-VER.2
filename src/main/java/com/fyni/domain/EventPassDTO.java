package com.fyni.domain;

import java.sql.Date;

public class EventPassDTO {
	private String event_Title;
	private String event_Content;
	private Date event_When;
	private String event_Picture;
	private int category_ID;
	private int location_ID;
	private String user_ID;
	@Override
	public String toString() {
		return "EventPassDTO [event_Title=" + event_Title + ", event_Content=" + event_Content + ", event_When="
				+ event_When + ", event_Picture=" + event_Picture + ", category_ID=" + category_ID + ", location_ID="
				+ location_ID + ", user_ID=" + user_ID + "]";
	}
	public EventPassDTO() {
		super();
	}
	public EventPassDTO(String event_Title, String event_Content, Date event_When, int category_ID, int location_ID,
			String user_ID) {
		super();
		this.event_Title = event_Title;
		this.event_Content = event_Content;
		this.event_When = event_When;
		this.category_ID = category_ID;
		this.location_ID = location_ID;
		this.user_ID = user_ID;
	}
	public String getEvent_Title() {
		return event_Title;
	}
	public void setEvent_Title(String event_Title) {
		this.event_Title = event_Title;
	}
	public String getEvent_Content() {
		return event_Content;
	}
	public void setEvent_Content(String event_Content) {
		this.event_Content = event_Content;
	}
	public Date getEvent_When() {
		return event_When;
	}
	public void setEvent_When(Date event_When) {
		this.event_When = event_When;
	}
	public String getEvent_Picture() {
		return event_Picture;
	}
	public void setEvent_Picture(String event_Picture) {
		this.event_Picture = event_Picture;
	}
	public int getCategory_ID() {
		return category_ID;
	}
	public void setCategory_ID(int category_ID) {
		this.category_ID = category_ID;
	}
	public int getLocation_ID() {
		return location_ID;
	}
	public void setLocation_ID(int location_ID) {
		this.location_ID = location_ID;
	}
	public String getUser_ID() {
		return user_ID;
	}
	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}
	


}
