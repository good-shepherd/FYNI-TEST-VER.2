package com.fyni.domain;

import java.util.Date;

public class UserDTO {
	private String user_ID;
	private String user_PWD;
	private String user_Nickname;
	private int location_ID;
	private int user_EXP;
	private boolean user_Profile;
	private Date user_Date;

	public UserDTO(String user_ID, String user_PWD, String user_Nickname, int location_ID, int user_EXP,
			boolean user_Profile, Date user_Date) {
		super();
		this.user_ID = user_ID;
		this.user_PWD = user_PWD;
		this.user_Nickname = user_Nickname;
		this.location_ID = location_ID;
		this.user_EXP = user_EXP;
		this.user_Profile = user_Profile;
		this.user_Date = user_Date;
	}

	public UserDTO() {
		super();
	}

	public String getUser_ID() {
		return user_ID;
	}

	public void setUser_ID(String user_ID) {
		this.user_ID = user_ID;
	}

	public String getUser_PWD() {
		return user_PWD;
	}

	public void setUser_PWD(String user_PWD) {
		this.user_PWD = user_PWD;
	}

	public String getUser_Nickname() {
		return user_Nickname;
	}

	public void setUser_Nickname(String user_Nickname) {
		this.user_Nickname = user_Nickname;
	}

	public int getLocation_ID() {
		return location_ID;
	}

	public void setLocation_ID(int location_ID) {
		this.location_ID = location_ID;
	}

	public int getUser_EXP() {
		return user_EXP;
	}

	public void setUser_EXP(int user_EXP) {
		this.user_EXP = user_EXP;
	}

	public boolean isUser_Profile() {
		return user_Profile;
	}

	public void setUser_Profile(boolean user_Profile) {
		this.user_Profile = user_Profile;
	}

	public Date getUser_Date() {
		return user_Date;
	}

	public void setUser_Date(Date user_Date) {
		this.user_Date = user_Date;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UserDTO [user_ID=").append(user_ID).append(", user_PWD=").append(user_PWD)
				.append(", user_Nickname=").append(user_Nickname).append(", location_ID=").append(location_ID)
				.append(", user_EXP=").append(user_EXP).append(", user_Profile=").append(user_Profile)
				.append(", user_Date=").append(user_Date).append("]");
		return builder.toString();
	}

}
