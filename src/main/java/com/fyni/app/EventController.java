package com.fyni.app;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.fyni.domain.EventDTO;
import com.fyni.service.EventServiceImpl;

@Controller
public class EventController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private EventServiceImpl service;

	/*@RequestMapping(value = "listAll.do", method = RequestMethod.GET)
	@ResponseBody
	public List<EventDTO> searchAll() throws Exception {
		List<EventDTO> list = service.eventReadAll();
		System.out.println(list);
		return list;
	}*/

	@RequestMapping(value = "eventCreate.do", method = RequestMethod.POST)
	public String eventCreate(String event_Title, String event_Content, String event_WhenBegins, String event_WhenEnds,
			MultipartFile event_Picture, HttpSession session) throws Exception {
		System.out.println(event_Title);
		System.out.println(event_Content);
		System.out.println(event_WhenBegins);
		System.out.println(event_WhenEnds);
		System.out.println(session.getAttribute("user_ID"));
		// System.out.println(event_Picture);
		EventDTO dto = new EventDTO();

		// 2017-01-01T01:00 -> YYYY-MM-DD HH:MM:SS
		StringBuffer sb = new StringBuffer();
		sb.append(event_WhenBegins.substring(0, 10)).append(" ").append(event_WhenBegins.substring(11)).append(":00");
		String begins = sb.toString();
		sb = new StringBuffer();
		sb.append(event_WhenEnds.substring(0, 10)).append(" ").append(event_WhenEnds.substring(11)).append(":00");
		String ends = sb.toString();

		dto.setEvent_Title(event_Title);
		dto.setEvent_Content(event_Content);
		dto.setEvent_WhenBegins(begins);
		dto.setEvent_WhenEnds(ends);
		int result = service.eventCreate(dto);
		if (result < 1) {
			return "fail";
		} else {
			return "success";
		}

	}

	@RequestMapping(value = "writeanevent", method = RequestMethod.GET)
	public String writeAnEvent() {
		return "writeanevent";
	}

}
