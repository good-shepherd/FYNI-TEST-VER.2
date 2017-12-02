package com.fyni.app;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fyni.domain.EventDTO;
import com.fyni.service.EventServiceImpl;

@Controller
public class SearchController {

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	@Autowired
	private EventServiceImpl service;

	@RequestMapping(value = "search", method = RequestMethod.GET)
	public ModelAndView eventReadByCategory(
			@RequestParam(value = "category_name", required = false) String category_name) throws Exception {
		ModelAndView mav = new ModelAndView("search");
		List<EventDTO> list;
		if ("".equals(category_name.trim())) {
			list = service.eventReadAll();
		} else {
			list = service.eventReadByCategory(category_name);
		}
		System.out.println("listsize: " + list.size());
		mav.addObject("list", list);
		return mav;
	}

	// @RequestMapping(value = "")

}
