package com.fyni.app;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fyni.domain.EventDTO;
import com.fyni.domain.UserDTO;
import com.fyni.service.CommentService;
import com.fyni.service.EventService;
import com.fyni.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService service;
	@Autowired
	EventService eservice;
	@Autowired
	CommentService cservice;
	@Autowired
	HttpSession session;
	
	
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(@RequestParam("user_ID") String user_ID, @RequestParam("user_PWD") String user_PWD,
		Model model) {
		String loginInfo = service.userSignIn(user_ID.trim(), user_PWD.trim());
		if (loginInfo == null) {
			model.addAttribute("msg", "failed");
			return "login";
		} else {
			session.setAttribute("user_ID", user_ID);
			session.setAttribute("user_Nickname", service.userRead(user_ID).getUser_Nickname());
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
		if("".equals(user.getUser_ID().trim())) {
			count = -1;
		}else if("".equals(user.getUser_PWD().trim())) {
			count = -1;
		}else if("".equals(user.getUser_Nickname().trim())) {
			count = -1;
		}
		
		UserDTO usr = service.userRead(user.getUser_ID());
		if(usr != null) {
			count = 2; 
		}
		if(count == 0) {
			count = service.userCreate(user);
		}
		if(count < 1) {
			model.addAttribute("signupmsg","failed");
			return "signup";
		}else if(count == 2){
			model.addAttribute("signupmsg", "exist");
			return "signup";
		}
		else {
			return "home";
		}
	}
	
	@RequestMapping("logout")
	public String logout() {
		session.removeAttribute("user_ID");
		return "home";
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
	
	@RequestMapping("userinfo")
	public String userinfo(Model model) {
		String user_ID = (String)session.getAttribute("user_ID");
		if(user_ID == null) {
			return "login";
		}
		List<EventDTO> list = service.userEventWritten(user_ID);
		model.addAttribute("list", list);
		model.addAttribute("listlen", list.size());
		return "userinfo";
	}
	
	@RequestMapping("userlist")
	public String userlist(Model model) {
		String userid = (String)session.getAttribute("user_ID");
		List<EventDTO> list = service.userEventWritten(userid);

		model.addAttribute("list", list);
		model.addAttribute("listlen", list.size());

		return "ajaxpage/userinfolist";
	}
	@RequestMapping("cngpwd")
	public String cngpwd() {
		return "ajaxpage/userinfosetting";
	}
	
	@RequestMapping("cngingpwd")
	public String cngingpwd(String user_PWD) {
		String user_ID = (String)session.getAttribute("user_ID");
		service.userPwdChange(user_PWD, user_ID);
		return "home";
	}
	
	@RequestMapping("delaccount")
	public String delaccount() {
		int count = 0;
		String user = (String)session.getAttribute("user_ID");
		count = service.userDelete(user);
		if(count < 1) {
			return "userinfo";
		}else {
			session.removeAttribute("user_ID");
			return "home";
		}
		
	}
}
