package com.fyni.service;

import java.util.List;

import com.fyni.domain.EventDTO;
import com.fyni.domain.UserDTO;

public interface UserService {
	public int userCreate(UserDTO user);

	public UserDTO userRead(String user_ID);

	public int userUpdate(UserDTO user);

	public int userDelete(String user_ID);

	public List<UserDTO> userReadAll();

	public String userSignIn(String User_ID, String User_PWD);
	
	public List<EventDTO> userEventWritten(String user_ID);
	
	public int userPwdChange(String user_PWD, String user_ID);
}
