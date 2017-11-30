package com.fyni.domain;

import java.util.Date;

public class UserDTO {
	private String user_ID;
	private String user_PWD;
	private String user_Nickname;
	private String user_Address;
	private String user_LocationX;
	private String user_LocationY;
	private int user_EXP;
	private boolean user_Profile;
	private Date user_Date;
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
	public String getUser_Address() {
		return user_Address;
	}
	public void setUser_Address(String user_Address) {
		this.user_Address = user_Address;
	}
	public String getUser_LocationX() {
		return user_LocationX;
	}
	public void setUser_LocationX(String user_LocationX) {
		this.user_LocationX = user_LocationX;
	}
	public String getUser_LocationY() {
		return user_LocationY;
	}
	public void setUser_LocationY(String user_LocationY) {
		this.user_LocationY = user_LocationY;
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
		return "UserDTO [user_ID=" + user_ID + ", user_PWD=" + user_PWD + ", user_Nickname=" + user_Nickname
				+ ", user_Address=" + user_Address + ", user_LocationX=" + user_LocationX + ", user_LocationY="
				+ user_LocationY + ", user_EXP=" + user_EXP + ", user_Profile=" + user_Profile + ", user_Date="
				+ user_Date + "]";
	}
	public UserDTO(String user_ID, String user_PWD, String user_Nickname, String user_Address, String user_LocationX,
			String user_LocationY, int user_EXP, boolean user_Profile, Date user_Date) {
		super();
		this.user_ID = user_ID;
		this.user_PWD = user_PWD;
		this.user_Nickname = user_Nickname;
		this.user_Address = user_Address;
		this.user_LocationX = user_LocationX;
		this.user_LocationY = user_LocationY;
		this.user_EXP = user_EXP;
		this.user_Profile = user_Profile;
		this.user_Date = user_Date;
	}
	public UserDTO() {
		super();
	}
	public UserDTO(String user_ID, String user_PWD, String user_Nickname, String user_Address, String user_LocationX,
			String user_LocationY, boolean user_Profile, Date user_Date) {
		super();
		this.user_ID = user_ID;
		this.user_PWD = user_PWD;
		this.user_Nickname = user_Nickname;
		this.user_Address = user_Address;
		this.user_LocationX = user_LocationX;
		this.user_LocationY = user_LocationY;
		this.user_Profile = user_Profile;
		this.user_Date = user_Date;
	}
	
}
