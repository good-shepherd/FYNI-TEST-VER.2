package com.fyni.domain;

public class CommentReportDTO {
	private int event_ID;
	private int comment_ID;
	private String report_Content;
	private String report_Category;

	public int getEvent_ID() {
		return event_ID;
	}

	public void setEvent_ID(int event_ID) {
		this.event_ID = event_ID;
	}

	public int getComment_ID() {
		return comment_ID;
	}

	public void setComment_ID(int comment_ID) {
		this.comment_ID = comment_ID;
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

	@Override
	public String toString() {
		return "CommentReportDTO [event_ID=" + event_ID + ", comment_ID=" + comment_ID + ", report_Content="
				+ report_Content + ", report_Category=" + report_Category + "]";
	}

	public CommentReportDTO(int event_ID, int comment_ID, String report_Content, String report_Category) {
		super();
		this.event_ID = event_ID;
		this.comment_ID = comment_ID;
		this.report_Content = report_Content;
		this.report_Category = report_Category;
	}

	public CommentReportDTO() {
		super();
	}

}
