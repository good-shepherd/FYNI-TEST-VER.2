package com.fyni.app;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
		List<String> coord = new ArrayList<String>();
		for (EventDTO dto : list) {
			String tmp = dto.getEvent_Address();
			System.out.println(tmp);
			if (tmp != null) {
				coord.add(dto.getEvent_LocationX().concat(" ").concat(dto.getEvent_LocationY()));
				Matcher m = Pattern.compile("\\(([^)]+)\\)").matcher(tmp);
				while (m.find()) {
					dto.setEvent_Address(m.group(1));
				}
			}
		}
		int listSize = list.size();
		int coordListSize = coord.size();
		System.out.println(coordListSize);
		mav.addObject("list", list);
		mav.addObject("coordlist", coord);
		mav.addObject("coordlistsize", coordListSize);
		mav.addObject("listsize", listSize);
		return mav;
	}

	// @RequestMapping(value = "")

}
