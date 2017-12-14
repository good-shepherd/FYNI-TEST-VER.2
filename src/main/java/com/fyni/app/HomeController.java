package com.fyni.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fyni.service.EventServiceImpl;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		return "index";
	}
	
	@RequestMapping(value = "home.go", method = RequestMethod.POST)
	public String homeGo() {
		return "ajaxpage/indexbody";
	}

	@RequestMapping("/error/404")
	public String error404(Model model) {
		model.addAttribute("msg", "404");
		return "errorpage/error";
	}
	@RequestMapping("/error/400")
	public String error400(Model model) {
		model.addAttribute("msg", "400");
		return "errorpage/error";
	}
	@RequestMapping("/error/500")
	public String error500(Model model) {
		model.addAttribute("msg", "500");
		return "errorpage/error";
	}
}
