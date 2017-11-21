package com.fyni.app;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fyni.domain.EventDTO;
import com.fyni.service.EventServiceImpl;

@RestController
public class EventController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private EventServiceImpl service;

	@RequestMapping(value = "listAll.do", method = RequestMethod.GET)
	public List<EventDTO> searchAll(ModelAndView mav) throws Exception {
		List<EventDTO> list = service.eventReadAll();
		mav.addObject(list);
		mav.setViewName("list");
		System.out.println(list);
		System.out.println(mav);
		return list;
	}
}
