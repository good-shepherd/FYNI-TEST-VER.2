package com.fyni.app;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fyni.domain.EventDTO;
import com.fyni.service.EventServiceImpl;

@Controller
public class ListController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private EventServiceImpl service;
	
	@RequestMapping(value = "eventRead.do", method = RequestMethod.GET)
	public ModelAndView eventReadOne(String event_ID) throws Exception {
		ModelAndView mav = new ModelAndView("event");
		EventDTO event = service.eventRead(Integer.parseInt(event_ID.trim()));
		mav.addObject("event", event);
		return mav;
	}
}
