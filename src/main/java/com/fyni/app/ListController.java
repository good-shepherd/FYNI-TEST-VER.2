package com.fyni.app;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fyni.domain.EventDTO;
import com.fyni.service.EventServiceImpl;

@Controller
public class ListController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private EventServiceImpl service;
	
	
	@RequestMapping(value = "eventReadByCategory.do", method = RequestMethod.GET)
	public String eventReadByCategory(String category_name, Model model) throws Exception {
		List<EventDTO> list = service.eventReadByCategory(category_name);
		model.addAttribute("list", list);
		return "list";
	}
}
