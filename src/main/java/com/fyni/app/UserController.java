package com.fyni.app;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fyni.domain.LoginDTO;
import com.fyni.persistence.UserDAO;

@Controller
public class UserController {
	@Autowired
	DataSource ds;
	
	@Autowired
	UserDAO userDao;
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)	
	@ResponseBody
	public String logForm(@RequestParam("user_ID") String user_ID, @RequestParam("user_PWD") String user_PWD,
			HttpSession session){
		System.out.println("user_ID : " + user_ID + "   user_PWD : " + user_PWD);
		LoginDTO login = userDao.userSignIn(user_ID.trim(), user_PWD.trim());
		System.out.println(login);
		if(login == null) {
			System.out.println("·Î±×ÀÎ ½ÇÆÐ");
			return "fail";
		}else {
			session.setAttribute("user_ID", user_ID);
			return user_ID;
		}
	}
}
