package com.fyni.domain;

public class LoginDTO {
	String user_ID;
	String user_PWD;
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
	@Override
	public String toString() {
		return "LoginDTO [user_ID=" + user_ID + ", user_PWD=" + user_PWD + "]";
	}
	public LoginDTO(String user_ID, String user_PWD) {
		super();
		this.user_ID = user_ID;
		this.user_PWD = user_PWD;
	}
	public LoginDTO() {
		super();
	}
	
}