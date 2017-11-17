package com.fyni.domain;

public class EventReportDTO {
	private int event_ID;
	private String user_ID;
	private String report_Content;
	private String report_Category;

	public int getEvent_ID() {
		return event_ID;
	}

	public void setEvent_ID(int event_ID) {
		this.event_ID = event_ID;
	}

	public String getUser_ID() {
		return user_ID;
	}

	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}

	public String getReport_Content() {
		return report_Content;
	}

	public void setReport_Content(String report_Content) {
		this.report_Content = report_Content;
	}

	public String getReport_Category() {
		return report_Category;
	}

	public void setReport_Category(String report_Category) {
		this.report_Category = report_Category;
	}

	public EventReportDTO(int event_ID, String user_ID, String report_Content, String report_Category) {
		super();
		this.event_ID = event_ID;
		this.user_ID = user_ID;
		this.report_Content = report_Content;
		this.report_Category = report_Category;
	}

	public EventReportDTO() {
		super();
	}

	@Override
	public String toString() {
		return "EventReportDTO [event_ID=" + event_ID + ", user_ID=" + user_ID + ", report_Content=" + report_Content
				+ ", report_Category=" + report_Category + "]";
	}

}
