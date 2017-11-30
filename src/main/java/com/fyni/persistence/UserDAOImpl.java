package com.fyni.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fyni.domain.LoginDTO;
import com.fyni.domain.UserDTO;

@Repository("userDao")
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession session;

	@Autowired
	private static String namespace = "com.fyni.mapper.userMapper";

	@Override
	public int userCreate(UserDTO user) {
		System.out.println(user);
		return session.insert(namespace + ".userCreate", user);
	}

	@Override
	public UserDTO userRead(String user_ID) {
		return session.selectOne(namespace + ".userRead", user_ID);
	}

	@Override
	public int userUpdate(UserDTO user) {
		return session.update(namespace + ".userUpdate", user);
	}

	@Override
	public int userDelete(String user_ID) {
		return session.delete(namespace + ".userDelete", user_ID);
	}

	@Override
	public List<UserDTO> userReadAll() {
		return session.selectList(namespace + ".userReadAll");
	}

	@Override
	public String userSignIn(String user_ID, String user_PWD) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_ID",user_ID);
		map.put("user_PWD", user_PWD);
		return session.selectOne(namespace + ".userSignIn", map);
	}

}
