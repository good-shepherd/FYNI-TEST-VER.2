package com.fyni.domain;

import java.sql.Timestamp;

public class CommentDTO {
	private int comment_ID;
	private String comment_Content;
	private int comment_Up;
	private int comment_Down;
	private Timestamp comment_WrittenWhen;
	private int event_ID;
	private String user_ID;

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CommentDTO [comment_ID=").append(comment_ID).append(", comment_Content=")
				.append(comment_Content).append(", comment_Up=").append(comment_Up).append(", comment_Down=")
				.append(comment_Down).append(", comment_WrittenWhen=").append(comment_WrittenWhen).append(", event_ID=")
				.append(event_ID).append(", user_ID=").append(user_ID).append("]");
		return builder.toString();
	}

	public int getComment_ID() {
		return comment_ID;
	}

	public void setComment_ID(int comment_ID) {
		this.comment_ID = comment_ID;
	}

	public String getComment_Content() {
		return comment_Content;
	}

	public void setComment_Content(String comment_Content) {
		this.comment_Content = comment_Content;
	}

	public int getComment_Up() {
		return comment_Up;
	}

	public void setComment_Up(int comment_Up) {
		this.comment_Up = comment_Up;
	}

	public int getComment_Down() {
		return comment_Down;
	}

	public void setComment_Down(int comment_Down) {
		this.comment_Down = comment_Down;
	}

	public Timestamp getComment_WrittenWhen() {
		return comment_WrittenWhen;
	}

	public void setComment_WrittenWhen(Timestamp comment_WrittenWhen) {
		this.comment_WrittenWhen = comment_WrittenWhen;
	}

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

	public CommentDTO(int comment_ID, String comment_Content, int comment_Up, int comment_Down,
			Timestamp comment_WrittenWhen, int event_ID, String user_ID) {
		super();
		this.comment_ID = comment_ID;
		this.comment_Content = comment_Content;
		this.comment_Up = comment_Up;
		this.comment_Down = comment_Down;
		this.comment_WrittenWhen = comment_WrittenWhen;
		this.event_ID = event_ID;
		this.user_ID = user_ID;
	}

	public CommentDTO() {
		super();
	}

}
