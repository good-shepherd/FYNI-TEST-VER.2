package com.fyni.app;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fyni.domain.UserDTO;
import com.fyni.persistence.UserDAO;

@Controller
public class UserController {
	
	@Autowired
	DataSource ds;

	@Autowired
	UserDAO userDao;
	
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(@RequestParam("user_ID") String user_ID, @RequestParam("user_PWD") String user_PWD,
			HttpSession session, Model model) {
		String loginInfo = userDao.userSignIn(user_ID.trim(), user_PWD.trim());
		if (loginInfo == null) {
			model.addAttribute("msg", "failed");
			return "login";
		} else {
			session.setAttribute("user_ID", user_ID);
			return "home";
		}
	}
	@RequestMapping("search.do")
	public String searchBody() {
		System.out.println("you have reached here");
		return "searchListWithMap";
	}
	
	@RequestMapping("signup.do")
	public String signUp(UserDTO user, Model model) {
		int count = 0;
		System.out.println(user);
		if("".equals(user.getUser_ID().trim())) {
			count = -1;
		}else if("".equals(user.getUser_PWD().trim())) {
			count = -1;
		}else if("".equals(user.getUser_Nickname().trim())) {
			count = -1;
		}
		if(count == 0) {
			count = userDao.userCreate(user);
		}
		if(count < 1) {
			model.addAttribute("signupmsg","failed");
			return "signup";
		}else {
			return "home";
		}
	}
	
	@RequestMapping("login")
	public String mainLogin() {
		return "login";
	}
	
	@RequestMapping("signup")
	public String mainSignup() {
		return "signup";
	}
	
	@RequestMapping("signupreq")
	public String signupreq() {
		return "ajaxpage/signupbody";		
	}
	
	@RequestMapping("loginreq")
	public String loginreq() {
		return "ajaxpage/loginbody";		
	}
	
}
