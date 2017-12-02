package com.fyni.app;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fyni.domain.EventDTO;
import com.fyni.service.EventServiceImpl;

@Controller
public class EventController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private EventServiceImpl service;

	/*
	 * @RequestMapping(value = "listAll.do", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public List<EventDTO> searchAll() throws Exception {
	 * List<EventDTO> list = service.eventReadAll(); System.out.println(list);
	 * return list; }
	 */

	@RequestMapping(value = "eventCreate.do", method = RequestMethod.POST)
	public ModelAndView eventCreate(String event_Title, String event_Content, String event_WhenBegins,
			String event_WhenEnds, int category_ID, String event_Address, String event_LocX, String event_LocY,
			HttpSession session) throws Exception {
		Object userid = session.getAttribute("user_ID");
		// 2017-01-01T01:00 -> YYYY-MM-DD HH:MM:SS
		StringBuffer sb = new StringBuffer();
		sb.append(event_WhenBegins.substring(0, 10)).append(" ").append(event_WhenBegins.substring(11)).append(":00");
		String begins = sb.toString();
		sb = new StringBuffer();
		sb.append(event_WhenEnds.substring(0, 10)).append(" ").append(event_WhenEnds.substring(11)).append(":00");
		String ends = sb.toString();
		EventDTO dto = new EventDTO();
		dto.setEvent_Title(event_Title);
		dto.setEvent_Content(event_Content);
		dto.setEvent_WhenBegins(begins);
		dto.setEvent_WhenEnds(ends);
		dto.setCategory_ID(category_ID);
		dto.setEvent_Address(event_Address);
		dto.setEvent_LocationX(event_LocX);
		dto.setEvent_LocationY(event_LocY);
		dto.setUser_ID(userid.toString());
		service.eventCreate(dto);
		ModelAndView mav = new ModelAndView("ajaxpage/eventbody");
		mav.addObject("event", dto);
		return mav;

	}

	@RequestMapping(value = "writeanevent", method = RequestMethod.GET)
	public String writeAnEvent(HttpSession session) {
		Object userid = session.getAttribute("user_ID");
		if (userid == null) {
			return "login";
		}
		return "writeanevent";
	}

	@RequestMapping(value = "eventRead.do", method = RequestMethod.POST)
	public ModelAndView eventReadOne(String event_ID) throws Exception {
		ModelAndView mav = new ModelAndView("ajaxpage/eventbody");
		EventDTO event = service.eventRead(Integer.parseInt(event_ID.trim()));
		mav.addObject("event", event);
		return mav;
	}

}
