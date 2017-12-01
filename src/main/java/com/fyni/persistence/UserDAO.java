package com.fyni.persistence;

import java.util.List;

import com.fyni.domain.EventDTO;
import com.fyni.domain.UserDTO;

public interface UserDAO {

	public int userCreate(UserDTO user);

	public UserDTO userRead(String user_ID);

	public int userUpdate(UserDTO user);

	public int userDelete(String user_ID);

	public List<UserDTO> userReadAll();

	public String userSignIn(String user_ID, String user_PWD);
	
	public List<EventDTO> userEventWritten(String user_ID);
}
