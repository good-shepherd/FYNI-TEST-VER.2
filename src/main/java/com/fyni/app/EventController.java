package com.fyni.app;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fyni.domain.EventDTO;
import com.fyni.service.EventServiceImpl;

@RestController
public class EventController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private EventServiceImpl service;

	@RequestMapping(value = "listAll.do", method = RequestMethod.GET)
	public List<EventDTO> searchAll() throws Exception {
		List<EventDTO> list = service.eventReadAll();
		System.out.println(list);
		return list;
	}

	@RequestMapping(value = "eventCreate.do", method = RequestMethod.POST)
	public String eventCreate(EventDTO dto, String title, String content, MultipartFile file) throws Exception {
		dto.setEvent_Content(content);
		dto.setEvent_Title(title);
		int result = service.eventCreate(dto);
		if (result < 1) {
			return "fail";
		} else {
			return "success";
		}
	}

}
