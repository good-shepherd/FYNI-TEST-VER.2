package com.fyni.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fyni.domain.EventDTO;
import com.fyni.domain.UserDTO;
import com.fyni.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;

	@Override
	public int userCreate(UserDTO user) {
		return dao.userCreate(user);
	}

	@Override
	public UserDTO userRead(String user_ID) {
		return dao.userRead(user_ID);
	}

	@Override
	public int userUpdate(UserDTO user) {
		return dao.userUpdate(user);
	}

	@Override
	public int userDelete(String user_ID) {
		return dao.userDelete(user_ID);
	}

	@Override
	public List<UserDTO> userReadAll() {
		return dao.userReadAll();
	}

	@Override
	public String userSignIn(String user_ID, String user_PWD) {
		return dao.userSignIn(user_ID, user_PWD);
	}

	@Override
	public List<EventDTO> userEventWritten(String user_ID) {
		return dao.userEventWritten(user_ID);
	}

	@Override
	public int userPwdChange(String user_PWD, String user_ID) {
		return dao.userPwdChange(user_PWD, user_ID);
	}

}
